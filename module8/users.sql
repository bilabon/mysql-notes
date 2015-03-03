-- Пользователь fedya
CREATE USER 'fedya'@'%';
SET PASSWORD FOR 'fedya'@'%' = PASSWORD('password');

CREATE USER 'vasya'@'%' IDENTIFIED BY 'password';

USE mysql;
SELECT user, host, password FROM mysql.user;