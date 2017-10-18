SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME||' '||A.LAST_NAME AS NAME,
        A.JOB_ID, A.SALARY,
        A.EMAIL,
        B.DEPARTMENT_NAME,
        C.JOB_TITLE,
        D.STATE_PROVINCE,
        D.COUNTRY_ID,
        E.COUNTRY_NAME,
        F.REGION_NAME,
        A.MANAGER_ID,
        G.FIRST_NAME||' '||G.LAST_NAME AS NAME
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
INNER JOIN JOBS C
ON (A.JOB_ID = C.JOB_ID)
LEFT JOIN LOCATIONS D
ON (B.LOCATION_ID = D.LOCATION_ID)
LEFT JOIN COUNTRIES E
ON (D.COUNTRY_ID = E.COUNTRY_ID)
LEFT JOIN REGIONS F
ON (E.REGION_ID = F.REGION_ID)
LEFT JOIN EMPLOYEES G
ON (A.MANAGER_ID = G.EMPLOYEE_ID)
ORDER BY F.REGION_NAME ASC, 1 DESC;
