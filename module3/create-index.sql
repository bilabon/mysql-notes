-- Упражнения к 3му модулю
-- Создание таблиц данных

USE module3;

-- Удаление таблицы
DROP TABLE IF EXISTS table2;

-- Создание таблицы с помощью описания
CREATE TABLE table2(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код товара',
	name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
	price FLOAT NOT NULL DEFAULT 0 COMMENT 'Цена товара',
	PRIMARY KEY (id)
) COMMENT 'Таблица товаров с первичным ключом';

-- Создаём индекс
CREATE INDEX ixName ON table2 (name);
CREATE INDEX ixPrice ON table2(price);

-- Удаление индекса
DROP INDEX ixPrice ON table2;

-- Создание индекса при создании таблицы
DROP TABLE IF EXISTS table5;
CREATE TABLE table5(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код товара',
	code CHAR(4) NOT NULL DEFAULT 'AAAA',
	name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
	price FLOAT NOT NULL DEFAULT 0 COMMENT 'Цена товара',
	CONSTRAINT pkId PRIMARY KEY (id),
	CONSTRAINT ixCode UNIQUE KEY (code),
	INDEX ixName (name),
	INDEX ixPrice (price)
) COMMENT 'Таблица товаров с ключем и индексами (справочник)';

DROP TABLE IF EXISTS table6_child;
CREATE TABLE table6_child(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код записи',
	code CHAR(4) NOT NULL DEFAULT 'AAAA' COMMENT 'Код товара',
	quo FLOAT NOT NULL DEFAULT 0 COMMENT 'Приход/расход товара',
	CONSTRAINT pkId PRIMARY KEY (id),
	INDEX ixCode (code),
	CONSTRAINT fkTable5Code FOREIGN KEY (code)
		REFERENCES table5 (code)
) COMMENT 'Таблица прихода товаров';

-- Добавим товар
INSERT INTO table5 (code, name, price)
	VALUES ('ZZZZ', 'Проба', 16.8);
	
-- Приход товара
INSERT INTO table6_child (code, quo)
	VALUES ('ZZZZ', 10);
	
-- Ошибка в коде товара
INSERT INTO table5 (code, name, price)
	VALUES ('ZZZZ', 'Мега Проба', 18);
	
INSERT INTO table6_child (code, quo)
	VALUES ('XXXX', 10);
	
INSERT INTO table6_child (code, quo)
	VALUES ('ZZZZ', 20);