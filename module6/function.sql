-- Создание БД
CREATE DATABASE IF NOT EXISTS module6;
USE module6;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

-- Функция возвращает номер аудитории 'БК-1' в виде числа
DELIMITER |
DROP FUNCTION IF EXISTS spRoomNumber|
CREATE FUNCTION spRoomNumber(room VARCHAR(50) ) RETURNS INT
BEGIN
	-- вырезаем все начиная с 4го символа и приводим к числу
	RETURN SUBSTR(room, 4)*1;
END;|
DELIMITER ;

-- Вызов функции
SELECT spRoomNumber('БК-10');

-- Сделать нормальную сортировку
SELECT room, lesson_date
	FROM lessons
	ORDER BY room;
	
-- Использование функции
SELECT room, lesson_date
	FROM lessons
	ORDER BY spRoomNumber(room);
