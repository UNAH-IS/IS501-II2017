set serveroutput on;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Esto es un ejemplo.'); 
    GOTO Etiqueta_1;
    DBMS_OUTPUT.PUT_LINE('No hace el GOTO.');
    <<Etiqueta_1>>
    DBMS_OUTPUT.PUT_LINE('Entra en el GOTO.');
END;




DECLARE
    i integer:=0;
    NOMBRE VARCHAR2(300);
    P1  VARCHAR2(200):='AGREGAR';
begin
    
    
    IF P1 ='AGREGAR' THEN
        GOTO BLOQUE3;
    END IF;
    begin
        DBMS_OUTPUT.PUT_LINE('bLOQUE 1');        
    end;
    begin
        DBMS_OUTPUT.PUT_LINE('bLOQUE 2');
    end;
    
    begin
        DBMS_OUTPUT.PUT_LINE('bLOQUE 3');
    end;
    
    while (i<10) loop
        dbms_output.put_line('I: ' ||i);
        I:=I+1;
    end loop;  
    <<BLOQUE3>>
    IF (NOMBRE = 'JUAN') THEN         
        DBMS_OUTPUT.PUT_LINE('eL NOMBRE ES JUAN');
    END IF;
end;



DECLARE
    V_OPCION INTEGER := 1;
BEGIN
    CASE V_OPCION
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('OPCION UNO');
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE('OPCION DOS');
        ELSE
            DBMS_OUTPUT.PUT_LINE('CUALQUIER OTRA OPCION MENOS UNO Y DOS');            
    END CASE;
END;

DECLARE
    V_OPCION INTEGER := 4;
BEGIN
    CASE 
        WHEN V_OPCION = 1 THEN
            DBMS_OUTPUT.PUT_LINE('OPCION UNO');
            ----
            ----
            ----
        WHEN V_OPCION = 2 THEN
            DBMS_OUTPUT.PUT_LINE('OPCION DOS');
        WHEN V_OPCION BETWEEN 3 AND 5 THEN
            DBMS_OUTPUT.PUT_LINE('DE TRES A CINCO');            
        ELSE
            DBMS_OUTPUT.PUT_LINE('CUALQUIER OTRA OPCION MENOS UNO Y DOS');            
    END CASE;
END;



SELECT  FIRST_NAME, SALARY,
        CASE
            WHEN SALARY>=4000 THEN
                'GANA LAS VARAS'
            ELSE
                'NI PA LOS CHICLES'
        END AS RESULTADO,
        CASE SALARY
            WHEN 2600 THEN
                'ALGUITO'
            WHEN 8000 THEN
                'BASTANTITO'
            ELSE
                '-'
        END AS RESULTADO2
FROM HR.EMPLOYEES;




DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    
END;














