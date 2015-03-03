-- Упражнения к 3му модулю
USE module3;
-- Создание таблиц данных
-- Удаление таблицы
DROP TABLE IF EXISTS table2;

-- Создание таблицы с помощью описания
CREATE TABLE table2(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код товара',
	name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
	price FLOAT NOT NULL DEFAULT 0 COMMENT 'Цена товара',
	PRIMARY KEY (id)
) COMMENT 'Таблица товаров с первичным ключом';

-- Удаление записей
DELETE FROM table2
	WHERE id = 1;
	
-- Удаление последней записи
DELETE FROM table2
	ORDER BY id DESC
	LIMIT 1;