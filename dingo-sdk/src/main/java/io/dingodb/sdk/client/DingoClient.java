/*
 * Copyright 2021 DataCanvas
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.dingodb.sdk.client;

import io.dingodb.common.CommonId;
import io.dingodb.common.Location;
import io.dingodb.common.codec.KeyValueCodec;
import io.dingodb.common.partition.PartitionStrategy;
import io.dingodb.common.partition.RangeStrategy;
import io.dingodb.common.store.KeyValue;
import io.dingodb.common.table.AvroKeyValueCodec;
import io.dingodb.common.table.DingoKeyValueCodec;
import io.dingodb.common.table.TableDefinition;
import io.dingodb.common.util.ByteArrayUtils;
import io.dingodb.meta.Part;
import io.dingodb.net.api.ApiRegistry;
import io.dingodb.server.api.ExecutorApi;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;

@Slf4j
public class DingoClient extends ClientBase {
    private MetaClient metaClient;

    private ApiRegistry apiRegistry;
    private CommonId tableId;
    private KeyValueCodec codec;
    private NavigableMap<ByteArrayUtils.ComparableByteArray, Part> parts;
    private NavigableMap<ByteArrayUtils.ComparableByteArray, ExecutorApi> partsApi;
    private PartitionStrategy<ByteArrayUtils.ComparableByteArray> ps;

    /**
     * Operation Utils.
     */
    private StoreOperationUtils storeOpUtils;

    public static Integer retryTimes = 100;
    public static volatile boolean isConnectionInit = false;


    public DingoClient(String coordinatorExchangeSvrList) {
        this(coordinatorExchangeSvrList, retryTimes);
    }

    public DingoClient(String coordinatorExchangeSvrList, Integer retryTimes) {
        super(coordinatorExchangeSvrList);
        this.metaClient = new MetaClient(coordinatorExchangeSvrList);
        this.apiRegistry = super.getNetService().apiRegistry();
        this.retryTimes = retryTimes;
        refreshTableMeta("HUZX");
    }

    /**
     * connection must be init before do operation.
     * @return true or false
     */
    public boolean openConnection() {
        /*
        try {
            if (isConnected()) {
                return true;
            } else {
                super.initConnection();
                this.metaClient.init(null);
                this.apiRegistry = super.getNetService().apiRegistry();
                isConnectionInit = true;
            }
            return true;
        } catch (Exception e) {
            log.error("init connection failed", e.toString(), e);
            return false;
        }
         */
        return true;
    }

    public boolean isConnected() {
        return true;
    }

    public void closeConnection() {
        if (storeOpUtils != null) {
            storeOpUtils.shutdown();
        }
        isConnectionInit = false;
    }

    public boolean insert(String tableName, List<Object[]> records) {
        if (!isConnected()) {
            log.error("connection has not been initialized, please call openConnection first");
            return false;
        }
        if (records == null || records.size() == 0) {
            log.error("Invalid input rowList{}", records);
            return false;
        }

        int retryTimes = 0;
        int batchSize = 10000;
        boolean isSuccess = false;
        do {
            refreshTableMeta(tableName);
            List<KeyValue> keyValueList = new ArrayList<>();
            ApiRegistry apiRegistry = this.apiRegistry;
            try {
                /*
                for (Object[] row : records) {
                    KeyValue keyValueEncode = codec.encode(row);
                    keyValueList.add(keyValueEncode);
                }
                if (retryTimes == 0) {
                    KeyValue firstKeyValue = keyValueList.get(0);
                    ByteArrayUtils.ComparableByteArray keyId = ps.calcPartId(firstKeyValue.getKey());
                    ExecutorApi executorApi = getExecutor(keyId);
                    isSuccess = executorApi.upsertKeyValue(tableId, keyValueList);
                } else {
                    for (KeyValue keyValue : keyValueList) {
                        ByteArrayUtils.ComparableByteArray keyId = ps.calcPartId(keyValue.getKey());
                        ExecutorApi executorApi = getExecutor(keyId);
                        isSuccess = executorApi.upsertKeyValue(tableId, keyValue);
                    }
                }
                 */

                Map<ByteArrayUtils.ComparableByteArray, List<KeyValue>> recordGroup = new HashMap<ByteArrayUtils.ComparableByteArray, List<KeyValue>>();
                for (Object[] record : records) {
                    KeyValue keyValue = codec.encode(record);
                    ByteArrayUtils.ComparableByteArray keyId = ps.calcPartId(keyValue.getKey());
                    List<KeyValue> currentGroup;
                    currentGroup = recordGroup.get(keyId);
                    if (currentGroup == null) {
                        currentGroup = new ArrayList<KeyValue>();
                        recordGroup.put(keyId, currentGroup);
                    }
                    currentGroup.add(keyValue);
                    if (currentGroup.size() >= batchSize) {
                        getExecutor(keyId).upsertKeyValue(tableId, currentGroup);
                        currentGroup.clear();
                    }
                }
                for (Map.Entry<ByteArrayUtils.ComparableByteArray, List<KeyValue>> entry : recordGroup.entrySet()) {
                    if (entry.getValue().size() > 0) {
                        getExecutor(entry.getKey()).upsertKeyValue(tableId, entry.getValue());
                    }
                }
                isSuccess = true;
            } catch (Exception ex) {
                log.error("insert failed:{}", ex.toString(), ex);
                isSuccess = false;
            }
        } while (!isSuccess && retryTimes++ < 100);

        return isSuccess;
    }

    public void refreshTableMeta(String tableName) {
        this.tableId = metaClient.getTableId(tableName);
        TableDefinition tableDefinition = metaClient.getTableDefinition(tableName);
        if (tableDefinition == null) {
            System.out.printf("Table:%s not found \n", tableName);
            System.exit(1);
        }
        this.parts = metaClient.getParts(tableName);
        this.codec = new DingoKeyValueCodec(tableDefinition.getDingoType(), tableDefinition.getKeyMapping());
        this.ps = new RangeStrategy(tableDefinition, parts.navigableKeySet());
        this.partsApi = new TreeMap<ByteArrayUtils.ComparableByteArray, ExecutorApi>();
    }

    private ExecutorApi getExecutor(ByteArrayUtils.ComparableByteArray byteArray) {
        ExecutorApi executorApi = partsApi.get(byteArray);
        if (executorApi != null) {
            return executorApi;
        }
        Part part = parts.get(byteArray);
        ExecutorApi executor = apiRegistry
            .proxy(ExecutorApi.class, () -> new Location(part.getLeader().getHost(), part.getLeader().getPort()));
        partsApi.put(byteArray, executor);
        return executor;
    }

    public MetaClient getMetaClient() {
        return metaClient;
    }


    /*
    private HashMap<Key, Record> convertObjectArray2Record(String tableName, List<Object[]> recordList) {
        TableDefinition tableDefinition = storeOpUtils.getTableDefinition(tableName);
        if (tableDefinition == null) {
            log.warn("table:{} definition not found", tableName);
            return null;
        }
        HashMap<Key, Record>  recordResults = new LinkedHashMap<>(recordList.size());
        for (Object[] record: recordList) {
            if (record == null || record.length == 0
                || tableDefinition.getColumnsCount() != record.length) {
                log.error("Invalid record:{}, count: expect:{}, real:{}",
                    record, tableDefinition.getColumnsCount(), record != null ? record.length : 0);
                return null;
            }
            List<Value> userKeys = new ArrayList<>();
            List<String> columnNames = new ArrayList<>();

            int index = 0;
            for (ColumnDefinition column : tableDefinition.getColumns()) {
                if (column.isPrimary()) {
                    userKeys.add(Value.get(record[index]));
                }
                columnNames.add(column.getName());
                index++;
            }

            int columnCnt = tableDefinition.getColumnsCount();
            Column[] columns = new Column[columnCnt];
            for (int i = 0; i < columnCnt; i++) {
                columns[i] = new Column(columnNames.get(i), Value.get(record[i]));
            }
            Key key = new Key("DINGO", tableName, userKeys);
            Record record1 = new Record(tableDefinition.getColumns(), columns);
            recordResults.put(key, record1);
        }
        return recordResults;
    }

    public boolean put(Key key, Column[] columns) throws DingoClientException {
        TableDefinition tableDefinition = storeOpUtils.getTableDefinition(key.getTable());
        Record record = new Record(tableDefinition.getColumns(), columns);
        return doPut(Arrays.asList(key), Arrays.asList(record));
    }

    public boolean put(List<Key> keyList, List<Record> recordList) throws DingoClientException {
        return doPut(keyList, recordList);
    }

    public Object[] get(String tableName, Object[] key) throws Exception {
        List<Value> userKeys = new ArrayList<>();
        for (Object keyValue: key) {
            userKeys.add(Value.get(keyValue));
        }
        Key dingoKey = new Key("DINGO", tableName, userKeys);
        Record dingoRecord = get(dingoKey);
        return dingoRecord.getDingoColumnValuesInOrder();
    }

    public Record get(Key key) throws Exception {
        List<Record> records = doGet(Arrays.asList(key));
        if (records == null || records.isEmpty()) {
            return null;
        }
        return records.get(0);
    }

    public List<Record> get(List<Key> keyList) throws Exception {
        return doGet(keyList);
    }

    public boolean delete(String tableName, Object[] key) {
        List<Value> userKeys = new ArrayList<>();
        for (Object keyValue: key) {
            userKeys.add(Value.get(keyValue));
        }
        Key dingoKey = new Key("DINGO", tableName, userKeys);
        return doDelete(Arrays.asList(dingoKey));
    }

    public boolean delete(Key key) throws Exception {
        return doDelete(Arrays.asList(key));
    }

    public boolean delete(List<Key> keyList) throws Exception {
        return doDelete(keyList);
    }

    private List<Record> doGet(List<Key> keyList) throws Exception {
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.GET,
            keyList.get(0).getTable(),
            new ContextForClient(keyList, null, null));
        if (!result.getStatus()) {
            log.error("Execute get command failed:{}", result.getErrorMessage());
            return null;
        } else {
            return result.getRecords();
        }
    }

    private boolean doPut(List<Key> keyList, List<Record> recordList) {
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.PUT,
            keyList.get(0).getTable(),
            new ContextForClient(keyList, recordList, null));
        if (!result.getStatus()) {
            log.error("Execute put command failed:{}", result.getErrorMessage());
            return false;
        }
        return true;
    }

    private boolean doDelete(List<Key> keyList) {
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.DELETE,
            keyList.get(0).getTable(),
            new ContextForClient(keyList, null, null));
        if (!result.getStatus()) {
            log.error("Execute put command failed:{}", result.getErrorMessage());
            return false;
        }
        return true;
    }

    public final void add(Key key, Column... columns) {
        Operation operation = Operation.add(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.COMPUTE_UPDATE,
            key.getTable(),
            contextForClient);
        if (result.getStatus() != true) {
            log.error("add operation failed, key:{}, columns:{}", key, columns);
        }
        return;
    }

    public final Record max(Key key, Column... columns) {
        Operation operation = Operation.max(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.GET_COMPUTE,
            key.getTable(),
            contextForClient);
        return result.getRecords() != null ? result.getRecords().get(0) : null;
    }

    public final Record min(Key key, Column... columns) {
        Operation operation = Operation.min(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.GET_COMPUTE,
            key.getTable(),
            contextForClient);
        return result.getRecords() != null ? result.getRecords().get(0) : null;
    }

    public final Record sum(Key key, Column... columns) {
        Operation operation = Operation.sum(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.GET_COMPUTE,
            key.getTable(),
            contextForClient);
        return result.getRecords() != null ? result.getRecords().get(0) : null;
    }

    public final void append(Key key, Column... columns) {
        Operation operation = Operation.append(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.COMPUTE_UPDATE,
            key.getTable(),
            contextForClient);
        if (!result.getStatus()) {
            log.error("append operation failed, key:{}, columns:{}", key, columns);
        }
    }

    public final void replace(Key key, Column... columns) {
        Operation operation = Operation.replace(columns);
        ContextForClient contextForClient = new ContextForClient(
            Arrays.asList(key),
            null,
            Arrays.asList(operation)
        );
        ResultForClient result = storeOpUtils.doOperation(
            StoreOperationType.COMPUTE_UPDATE,
            key.getTable(),
            contextForClient);
        if (!result.getStatus()) {
            log.error("append operation failed, key:{}, columns:{}", key, columns);
        }
    }
    */

    /**
     * Perform multiple read/write operations on a single key in one batch call.
     *<p>
     *     Operation and ListOperation, MapOperation can be performed in same call.
     *</p>
     *
     * @param key unique record identifier
     * @param operations database operations to perform
     * @return .
     */
    /*
    public final Record operate(Key key, List<Operation> operations) {
        return null;
    }

    public final Record updateCol(Key key, Column... column) {
        return null;
    }
    */
}
