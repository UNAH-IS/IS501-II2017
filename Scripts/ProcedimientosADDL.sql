CREATE OR REPLACE PROCEDURE P_BACKUP(P_ESQUEMA VARCHAR2, P_NOMBRE_TABLA VARCHAR2) AS    
    V_SQL VARCHAR2(3000);
BEGIN
    V_SQL:='CREATE TABLE '||P_ESQUEMA||'.'||P_NOMBRE_TABLA||'_'||TO_CHAR(SYSDATE, 'HHMISS')||
        ' AS SELECT * FROM '||P_ESQUEMA||'.'||P_NOMBRE_TABLA;
    DBMS_OUTPUT.PUT_LINE(V_SQL);
    EXECUTE IMMEDIATE V_SQL;
END;

begin
    P_BACKUP('hr','employees');
end;



CREATE TABLE hr.employees_013358 AS SELECT * FROM hr.employees;