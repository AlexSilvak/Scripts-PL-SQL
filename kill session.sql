select
       substr(a.spid,1,9) pid,
       substr(b.sid,1,5) sid,
       substr(b.serial#,1,5) ser#,
       substr(b.machine,1,6) box,
       substr(b.username,1,10) username,
--       b.server,
       substr(b.osuser,1,8) os_user,
       substr(b.program,1,30) program
from v$session b, v$process a
where
b.paddr = a.addr
and type='USER'
order by spid; 


ALTER SYSTEM DISCONNECT SESSION '10,5' IMMEDIATE;

Select * From V$session a where a.SID =10 ;



SELECT a.sid,a.SERIAL#,a.USERNAME || 'desconectado ! '
FROM v$session a
where a.SID = a.SID
and   a.SERIAL# = a.SERIAL#
and   a.STATUS = 'ACTIVE';


SELECT 'alter system kill session '''|| SID|| ','|| SERIAL#|| ',@'|| inst_id|| ''' immediate ;'
FROM gv$session
WHERE sql_id = '&sql_id';
