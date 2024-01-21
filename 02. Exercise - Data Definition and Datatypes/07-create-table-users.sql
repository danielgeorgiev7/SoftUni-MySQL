CREATE TABLE users(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATETIME,
    is_deleted BOOLEAN
);

INSERT INTO users(username, password, profile_picture, last_login_time, is_deleted) VALUES
('Pesho', '123', 'test', NOW(), false),
('Pesho1', '123', 'test', NOW(), false),
('Pesho2', '123', 'test', NOW(), true),
('Pesho3', '123', 'test', NOW(), false),
('Pesho4', '123', 'test', NOW(), false);