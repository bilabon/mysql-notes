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


-- Вставка данных
INSERT INTO table2
	VALUES (10, 'Товар', 123.5);
	
INSERT INTO table2
	VALUES (NULL, 'Товар', 123.5);
	
INSERT INTO table2 (name, price)
	VALUES ('Товар', 123.5);
	
-- Вставка нескольких значений
INSERT INTO table2 VALUES
	(21, 'Товар 21', 12.5),
	(22, 'Товар 22', 123.5),
	(23, 'Товар 23', 12.5),
	(24, 'Товар 24', 123.5),use
	(25, 'Товар 25', 12.5),
	(26, 'Товар 26', 12.5),
	(27, 'Товар 27', 123.5);
	
-- Игнорировать ошибки конкретного ряда
INSERT IGNORE INTO table2 VALUES
	(21, 'Товар 21', 12.5),
	(42, 'Товар 42', 123.5),
	(43, 'Товар 43', 12.5),
	(44, 'Товар 44', 123.5),
	(45, 'Товар 45', 12.5),
	(46, 'Товар 46', 12.5),
	(47, 'Товар 47', 123.5);
	
-- Вставка результатов выборки (число столбцов должно совпадать)
-- price виртуальный столбец
INSERT INTO table2 (name, price)
	SELECT user, 123 as price
		FROM mysql.user;
		
-- Отключение индексов (Для движка MyISAM)
ALTER TABLE table2 DISABLE KEYS;

-- Массовая вставка данных
INSERT IGNORE INTO table2 VALUES
	(51, 'Товар 51', 12.5),
	(52, 'Товар 52', 123.5),
	(53, 'Товар 53', 12.5),
	(54, 'Товар 54', 123.5),
	(55, 'Товар 55', 12.5),
	(56, 'Товар 56', 12.5),
	(57, 'Товар 57', 123.5);
	
-- Включаем индексы (Для движка MyISAM)
ALTER TABLE table2 ENABLE KEYS;

-- end