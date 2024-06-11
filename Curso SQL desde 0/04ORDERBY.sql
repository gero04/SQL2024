--Me permite ordenar segun un campo, toma numeros enteros, texto, etc
--Por defecto es en orden ascendente

--Consulta que me trae todas las filas de la tabla users ordenadas por edad
SELECT * 
FROM users 
ORDER BY age

--Consulta que me trae todas las filas de la tabla users ordenadas por edad DE MANERA ASCENDENTE
SELECT *
FROM users
ORDER BY age DESC

--Consulta que me trae todas las filas de la tabla users ordenadas por edad DE MANERA DESCENDENTE
SELECT *
FROM users
ORDER BY age DESC

--Consulta que trae un solo campo (nombres) de la tabla usuarios
SELECT name 
FROM users 
WHERE email='hola@gmail.com' 
ORDER BY age DESC