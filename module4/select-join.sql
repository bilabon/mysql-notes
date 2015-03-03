-- Создание базы данных
USE module4;

-- Кто из преподавателей читал курс 30 сентября
SELECT teachers.name
	FROM teachers
		INNER JOIN lessons ON teachers.id = lessons.teacher
	WHERE lessons.lesson_date = '2006-09-30';
	
-- Кто из преподавателей читает курсы Web
SELECT teachers.name, courses.title
	FROM teachers
		INNER JOIN lessons ON teachers.id = lessons.teacher
		INNER JOIN courses ON courses.id = lessons.course
	WHERE courses.title LIKE '%Web%'
		OR courses.description LIKE '%Web%'
	GROUP BY teachers.name, courses.title;
		
-- Какие курсы преподаватель ИВАНОВ
SELECT DISTINCT courses.title
	FROM courses
		INNER JOIN lessons ON courses.id = lessons.course
		INNER JOIN teachers ON teachers.id = lessons.teacher
	WHERE teachers.name LIKE '%ИВАНОВ%';
	
-- Запись в стиле Дюма =)
SELECT DISTINCT 
	teachers.name,		-- имя преподавателя
	courses.title		-- Название курса
	FROM teachers
		INNER JOIN lessons ON teachers.id = lessons.teacher
		INNER JOIN courses ON courses.id = lessons.course
	WHERE courses.title LIKE '%Web%'
		OR courses.description LIKE '%Web%';
		
-- Еще один препод
INSERT INTO teachers (name) VALUES ('Новый препод');

-- Когда последний раз преподаватели вели занятия
SELECT teachers.name, MAX(lessons.lesson_date)
	FROM teachers
		INNER JOIN lessons ON teachers.id = lessons.teacher
	GROUP BY teachers.name;

-- Полный список преподавателей и даты, когда они вели занятия прошлый раз
SELECT teachers.name, MAX(lessons.lesson_date)
	FROM teachers
		LEFT JOIN lessons ON teachers.id = lessons.teacher
	GROUP BY teachers.name
	ORDER BY 1;
