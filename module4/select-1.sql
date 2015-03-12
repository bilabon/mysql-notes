-- Создаём базу данных
CREATE DATABASE IF NOT EXISTS module4;
USE module4;

-- Вывод значения
SELECT 2 + 2;

-- Вывод значения
SELECT 2 + 2 AS result;

-- Переменные
SET @a = 'Привет мир!';
SELECT @a;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

SELECT name AS teacher, phone AS telefon
	FROM teachers;

-- Предикат(клаузула) ORDER
SELECT name, phone
	FROM teachers
	ORDER BY name;
	
-- ASC - в порядке возростания (по умолчанию)
SELECT name, phone
	FROM teachers
	ORDER BY name ASC;

-- DESC - в порядке убывания	
SELECT name, phone
	FROM teachers
	ORDER BY name DESC;

-- ORDER BY 1 - по первой колонке результата (в нашем случае это name)	
SELECT name, phone
	FROM teachers
	ORDER BY 1;

-- LIMIT - лимит вывода записи	
SELECT name, phone
	FROM teachers
	ORDER BY name
	LIMIT 2;

-- LIMIT 2,3 - лимит вывода записи, с второй три записи	
SELECT name, phone
	FROM teachers
	ORDER BY name
	LIMIT 2,3;
	
	
