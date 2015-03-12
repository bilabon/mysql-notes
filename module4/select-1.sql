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
	
SELECT name, phone
	FROM teachers
	ORDER BY name ASC;
	
SELECT name, phone
	FROM teachers
	ORDER BY name DESC;
	
SELECT name, phone
	FROM teachers
	ORDER BY 1;
	
SELECT name, phone
	FROM teachers
	ORDER BY name
	LIMIT 2;

SELECT name, phone
	FROM teachers
	ORDER BY name
	LIMIT 2,3;
	
	
