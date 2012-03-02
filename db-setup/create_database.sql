-- CREATE DATABASE VIGRAHA
DROP DATABASE IF EXISTS `vigraha`;
CREATE DATABASE IF NOT EXISTS `vigraha`;
-- create user
CREATE USER 'user'@'localhost' IDENTIFIED BY 'test';
GRANT ALL ON vigraha.* TO 'user'@'localhost';

USE `vigraha`;
