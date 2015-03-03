-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

-- Какие курсы читались в текущем месяце(например, в сентябре 2006)
SELECT DISTINCT course
	FROM lessons
	WHERE MONTH(lesson_date) = 9
		AND YEAR(lesson_date) = 2006;
		

DROP VIEW IF EXISTS currCourses;
CREATE VIEW currCourses AS
	SELECT DISTINCT course
		FROM lessons
		WHERE MONTH(lesson_date) = 9
			AND YEAR(lesson_date) = 2006;
			
-- Пример::Таблица продуктов
DROP TABLE IF EXISTS product;
CREATE TABLE product(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	title VARCHAR(30) NOT NULL DEFAULT '',
	price FLOAT NOT NULL DEFAULT 0,
	quo FLOAT NOT NULL DEFAULT 0,
	PRIMARY KEY (id)
);

INSERT INTO product
	VALUES
		(1, 'Товар 1', 123, 200),
		(2, 'Товар 2', 150, 200),
		(3, 'Товар 3', 187, 300),
		(4, 'Товар 4', 300, 400),
		(5, 'Товар 5', 225, 500);
		
INSERT INTO product
	VALUES (6, 'Товар 6', 1000, 200);
		
-- Продукты с налогами, причем только те, которые есть на складе
DROP VIEW IF EXISTS productWithTax;

CREATE VIEW productWithTax AS
	SELECT *, price * 1.18 AS price_tax
		FROM product
		WHERE quo > 0;
		
SELECT * FROM productWithTax;

DELETE FROM productWithTax WHERE id = 5;