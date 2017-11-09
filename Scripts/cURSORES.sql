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








SET SERVEROUTPUT ON;


--CURSOR EXPLICITO (DECLARADO CON NOMBRE)
declare
    cursor v_empleados is SELECT * FROM EMPLOYEES;
    V_REGISTRO EMPLOYEES%ROWTYPE;
begin
    OPEN V_EMPLEADOS;
    LOOP
        FETCH V_EMPLEADOS INTO V_REGISTRO;
        EXIT WHEN (V_EMPLEADOS%NOTFOUND);
        DBMS_OUTPUT.PUT_LINE('<option value="'||V_REGISTRO.EMPLOYEE_ID||'">'||V_REGISTRO.FIRST_NAME||'</option>');
    END LOOP;
    
    CLOSE V_EMPLEADOS;
end;



--CURSOR IMPLICITO (ANONIMO O SIN NOMBRE)
begin
    FOR V_REGISTRO IN (SELECT * FROM EMPLOYEES) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('<option value="'||V_REGISTRO.EMPLOYEE_ID||'">'||V_REGISTRO.FIRST_NAME||'</option>');
    END LOOP;
end;


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



