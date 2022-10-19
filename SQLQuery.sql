
----------- Ex 1 ------------

USE computer
GO

SELECT model, speed, hd, price
FROM PC
WHERE price < 500
ORDER BY speed

--=========================--


----------- Ex 2 ------------

USE Ships
GO

SELECT *
FROM Ships
WHERE Ships.name LIkE '%o'

--=========================--


----------- Ex 3 ------------

USE Ships
GO

SELECT country
FROM Classes
WHERE type LIKE 'bc' AND country IN (SELECT country FROM Classes WHERE type LIKE 'bb')

--=========================--

----------- Ex 4 ------------

USE computer
GO

SELECT maker
FROM Product
WHERE type LIKE 'PC' AND maker NOT IN (SELECT maker FROM Product WHERE type LIKE 'Laptop')

--=========================--

----------- Ex 5 ------------

USE computer
GO

SELECT maker, model
FROM Product
WHERE type LIKE 'PC' AND EXISTS (SELECT type FROM PC WHERE Product.model = model)

--=========================--

----------- Ex 6 ------------

USE computer
GO

SELECT 'середня ціна = ' + CAST(AVG(price) AS NCHAR)
FROM Laptop

--=========================--

----------- Ex 7 ------------

USE computer
GO

SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer)

--=========================--

----------- Ex 8 ------------

USE Ships
GO

SELECT O.ship, C.country, C.numGuns
FROM Outcomes O, Classes C, Ships S
WHERE O.result LIKE 'damaged' AND O.ship = S.name AND S.class = C.class


--=========================--

----------- Ex 9 ------------

USE computer
GO

SELECT maker,
	CASE type
		WHEN 'PC'THEN 'yes(' + CAST((SELECT COUNT(*) FROM PC WHERE Product.model = PC.model) AS NVARCHAR(100)) + ')'
		ELSE 'no'
	END AS PC
FROM Product

--=========================--

----------- Ex 10 -----------

USE Ships
GO

	SELECT S.name AS name, C.class
	FROM Classes C, Ships S, Outcomes O
	WHERE S.class = C.class
UNION
	SELECT O.ship AS name, C.class
	FROM Classes C, Ships S, Outcomes O
	WHERE O.ship = S.name AND S.class = C.class
ORDER BY 2

--=========================--