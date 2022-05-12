insert into employees(
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id,
    hire_date
) values
(100, 'Steven', 'K_ing', 'SKING', '515.123.4567', 'AD_PRES', 24000.00, 0.9, 100, 90, '1992-04-03 00:00:00'),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', 'AD_VP', 17000.00, 0.1, 100, 90, '1992-04-03 00:00:00'),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', 'AD_VP', 17000.00, 0.1, 100, 90, '1992-04-03 00:00:00'),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', 'IT_PROG', 9000.00, 0.1, 102, 60, '1992-04-03 00:00:00'),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', 'IT_PROG', 6000.00, 0.1, 103, 60, '1992-04-03 00:00:00'),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', 'IT_PROG', 4800.00, 0.1, 103, 60, '1998-03-03 00:00:00'),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', 'IT_PROG', 4800.00, 0.1, 103, 60, '1998-03-03 00:00:00'),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', 'IT_PROG', 4200.00, 0.1, 103, 60, '1998-03-03 00:00:00'),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', 'FI_MGR', 12000.00, 0.1, 101, 100, '1998-03-03 00:00:00'),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', 'FI_ACCOUNT', 9000.00, 0.1, 108, 100, '1998-03-03 00:00:00'),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', 'FI_ACCOUNT', 8200.00, 0.1, 108, 100, '2000-09-09 00:00:00'),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', 'FI_ACCOUNT', 7700.00, 0.1, 108, 100, '2000-09-09 00:00:00'),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', 'FI_ACCOUNT', 7800.00, 0.1, 108, 100, '2000-09-09 00:00:00'),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', 'FI_ACCOUNT', 6900.00, 0.1, 108, 100, '2000-09-09 00:00:00'),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', 'PU_MAN', 11000.00, 0.1, 100, 30, '2000-09-09 00:00:00'),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', 'PU_CLERK', 3100.00, 0.1, 114, 30, '2000-09-09 00:00:00'),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', 'PU_CLERK', 2900.00, 0.1, 114, 30, '2000-09-09 00:00:00'),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', 'PU_CLERK', 2800.00, 0.1, 114, 30, '2000-09-09 00:00:00'),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', 'PU_CLERK', 2600.00, 0.1, 114, 30, '2000-09-09 00:00:00'),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', 'PU_CLERK', 2500.00, 0.1, 114, 30, '2000-09-09 00:00:00'),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', 'ST_MAN', 8000.00, 0.1, 100, 50, '2004-02-06 00:00:00'),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', 'ST_MAN', 8200.00, 0.0, 100, 50, '2004-02-06 00:00:00'),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', 'ST_MAN', 7900.00, 0.0, 100, 50, '2004-02-06 00:00:00'),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', 'ST_MAN', 6500.00, 0.0, 100, 50, '2004-02-06 00:00:00'),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', 'ST_MAN', 5800.00, 0.0, 100, 50, '2004-02-06 00:00:00'),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', 'ST_CLERK', 3200.00, 0.0, 120, 50, '2004-02-06 00:00:00'),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', 'ST_CLERK', 2700.00, 0.0, 120, 50, '2004-02-06 00:00:00'),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', 'ST_CLERK', 2400.00, 0.0, 120, 50, '2004-02-06 00:00:00'),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', 'ST_CLERK', 2200.00, 0.0, 120, 50, '2004-02-06 00:00:00'),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', 'ST_CLERK', 3300.00, 0.0, 121, 50, '2004-02-06 00:00:00'),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', 'ST_CLERK', 2800.00, 0.0, 121, 50, '2004-02-06 00:00:00'),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', 'ST_CLERK', 2500.00, 0.0, 121, 50, '2004-02-06 00:00:00'),
(132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', 'ST_CLERK', 2100.00, 0.0, 121, 50, '2004-02-06 00:00:00'),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', 'ST_CLERK', 3300.00, 0.0, 122, 50, '2004-02-06 00:00:00'),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', 'ST_CLERK', 2900.00, 0.0, 122, 50, '2002-12-23 00:00:00'),
(135, 'Ki', 'Gee', 'KGEE', '650.127.1734', 'ST_CLERK', 2400.00, 0.0, 122, 50, '2002-12-23 00:00:00'),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', 'ST_CLERK', 2200.00, 0.0, 122, 50, '2002-12-23 00:00:00'),
(137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', 'ST_CLERK', 3600.00, 0.0, 123, 50, '2002-12-23 00:00:00'),
(138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', 'ST_CLERK', 3200.00, 0.0, 123, 50, '2002-12-23 00:00:00'),
(139, 'John', 'Seo', 'JSEO', '650.121.2019', 'ST_CLERK', 2700.00, 0.0, 123, 50, '2002-12-23 00:00:00'),
(140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', 'ST_CLERK', 2500.00, 0.0, 123, 50, '2002-12-23 00:00:00'),
(141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', 'ST_CLERK', 3500.00, 0.0, 124, 50, '2002-12-23 00:00:00'),
(142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', 'ST_CLERK', 3100.00, 0.0, 124, 50, '2002-12-23 00:00:00'),
(143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', 'ST_CLERK', 2600.00, 0.0, 124, 50, '2002-12-23 00:00:00'),
(144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', 'ST_CLERK', 2500.00, 0.0, 124, 50, '2002-12-23 00:00:00'),
(145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', 'SA_MAN', 14000.00, 0.40, 100, 80, '2002-12-23 00:00:00'),
(146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', 'SA_MAN', 13500.00, 0.30, 100, 80, '2002-12-23 00:00:00'),
(147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', 'SA_MAN', 12000.00, 0.30, 100, 80, '2002-12-23 00:00:00'),
(148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', 'SA_MAN', 11000.00, 0.30, 100, 80, '2002-12-23 00:00:00'),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', 'SA_MAN', 10500.00, 0.20, 100, 80, '2002-12-23 00:00:00'),
(150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', 'SA_REP', 10000.00, 0.30, 145, 80, '2014-03-05 00:00:00'),
(151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', 'SA_REP', 9500.00, 0.25, 145, 80, '2014-03-05 00:00:00'),
(152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', 'SA_REP', 9000.00, 0.25, 145, 80, '2014-03-05 00:00:00'),
(153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', 'SA_REP', 8000.00, 0.20, 145, 80, '2014-03-05 00:00:00'),
(154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', 'SA_REP', 7500.00, 0.20, 145, 80, '2014-03-05 00:00:00'),
(155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', 'SA_REP', 7000.00, 0.15, 145, 80, '2014-03-05 00:00:00'),
(156, 'Janette', 'K_ing', 'JKING', '011.44.1345.429268', 'SA_REP', 10000.00, 0.35, 146, 80, '2014-03-05 00:00:00'),
(157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', 'SA_REP', 9500.00, 0.35, 146, 80, '2014-03-05 00:00:00'),
(158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', 'SA_REP', 9000.00, 0.35, 146, 80, '2014-03-05 00:00:00'),
(159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', 'SA_REP', 8000.00, 0.30, 146, 80, '2014-03-05 00:00:00'),
(160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', 'SA_REP', 7500.00, 0.30, 146, 80, '2014-03-05 00:00:00'),
(161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', 'SA_REP', 7000.00, 0.25, 146, 80, '2014-03-05 00:00:00'),
(162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', 'SA_REP', 10500.00, 0.25, 147, 80, '2014-03-05 00:00:00'),
(163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', 'SA_REP', 9500.00, 0.15, 147, 80, '2014-03-05 00:00:00'),
(164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', 'SA_REP', 7200.00, 0.10, 147, 80, '2014-03-05 00:00:00'),
(165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', 'SA_REP', 6800.00, 0.10, 147, 80, '2014-03-05 00:00:00'),
(166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', 'SA_REP', 6400.00, 0.10, 147, 80, '2014-03-05 00:00:00'),
(167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', 'SA_REP', 6200.00, 0.10, 147, 80, '2014-03-05 00:00:00'),
(168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', 'SA_REP', 11500.00, 0.25, 148, 80, '2014-03-05 00:00:00'),
(169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', 'SA_REP', 10000.00, 0.20, 148, 80, '2014-03-05 00:00:00'),
(170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', 'SA_REP', 9600.00, 0.20, 148, 80, '2014-03-05 00:00:00'),
(171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', 'SA_REP', 7400.00, 0.15, 148, 80, '2014-03-05 00:00:00'),
(172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', 'SA_REP', 7300.00, 0.15, 148, 80, '2014-03-05 00:00:00'),
(173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', 'SA_REP', 6100.00, 0.10, 148, 80, '2014-03-05 00:00:00'),
(174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', 'SA_REP', 11000.00, 0.30, 149, 80, '2014-03-05 00:00:00'),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', 'SA_REP', 8800.00, 0.25, 149, 80, '2014-03-05 00:00:00'),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', 'SA_REP', 8600.00, 0.20, 149, 80, '2014-03-05 00:00:00'),
(177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', 'SA_REP', 8400.00, 0.20, 149, 80, '2014-03-05 00:00:00'),
(178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', 'SA_REP', 7000.00, 0.15, 149, 80, '2014-03-05 00:00:00'),
(179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', 'SA_REP', 6200.00, 0.10, 149, 80, '2014-03-05 00:00:00'),
(180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', 'SH_CLERK', 3200.00, 0.10, 120, 50, '2014-03-05 00:00:00'),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', 'SH_CLERK', 3100.00, 0.10, 120, 50, '2014-03-05 00:00:00'),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', 'SH_CLERK', 2500.00, 0.10, 120, 50, '2014-03-05 00:00:00'),
(183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', 'SH_CLERK', 2800.00, 0.10, 120, 50, '2014-03-05 00:00:00'),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', 'SH_CLERK', 4200.00, 0.10, 121, 50, '2014-03-05 00:00:00'),
(185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', 'SH_CLERK', 4100.00, 0.10, 121, 50, '2014-03-05 00:00:00'),
(186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', 'SH_CLERK', 3400.00, 0.10, 121, 50, '2014-03-05 00:00:00'),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', 'SH_CLERK', 3000.00, 0.10, 121, 50, '2014-03-05 00:00:00'),
(188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', 'SH_CLERK', 3800.00, 0.10, 122, 50, '2014-03-05 00:00:00'),
(189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', 'SH_CLERK', 3600.00, 0.10, 122, 50, '2014-03-05 00:00:00'),
(190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', 'SH_CLERK', 2900.00, 0.10, 122, 50, '2014-03-05 00:00:00'),
(191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', 'SH_CLERK', 2500.00, 0.10, 122, 50, '2014-03-05 00:00:00'),
(192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', 'SH_CLERK', 4000.00, 0.10, 123, 50, '2014-03-05 00:00:00'),
(193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', 'SH_CLERK', 3900.00, 0.10, 123, 50, '2014-03-05 00:00:00'),
(194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', 'SH_CLERK', 3200.00, 0.10, 123, 50, '2014-03-05 00:00:00'),
(195, 'Vance', 'Jones', 'VJONES', '650.501.4876', 'SH_CLERK', 2800.00, 0.10, 123, 50, '2014-03-05 00:00:00'),
(196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', 'SH_CLERK', 3100.00, 0.10, 124, 50, '2014-03-05 00:00:00'),
(197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', 'SH_CLERK', 3000.00, 0.10, 124, 50, '2014-03-05 00:00:00'),
(198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', 'SH_CLERK', 2600.00, 0.10, 124, 50, '2014-03-05 00:00:00'),
(199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', 'SH_CLERK', 2600.00, 0.10, 124, 50, '2014-03-05 00:00:00'),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', 'AD_ASST', 4400.00, 0.10, 101, 10, '2016-03-03 00:00:00'),
(201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', 'MK_MAN', 13000.00, 0.10, 100, 20, '2016-03-03 00:00:00'),
(202, 'Pat', 'Fay', 'PFAY', '603.123.6666', 'MK_REP', 6000.00, 0.10, 201, 20, '2016-03-03 00:00:00'),
(203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', 'HR_REP', 6500.00, 0.10, 101, 40, '2016-03-03 00:00:00'),
(204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', 'PR_REP', 10000.00, 0.10, 101, 70, '2016-03-03 00:00:00'),
(205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', 'AC_MGR', 12000.00, 0.10, 101, 110, '2016-03-03 00:00:00'),
(206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', 'AC_ACCOUNT', 8300.00, 0.10, 205, 110, '2016-03-03 00:00:00')
