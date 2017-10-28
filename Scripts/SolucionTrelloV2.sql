/*
Desarrollar las siguientes consultas:
1. Mostrar todos los usuarios con la siguiente información:
 Nombre completo del Usuario
 Correo
 Cantidad de tableros creados
 Cantidad de organizaciones a las que pertenece
 Cantidad de tarjetas creadas
 Cantidad de archivos adjuntos subidos
*/



WITH USUARIOS_TABLEROS AS (
    SELECT
      CODIGO_USUARIO_CREA AS CODIGO_USUARIO,
      COUNT(*) CANTIDAD_TABLEROS
    FROM TBL_TABLERO
    GROUP BY CODIGO_USUARIO_CREA
),
ORGANIZACIONES_USUARIO AS (
      SELECT
        A.CODIGO_USUARIO,
        COUNT(1) AS CANTIDAD_ORGANIZACIONES
      FROM TBL_USUARIOS_X_ORGANIZACION A
      GROUP BY A.CODIGO_USUARIO
),
TARJETAS_USUARIOS AS (
      SELECT
        CODIGO_USUARIO,
        COUNT(1) AS CANTIDAD_TARJETAS
      FROM TBL_TARJETAS
      GROUP BY CODIGO_USUARIO
),
ARCHIVOS_USUARIOS AS (
      SELECT
        CODIGO_USUARIO,
        COUNT(1) AS ARCHIVOS_ADJUNTOS
      FROM TBL_ARCHIVOS_ADJUNTOS
      GROUP BY CODIGO_USUARIO
)
SELECT A.NOMBRE || ' ' ||A.APELLIDO AS NOMBRE,
        A.CORREO,
        NVL(B.CANTIDAD_TABLEROS,0) AS CANTIDAD_TABLEROS,
        NVL(C.CANTIDAD_ORGANIZACIONES,0) AS CANTIDAD_ORGANIZACIONES,
        NVL(D.CANTIDAD_TARJETAS,0) AS CANTIDAD_TARJETAS,
        NVL(E.ARCHIVOS_ADJUNTOS,0) AS ARCHIVOS_ADJUNTOS
  FROM TBL_USUARIOS A
LEFT JOIN USUARIOS_TABLEROS B
    ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
LEFT JOIN ORGANIZACIONES_USUARIO C
    ON (A.CODIGO_USUARIO = C.CODIGO_USUARIO)
LEFT JOIN TARJETAS_USUARIOS D
    ON (A.CODIGO_USUARIO = D.CODIGO_USUARIO)
LEFT JOIN ARCHIVOS_USUARIOS E
    ON (A.CODIGO_USUARIO = E.CODIGO_USUARIO);
/*
2. Mostrar la cantidad de usuarios por cada plan, si hay algún plan que no tenga ningún usuario también debe aparecer con
cantidad 0.
*/

SELECT A.NOMBRE_PLAN,COUNT(B.CODIGO_USUARIO)
  FROM TBL_PLANES A
LEFT JOIN TBL_USUARIOS B
    ON (A.CODIGO_PLAN = B.CODIGO_PLAN)
GROUP BY A.NOMBRE_PLAN;


--LISTAR POR USUARIO LA CANTIDAD DE SUSCRIPCIONES DE LISTAS, TABLEROS Y TARJETAS.
SELECT CODIGO_USUARIO,
        COUNT(CODIGO_LISTA) As CANTIDAD_LISTAS,
        COUNT(CODIGO_TABLERO) AS CANTIDAD_TABLEROS,
        COUNT(CODIGO_TARJETA) AS CANTIDAD_TARJETAS
  FROM TBL_SUSCRIPCIONES
GROUP BY CODIGO_USUARIO;

/*
3. Mostrar la cantidad de usuarios que han hecho más de 2 comentarios, mostrar la siguiente información:
 Nombre completo del usuario
 Correo
 Cantidad de comentario
 Fecha del último comentario
 Fecha del primer comentario
 Red social en caso de estar registrado con una
*/
SELECT  A.CODIGO_USUARIO,
        A.NOMBRE || ' ' || A.APELLIDO AS NOMBRE,
        A.CORREO,
        COUNT(*) CANTIDAD_COMENTARIOS,
        MAX(FECHA_PUBLICACION) FECHA_ULTIMO_COMENTARIO,
        MIN(FECHA_PUBLICACION) FECHA_PRIMER_COMENTARIO
  FROM TBL_USUARIOS A
INNER JOIN TBL_COMENTARIOS B
ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)
GROUP BY A.CODIGO_USUARIO,
        A.NOMBRE || ' ' || A.APELLIDO, A.CORREO
HAVING COUNT(*) >= 2;


SELECT A.CODIGO_USUARIO,
        COUNT(*) CANTIDAD_COMENTARIOS,
        MAX(FECHA_PUBLICACION) FECHA_ULTIMO_COMENTARIO,
        MIN(FECHA_PUBLICACION) FECHA_PRIMER_COMENTARIO
  FROM TBL_COMENTARIOS A
GROUP BY A.CODIGO_USUARIO
HAVING COUNT(*) >= 2;

SELECT *
  FROM TBL_COMENTARIOS;
/*
4. Mostrar los usuarios que hicieron más de 5 comentarios al mes, incluir los siguientes campos:
 Nombre completo del usuario
 Correo
 Cantidad de comentario
 Año y Mes
 Fecha del ultimo comentario
 Cantidad de organizaciones a las que pertenece el usuario.
*/

/*
5. Cree una vista materializada que muestre la siguiente información de los tableros:
 Nombre Tablero
 Nombre completo del usuario que lo crea
 Fecha de creación en Formato Año/Mes/Día
 Año y mes de creación
 Nombre de la organización a la que pertenece dicho tablero
 Cantidad de listas por tablero
 Cantidad de tarjetas por tablero
*/

/*
6. Crear un archivo de excel e incluir una tabla dinámica que haga uso de la vista creada en el inciso anterior, en base a esta
tabla dinámica crear un gráfico de barras que muestre en el eje X la organización y en el eje Y la cantidad de tablero
*/