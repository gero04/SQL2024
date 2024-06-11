--El comando LIKE sirve para hacer un test de correspondencia con un patron de caracteres

--Consulta que devuelve todos los usuarios que me trae todos los usuarios que usan Gmail
--El simbolo % funciona como un comodin de 0 a n caracteres. Se lo conoce como una Wild Card
--Posibles mails validos para esta consulta: hola@gmail.com, ho@gmail.com, @gmail.com
SELECT *
FROM users
WHERE email = '%@gmail.com'


--Consulta que devuelve todos los datos de los usuarios que tengan un mail valido
SELECT *
FROM users
WHERE email = '%@%'