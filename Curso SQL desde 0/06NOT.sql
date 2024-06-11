--Se pueden usar compuertas logicas AND, OR, y NOT para crear condiciones de busqueda mas complejas

--Consulta que trae todos los datos de usuarios que no tengan un mail hola@gmail.com
SELECT *
FROM users
WHERE NOT email = 'hola@gmail.com'

--Consulta que trae todos los datos de usuarios que no tengan un mail hola@gmail.com y tengan 15 años
SELECT *
FROM users
WHERE NOT email = 'hola@gmail.com' AND age = 15

--Consulta que trae todos los datos de usuarios que no tengan un mail hola@gmail.com o tengan 15 años
SELECT *
FROM users
WHERE NOT email = 'hola@gmail.com' OR age = 15