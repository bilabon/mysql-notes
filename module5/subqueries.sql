-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

-- Выведем курсы где преподаватель Иванов
SELECT course, room, length FROM lessons WHERE teacher = (
	SELECT id FROM teachers WHERE name LIKE 'Иванов%'
);

-- С правильным названием курса
SELECT (SELECT title FROM courses WHERE id = lessons.course) AS course, room, length FROM lessons WHERE teacher = (
 	SELECT id FROM teachers WHERE name LIKE 'Иванов%'
);

-- Имя преподавателя заголовок курса для преподавателя 1
SELECT 
	(SELECT name FROM teachers WHERE id = lessons.teacher) AS teacher,
	(SELECT title FROM courses WHERE id = lessons.course) AS course, 
	room
	FROM lessons WHERE teacher = 1
;