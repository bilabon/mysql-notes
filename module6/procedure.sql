-- Создание БД
CREATE DATABASE IF NOT EXISTS module6;
USE module6;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;

-- Создание процедуры
-- Меняем оконцовку с ";" на "|", чтобы оператор, не "разваливался"
DELIMITER |
	DROP PROCEDURE IF EXISTS spSample1 |
	CREATE PROCEDURE spSample1()
	BEGIN
		SELECT 'Список преподавателей' AS '  ';
		SELECT name FROM teachers ORDER BY name;
	END;
	|
DELIMITER ;

-- Вызов процедуры
CALL spSample1();

-- Процедуры с параметрами
DELIMITER |
DROP PROCEDURE IF EXISTS spCourseByDate |

CREATE PROCEDURE spCourseByDate
	(IN teacherId INT, IN courseDate DATE)
BEGIN
	SELECT courses.id, courses.title
		FROM couRses
			INNER JOIN lessons ON courses.id = lessons.course
		WHERE lessons.lesson_date = courseDate
			AND lessons.teacher = teacherId;
END;
|
DELIMITER ;

-- Вызов процедуры
CALL spCourseByDate(1, '2006-09-15');
CALL spCourseByDate(2, '2006-09-16');

-- Какие занятия были в указанный месяц и год
DELIMITER |
DROP PROCEDURE IF EXISTS spCourseByDates|

CREATE PROCEDURE spCourseByDates
	(IN dateStart DATE, IN dateEnd DATE, OUT recordCount INT)
BEGIN
	-- Создаём временную таблицу с результатами запроса
	CREATE TEMPORARY TABLE courseByDatesResults
		SELECT courses.id, courses.title
			FROM courses
				INNER JOIN lessons ON courses.id = lessons.course
			WHERE lessons.lesson_date BETWEEN dateStart AND dateEnd;
	-- Подсчитаем сколько в ней записей в переменную
	SELECT COUNT(*) INTO recordCount
		FROM courseBydatesResults;
	-- Вернем результат
	SELECT * FROM courseByDatesResults;
	-- Удалим временную таблицу
	DROP TEMPORARY TABLE courseByDatesResults;	
END;|
DELIMITER ;

-- Вызов процедуры
CALL spCourseByDates('2006-09-15', '2006-09-25', @count);
SELECT @count;

-- Коды ошибок
-- http://dev.mysql.com/doc/refman/5.1/en/error-messages-server.html

-- Какие занятия были в указанный месяц и год
DELIMITER |
DROP PROCEDURE IF EXISTS spCourseByDates|

CREATE PROCEDURE spCourseByDates
	(IN dateStart DATE, IN dateEnd DATE, OUT recordCount INT)
BEGIN
	-- Создаём временную таблицу с результатами запроса
	CREATE TEMPORARY TABLE courseByDatesResults
		SELECT courses.id, courses.title
			FROM courses
				INNER JOIN lessons ON courses.id = lessons.course
			WHERE lessons.lesson_date BETWEEN dateStart AND dateEnd;
	-- Подсчитаем сколько в ней записей в переменную
	SELECT COUNT(*) INTO recordCount
		FROM courseBydatesResults;
	--	
	-- Проверим, сколько значений удалось выбнать
	IF recordCount = 0 THEN
		-- Если данных нет - вернем предупреждение
		SELECT 0 AS id, 'Данных нет' AS title;
	ELSE
	-- Вернем результат
	SELECT * FROM courseByDatesResults;
	END IF;
	--
	-- Удалим временную таблицу
	DROP TEMPORARY TABLE courseByDatesResults;	
END;|
DELIMITER ;

-- Вызов процедуры
CALL spCourseByDates('2006-09-15', '2006-09-25', @count);
SELECT @count;

CALL spCourseByDates('2009-09-15', '2009-09-25', @count);
SELECT @count;