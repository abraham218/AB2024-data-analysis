CREATE DATABASE IF NOT EXISTS user_db;

USE user_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO users (name, phone) VALUES
('Alice', '123-456-7890'),
('Abraham', '480-765-0666'),
('Susan', '9603691313'),
('Eve', '333-333-3333');

