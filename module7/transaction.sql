-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module7;
USE module7;

-- Начинаем транзакцию
START TRANSACTION;
SELECT id, name FROM teachers;
INSERT INTO teachers (id, name) VALUES (11, 'Новый препад');
DELETE FROM teachers WHERE id = 11;
ROLLBACK;
COMMIT;


SET AUTOCOMMIT = 1; -- 0


-- SESSION Для моей сессии GLOBAL Для всех пользователей при следующем подключении
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Первый
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
DELETE FROM teachers WHERE id = 4;
COMMIT;

-- Второй
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
UPDATE teachers SET name = 'qwerty' WHERE id = 4;
SELECT id, name FROM teachers;
COMMIT;