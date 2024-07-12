/*
    * Ejercicios de group by
    * Ejercicios de halving
    * Funciones ventana
*/

-- 1. retorna la cantidad de pagos hecha por cada monto por cada cliente.

SELECT
	AMOUNT,
	CUSTOMER_ID,
	COUNT(*)
FROM
	PAYMENT
GROUP BY
	AMOUNT,
	CUSTOMER_ID

-- 2. Retorna las fechas del primer y ultimo alquiler hecho por cada cliente.

SELECT
	CUSTOMER_ID,
	MIN(RENTAL_DATE) AS PRIMER ALQUILER,
	MAX(RENTAL_DATE) AS ULTIMO ALQUILER
FROM
	RENTAL
GROUP BY
	CUSTOMER_ID

-- 3. Obtener el número total de películas por cada calificación.

SELECT
	RATING,
	COUNT(*) AS TOTAL
FROM
	FILM
GROUP BY
	RATING
ORDER BY
	TOTAL DESC

-- 4. Retorna todos los clientes que tienen un promedio de pago mayor a 5

SELECT
	CUSTOMER_ID,
	AVG(AMOUNT)
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
HAVING
	AVG(AMOUNT) > 5
ORDER BY
	CUSTOMER_ID ASC

-- 5. RETORNA LA SUMA DE TODOS LOS PAGOS POR CLIENTE, DE AQUELLOS CLIENTES QUE HAN PAGADO MAS DE 7.99 ALGUNA VEZ

SELECT
	CUSTOMER_ID,
	SUM(AMOUNT)
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
HAVING
	MAX(AMOUNT) >7.99

-- 6. Listar el número total de clientes por cada tienda.

SELECT
	STORE_ID,
	COUNT(*)
FROM
	CUSTOMER
GROUP BY
	STORE_ID

-- 7. Calcular el promedio de duración de las películas por cada calificación.

SELECT
	RATING,
	AVG(LENGTH) AS PROMEDIO
FROM
	FILM
GROUP BY
	RATING

-- 8. Obtener la suma total de costos de reemplazo por cada año de lanzamiento.

SELECT
	RELEASE_YEAR,
	SUM(REPLACEMENT_COST)
FROM
	FILM
GROUP BY
	RELEASE_YEAR

-- 9. Listar el número total de películas por cada duración de alquiler.

SELECT
	RENTAL_DURATION,
	COUNT(*) AS TOTAL_PELICULAS
FROM
	FILM
GROUP BY
	RENTAL_DURATION

-- 10. Listar las calificaciones que tienen una tasa de alquiler promedio mayor a $3.00 y el número total de películas en esas calificaciones.

SELECT
	RATING,
	COUNT(*) AS TOTAL_PELICULAS
FROM
	FILM
GROUP BY
	RATING
HAVING
	AVG(RENTAL_RATE) > 3.00;	

/*
11. Obtener la duración total de todas las películas y el promedio de duración por cada calificación, 
y listar solo las calificaciones que tienen una duración total mayor a 86.
*/
SELECT
	RATING,
	SUM(LENGTH) AS TOTAL_DURATION,
	AVG(LENGTH) AS AVG_DURATION
FROM
	FILM
GROUP BY
	RATING
HAVING
	SUM(LENGTH) > 5000;

/*
12. Calcular el costo total de reemplazo de las películas y la duración total de las películas por cada idioma y 
listar solo los idiomas con un costo total de reemplazo superior a $500.
*/

SELECT
	LANGUAGE_ID,
	SUM(REPLACEMENT_COST) AS COSTO_TOTAL_REMPLAZO,
	SUM(LENGTH) AS DURACION_TOTAL
FROM
	FILM
GROUP BY
	LANGUAGE_ID
HAVING
	SUM(REPLACEMENT_COST) > 500

