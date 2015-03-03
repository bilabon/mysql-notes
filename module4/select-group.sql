-- Создание базы данных
USE module4;

-- что в group by то и в select
-- Сколько часов начитал тот или иной преподаватель
SELECT teacher, SUM(length)
	FROM lessons
	GROUP BY teacher;
	
SELECT teacher, course, SUM(length)
	FROM lessons
	GROUP BY teacher, course;
	
SELECT teacher, course, SUM(length)
	FROM lessons
	GROUP BY teacher, course WITH ROLLUP;
	
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM lessons
	GROUP BY YEAR(lesson_date), MONTH(lesson_date);
	
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM lessons
	WHERE teacher IN (1, 3, 5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date);
	
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM lessons
	WHERE teacher IN (1, 3, 5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date) WITH ROLLUP;
	
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM lessons
	WHERE teacher IN (1, 3, 5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date) WITH ROLLUP
	HAVING SUM(length) > 30;
	
SELECT teacher, course, SUM(length)
	FROM lessons
	GROUP BY teacher, course WITH ROLLUP
	HAVING course IS NULL;
	
-- WHERE
-- GROUP
-- HAVING
-- ORDER
-- LIMIT