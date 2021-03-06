-- Создание базы данных
CREATE DATABASE IF NOT EXISTS `module7`;
USE `module7`;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

-- Блокировка таблицы на чтение
LOCK TABLES teachers READ;

-- Выборка работает
SELECT name FROM teachers;

-- Вставка не работает
INSERT INTO teachers (id, name) VALUES (10, 'Новый преподаватель');
INSERT DELAYED INTO teachers (id, name) VALUES (10, 'Новый преподаватель');

UNLOCK TABLES;

-- Блокировка на запись
LOCK TABLES teachers WRITE;

SELECT name FROM teachers;

DELETE FROM teachers WHERE id = 10;

UNLOCK TABLES;

-- "Блокировка" записей
SELECT GET_LOCK('abc', 10);
SELECT RELEASE_LOCK('abc');