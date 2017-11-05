create or replace PROCEDURE P_INSERTAR_DEPARTAMENTO(
    p_department_id out integer,
    p_department_name VARCHAR2,
    p_manager_id INTEGER,
    p_location_id INTEGER,
    p_codigo_resultado out INTEGER,
    p_mensaje_resultado out varchar2
) AS
    V_EMPLOYEES INTEGER;
    V_LOCATIONS INTEGER;
BEGIN
    --SELECT INTO SOLO VA A FUNCIONAR SI SOLO RETORNA UN REGISTRO
    SELECT COUNT(1) INTO V_EMPLOYEES
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_manager_id; 
    
    SELECT COUNT(1) INTO V_LOCATIONS
    FROM LOCATIONS
    WHERE LOCATION_ID = p_location_id;
    
    IF V_EMPLOYEES=0 THEN
        p_codigo_resultado := 0;
        p_mensaje_resultado := 'No existe el manager_id indicado.';
        RETURN;
    END IF;
    
    IF V_LOCATIONS=0 THEN
        p_codigo_resultado := 0;
        p_mensaje_resultado := 'No existe el location_id indicado.';
        RETURN;
    END IF;
    
    p_department_id := DEPARTMENTS_SEQ.NEXTVAL;
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id,
        location_id
    ) VALUES (
        p_department_id,
        p_department_name,
        p_manager_id,
        p_location_id
    );
    COMMIT;
    p_codigo_resultado := 1;
    p_mensaje_resultado := 'El registro se inserto.';
EXCEPTION
    WHEN OTHERS THEN
        p_codigo_resultado := 0;
        p_mensaje_resultado := 'Ocurrio un error.'||sqlerrm||', '||sqlcode;
        ROLLBACK;
END;


SET SERVEROUTPUT ON;
DECLARE
    V_department_id INTEGER;
    V_codigo_resultado INTEGER;
    V_mensaje_resultado varchar2(500);
BEGIN
    P_INSERTAR_DEPARTAMENTO(
        V_department_id,
        'OTRO NUEVO DEPARTAMENTO',
        100,
        1200,
        V_codigo_resultado,
        V_mensaje_resultado
    );
    
    DBMS_OUTPUT.PUT_LINE('Resultado: '||V_MENSAJE_RESULTADO);
END;