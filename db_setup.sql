-- Ensure the database exists
CREATE DATABASE IF NOT EXISTS MyDriversDB;
USE MyDriversDB;

-- Ensure the table exists
CREATE TABLE IF NOT EXISTS drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    channel VARCHAR(50),
    version VARCHAR(20),
    revision VARCHAR(20),
    binary_type VARCHAR(50),
    platform VARCHAR(20),
    url TEXT,
    http_status INT
);


