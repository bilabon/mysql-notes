-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module4;
USE module4;
-- Таблица с данными
CREATE TABLE courses1 ENGINE=MyISAM SELECT * FROM course.courses;

-- Полнотекстовый ИНДЕКС (ixFullText - назвали так индекс/ опционно)
CREATE FULLTEXT INDEX ixFullText ON courses1 (title, description);

-- Поиск в режиме естественного языка
SELECT title, length
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST('some text' IN NATURAL LANGUAGE MODE);

SELECT title, length
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST('основы программирования' IN NATURAL LANGUAGE MODE);
		
-- Поиск в режиме логического сравнения
SELECT title, length
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST('-mysql +программирования' IN BOOLEAN MODE);

-- Поиск в смешанном режиме (сортировка в режиме естественного, фильтрация в логическом)
-- Логический режим с сортировкой по релевантности
SELECT title, length, 
	MATCH (title, description) AGAINST('PHP' IN NATURAL LANGUAGE MODE) AS score
		FROM courses1
		WHERE MATCH (title, description) 
			AGAINST('PHP*' IN BOOLEAN MODE)
	ORDER BY score DESC;
	-- Fulltext search in my.ini - ft_min_word_len=3
	
	--Переиндексация
	REPAIR TABLE courses1 QUICK;
