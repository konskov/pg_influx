CREATE SCHEMA db_worker;

\set VERBOSITY terse
\x on
SELECT worker_launch('db_worker', 4711::text) AS pid \gset
SELECT pg_sleep(1);

CALL send_packet('cpu,cpu=cpu0,host=fury usage_system=2.0408163264927324,usage_user=2.0408163264927324 1574753954000000000', 4711::text);
CALL send_packet('cpu,cpu=cpu1,host=fury usage_system=3.921568627286635,usage_user=3.9215686274649673 1574753954000000000', 4711::text);
CALL send_packet('disk,device=nvme0n1p2,fstype=ext4,host=fury,mode=rw,path=/ free=912578965504i,total=1006530654208i,used=42751348736i,used_percent=4.475033200428718 1574753954000000000', 4711::text);
CALL send_packet('disk,device=nvme0n1p1,fstype=vfat,host=fury,mode=rw,path=/boot/efi free=527806464i,total=535805952i,used=7999488i,used_percent=1.4929822952022749 1574753954000000000', 4711::text);
