SELECT
    LPAD(TRUNC(SYSDATE - LOGON_TIME), 2, '0') || ' ' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24, 24)), 2, '0') || ':' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60, 60)), 2, '0') || ':' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60 * 60, 60)), 2, '0') AS TIME_ACTIVE_SUMMARY,
    INST_ID,
    SID,
    SERIAL#,
    STATUS,
    MACHINE,
    USERNAME,
    OSUSER,
    LOGON_TIME,
    MODULE,
    ACTION,
    'ALTER SYSTEM KILL SESSION ''' || SID || ',' || SERIAL# || ',' || '@' || INST_ID || ''' IMMEDIATE;'  AS COMANDO,
    --TRUNC(SYSDATE - LOGON_TIME) AS DAYS_ACTIVE
    --TRUNC(MOD((SYSDATE - LOGON_TIME) * 24, 24)) AS HOURS_ACTIVE,
    --TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60, 60)) AS MINUTES_ACTIVE,
    --TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60 * 60, 60)) AS SECONDS_ACTIVE
    PROGRAM,
    TYPE
FROM
    GV$SESSION
WHERE
    USERNAME IS NOT NULL
ORDER BY
    (SYSDATE - LOGON_TIME) DESC;
    
SELECT last_run_duration FROM DBA_SCHEDULER_JOBS;

SELECT
    SID,
    SERIAL#,
    USERNAME,
    LOGON_TIME,
    LPAD(TRUNC(SYSDATE - LOGON_TIME), 2, '0') || ' ' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24, 24)), 2, '0') || ':' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60, 60)), 2, '0') || ':' ||
    LPAD(TRUNC(MOD((SYSDATE - LOGON_TIME) * 24 * 60 * 60, 60)), 2, '0') AS TIME_ACTIVE_SUMMARY
FROM
    V$SESSION
WHERE
    USERNAME IS NOT NULL
ORDER BY
    (SYSDATE - LOGON_TIME) DESC;
