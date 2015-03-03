-- Пользователь fedya
CREATE USER 'fedya'@'%';
SET PASSWORD FOR 'fedya'@'%' = PASSWORD('password');

CREATE USER 'vasya'@'%' IDENTIFIED BY 'password';

GRANT SELECT ON module6.lessons TO 'fedya'@'%';
GRANT SELECT ON module6.courses TO 'fedya'@'%';
GRANT SELECT ON module6.teachers TO 'fedya'@'%';

REVOKE ALL PRIVILEGES
	ON module6.*
	FROM 'fedya'@'%';
	
	
-- Просмотр привилегий для таблиц
SELECT grantee AS 'user', table_schema AS 'DB', table_name AS 'table', privilege_type AS 'privilege' FROM information_schema.table_privileges;
