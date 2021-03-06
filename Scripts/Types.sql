SET SERVEROUTPUT ON;
DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_FIRST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || V_FIRST_NAME);
END;



DECLARE 
    TYPE PERSONA IS RECORD(
        FIRST_NAME VARCHAR2(200),
        LAST_NAME VARCHAR2(200)
    );
    
    V_PERSONA1 PERSONA;
BEGIN
    V_PERSONA1.FIRST_NAME := 'Juan';
    V_PERSONA1.LAST_NAME := 'Perez';
    
    DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || V_PERSONA1.FIRST_NAME || ' '|| V_PERSONA1.LAST_NAME );
END;




DECLARE 
    TYPE PERSONA IS RECORD(
        FIRST_NAME VARCHAR2(200),
        LAST_NAME VARCHAR2(200)
    );
    
    V_PERSONA1 PERSONA;
BEGIN
    SELECT FIRST_NAME, LAST_NAME INTO V_PERSONA1
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || V_PERSONA1.FIRST_NAME || ' '|| V_PERSONA1.LAST_NAME );
END;


DECLARE 
    TYPE PERSONA IS RECORD(
        FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE,
        LAST_NAME EMPLOYEES.LAST_NAME%TYPE
    );
    
    V_PERSONA1 PERSONA;
BEGIN
    SELECT FIRST_NAME, LAST_NAME INTO V_PERSONA1
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || V_PERSONA1.FIRST_NAME || ' '|| V_PERSONA1.LAST_NAME );
END;


DECLARE 
    V_PERSONA1 EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME INTO V_PERSONA1.FIRST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || V_PERSONA1.FIRST_NAME || ' '|| 
                V_PERSONA1.LAST_NAME ||
                '('||V_PERSONA1.SALARY||')');
END;




DECLARE
    Num1 NUMBER :=3;
    Num2 NUMBER; -- Como no inicializamos la variable, su valor es NULL
    EsMayor VARCHAR2(15);
BEGIN
    IF Num1 < Num2 THEN
        EsMayor := 'Yes';
    ELSE
        EsMayor := 'nO';
    END IF;
    
    
    DBMS_OUTPUT.PUT_LINE(ESMAYOR);
END;



--PARA EJECUTAR INSTRUCCIONES DDL DENTRO DE UN PROCEDIMIENTO SE USA EXECUTE IMMEDIATE
EXECUTE IMMEDIATE 'INSTRUCCION';




DECLARE
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TMP';
    EXECUTE IMMEDIATE 'CREATE TABLE TMP(CAMPO1 INTEGER, CAMPO2 INTEGER)';
END;


SELECT *
FROM TMP;

create table employees_backup as 
select *
from employees;



select * 
from EMPLOYEES_BACKUP;


insert into EMPLOYEES_BACKUP
select * from employees;


select *
from EMPLOYEES_BACKUP;


