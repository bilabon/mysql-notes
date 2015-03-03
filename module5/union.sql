-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

UPDATE lessons SET length = 5 WHERE teacher = 3 LIMIT 3;
UPDATE lessons SET length = 7 WHERE teacher = 1 LIMIT 5;

-- Продолжительность занятий в аудиториях для препода 1 и 2
SELECT teacher, length, ' ' AS memo FROM lessons WHERE teacher = 3
UNION SELECT teacher, avg(length), 'Среднее' AS memo FROM lessons WHERE teacher = 3
UNION SELECT teacher, SUM(length), 'Всего' AS memo FROM lessons WHERE teacher = 3
UNION SELECT teacher, length, ' ' AS memo FROM lessons WHERE teacher = 1
UNION SELECT teacher, avg(length), 'Среднее' AS memo FROM lessons WHERE teacher = 1
UNION SELECT teacher, SUM(length), 'Всего' AS memo FROM lessons WHERE teacher = 1
;

SELECT teacher, length FROM lessons WHERE teacher = 3
UNION all SELECT teacher,length FROM lessons WHERE teacher = 1;

SELECT teacher, length FROM lessons WHERE teacher = 3
UNION SELECT teacher,length FROM lessons WHERE teacher = 1;