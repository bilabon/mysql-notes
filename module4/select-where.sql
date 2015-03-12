-- Создание базы данных
USE module4;


SELECT name, phone
	FROM teachers
	WHERE phone = '987-65-43';
	
SELECT name, phone
	FROM teachers
	WHERE NOT phone = '987-65-43';
	
SELECT lesson_date, room
	FROM lessons
	WHERE teacher = 1;
	
SELECT lesson_date, room
	FROM lessons
	WHERE teacher = 1
	ORDER BY lesson_date DESC;
	
-- Уникальные записи (DISTINCT - удаляет дубликаты с выдачи)
SELECT DISTINCT room FROM lessons;
-- Поумолчанию
SELECT ALL room FROM lessons;

-- Выборка с пустыми значениями teacher
SELECT lesson_date, room
	FROM lessons
	WHERE teacher is NULL;

SELECT lesson_date, room
	FROM lessons
	WHERE lesson_date BETWEEN '2006-09-10' AND '2006-09-20';
	
-- //* = %// //? = _//
SELECT title
	FROM courses
	WHERE title LIKE '%web%'
	OR description LIKE '%web%';

-- Регулярные выражения
SELECT title
	FROM courses
	WHERE title REGEXP '^[0-9]{3}';

SELECT title
	FROM courses
	WHERE title REGEXP '[0-9]$';

	
SELECT lesson_date, room
	FROM lessons
	WHERE teacher IN (1, 3, 5);

SELECT lesson_date, room
	FROM lessons
	WHERE room IN ('БК-1', 'БК-3', 'БК-5');

SELECT DISTINCT YEAR(lesson_date), MONTH(lesson_date)
	FROM lessons
	WHERE teacher IN (1, 3, 5);

-- Добавляем к дате 31 день	
SELECT DATE_ADD('2008-01-02', INTERVAL 31 DAY);

SELECT DATE_ADD(NOW(), INTERVAL 100 DAY);
