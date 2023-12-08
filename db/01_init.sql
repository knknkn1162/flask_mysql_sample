create user test@'%' identified by 'test';
grant all on mydb.* to test@'%' with grant option;

use mydb;
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(32) not null,
    price int not null
);
INSERT INTO product (title, price) VALUES ('aaa', 100);
INSERT INTO product (title, price) VALUES ('bbb', 200);
INSERT INTO product (title, price) VALUES ('ccc', 200);