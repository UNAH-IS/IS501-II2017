/*1. Consultar la cantidad de likes por publicación*/

select A.CODIGO_PUBLICACION,B.CONTENIDO_PUBLICACION, COUNT(*) AS CANTIDAD_LIKES
from TBL_LIKE_PUBLICACIONES A
INNER JOIN TBL_PUBLICACIONES B
ON (A.CODIGO_PUBLICACION = B.CODIGO_PUBLICACION)
GROUP BY A.CODIGO_PUBLICACION,B.CONTENIDO_PUBLICACION;


/*2. Consultar la cantidad de likes por fotografía.*/
SELECT CODIGO_FOTO, COUNT(*) CANTIDAD_LIKES
FROM TBL_LIKE_FOTOGRAFIAS
GROUP BY CODIGO_FOTO;

/*
3. Consultar los grupos en los cuales la cantidad de usuarios sea mayor que 5, mostrar el nombre del grupo y la
cantidad de usuarios.
*/
SELECT *
FROM TBL_GRUPOS;

SELECT B.NOMBRE_GRUPO, COUNT(*) CANTIDAD_USUARIOS
FROM TBL_GRUPOS_X_USUARIO A
INNER JOIN TBL_GRUPOS B
ON (A.CODIGO_GRUPO = B.CODIGO_GRUPO)
GROUP BY B.NOMBRE_GRUPO
HAVING COUNT(*)>5;



