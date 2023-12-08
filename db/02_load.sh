#!/bin/bash
set -e

mysql -u ${DB_USER} -D ${DB_NAME} -h ${DB_HOST} -p${DB_PASSWORD} <<-EOF
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(32) not null,
    price int not null
);
INSERT INTO product (title, price) VALUES ('aaa', 100);
INSERT INTO product (title, price) VALUES ('bbb', 200);
INSERT INTO product (title, price) VALUES ('ccc', 200);
EOF