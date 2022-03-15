-- Expect 2016-06-13T17:43:50.1004002Z (from protocol specification)
select * from parse_influx('cpu foo=12 1465839830100400200');

SELECT * FROM parse_influx(E'measurement,tag=foo field=12 1465839830100400200');
SELECT * FROM parse_influx(E'measurement,tag=\\"foo field=12 1465839830100400200');
SELECT * FROM parse_influx(E'measurement,tag=foo field=12 1465839830100400200\nmeasurement,tag=bar field=12 1465839830100400200');
SELECT * FROM parse_influx(E'myMeasurement,tag1=value1,tag2=value2 fieldKey="fieldValue" 1556813561098000000');
SELECT * FROM parse_influx(E'myMeasurementName fieldKey="fieldValue" 1556813561098000000');
SELECT * FROM parse_influx(E'myMeasurementName fieldKey="fieldValue" 1556813561098000000\nmyMeasurement,tag1=value1,tag2=value2 fieldKey="fieldValue" 1556813561098000000');

\set ON_ERROR_STOP OFF
SELECT * FROM parse_influx(E'measurement,tag field=12 12345');
SELECT * FROM parse_influx(E'measurement, field=12 12345');
SELECT * FROM parse_influx(E'measurement 12345');
\set ON_ERROR_STOP ON

CREATE TABLE lines(line text);
\copy lines from 'cpu.txt'
SELECT parse_influx(line) FROM lines;
