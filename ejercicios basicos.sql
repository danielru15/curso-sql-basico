/*

*/


-- 1. De la tabla payments retornar los valores unicos de pagos que se han realizado

SELECT DISTINCT
	(AMOUNT)
FROM
	PAYMENT;


-- 2. De la tabla film retorna todos los valores unicos del costo de remplazar el DVD 

SELECT DISTINCT
	(REPLACEMENT_COST)
FROM
	FILM;

/* 3. De la tabla film retorna la cantidad de valores unicos en la columna rental_rate para 
aquellas peliculas que duren 90min exactamente */

SELECT
	COUNT(DISTINCT (RENTAL_RATE))
FROM
	FILM
WHERE
	LENGTH = 90;

-- 4. De la tabla payments retorna los ultimos 3 pagos menores o iguales a 4.99 hechos por el cliente 322

SELECT
	AMOUNT,
	CUSTOMER_ID
FROM
	PAYMENT
WHERE
	CUSTOMER_ID = 322
ORDER BY
	AMOUNT <= 4.99 DESC LIMIT
	3;

-- 5. De la tabla film retornar el titulo y la duracion de las 10 peliculas con mayor duración ordenadas en orden alfabetico.

SELECT
	TITLE,
	LENGTH
FROM
	FILM
ORDER BY
	LENGTH DESC,
	TITLE ASC
LIMIT
	10;

-- 6. Seleccionar todos los correos electrónicos de los clientes que no están activos.

SELECT
	EMAIL
FROM
	CUSTOMER
WHERE
	ACTIVE=0;

-- 7. Obtener el título y el año de lanzamiento de todas las películas ordenadas por año de lanzamiento.

SELECT
	TITLE,
	RELEASE_YEAR
FROM
	FILM
ORDER BY
	RELEASE_YEAR ASC;


-- 8. Seleccionar todos los nombres de los clientes ordenados alfabéticamente por apellido.

SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	CUSTOMER
ORDER BY
	LAST_NAME ASC;

-- 9. Obtener el número total de películas con una calificación 'R'.

SELECT
	COUNT(*)
FROM
	FILM
WHERE
	RATING = 'R';

-- 10. Listar los nombres y apellidos de los clientes cuyo nombre comienza con la letra 'D'.

SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	CUSTOMER
WHERE
	FIRST_NAME LIKE'D%';


-- 11. Seleccionar todas las películas con un costo de reemplazo mayor a $20.00.

SELECT
	TITLE,
	REPLACEMENT_COST
FROM
	FILM
WHERE
	REPLACEMENT_COST > 20.00
ORDER BY
	REPLACEMENT_COST ASC,
	TITLE ASC;

-- 12. Obtener el número total de películas que tienen una duración mayor a 120 minutos.

SELECT
	COUNT(*)
FROM
	FILM
WHERE
	LENGTH > 120;

-- 13. Listar todas las películas que fueron lanzadas entre los años 2005 y 2010.

SELECT
	TITLE,
	RELEASE_YEAR
FROM
	FILM
WHERE
	RELEASE_YEAR BETWEEN 2005 AND 2010;

-- 14. Seleccionar los primeros 10 registros de la tabla de clientes

SELECT
	*
FROM
	CUSTOMER
ORDER BY
	CUSTOMER_ID ASC
LIMIT
	10;

-- 15. Listar todos los clientes cuyo nombre y apellido contenga la letra 'E'.

SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	CUSTOMER
WHERE
	FIRST_NAME ILIKE '%%E'
	AND LAST_NAME ILIKE '%%E';

-- 16. Seleccionar el título de las películas con una duración de alquiler menor o igual a 3 días.

SELECT
	TITLE,
	RENTAL_DURATION
FROM
	FILM
WHERE
	RENTAL_DURATION <= 3;

-- 17. Obtener la suma total de los costos de reemplazo de todas las películas.

SELECT
	SUM(REPLACEMENT_COST)
FROM
	FILM;

-- 18. Obtener el número total de películas que tienen una calificación diferente a 'G'.

SELECT
	COUNT(*)
FROM
	FILM
WHERE
	RATING != 'G'

-- 19. Listar todas las películas con una duración mayor a la duración promedio de todas las películas.

SELECT
	TITLE
FROM
	FILM
WHERE
	LENGTH > (
		SELECT
			AVG(LENGTH)
		FROM
			FILM
	);

