CREATE DATABASE movies;
USE movies;

CREATE TABLE directors (
    id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE genres (
    id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE categories (
    id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE movies (
    id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT UNSIGNED NOT NULL,
    copyright_year YEAR NOT NULL,
    length TIME NOT NULL,
    genre_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    rating DOUBLE NOT NULL DEFAULT 0,
    notes TEXT
);

INSERT INTO directors (director_name, notes) VALUES
('Christopher Nolan', 'Renowned for mind-bending films'),
('Quentin Tarantino', 'Master of nonlinear storytelling'),
('Steven Spielberg', 'Legendary filmmaker'),
('Greta Gerwig', 'Acclaimed for her directorial debut'),
('Jordan Peele', 'Known for his unique horror films');

INSERT INTO genres (genre_name, notes) VALUES
('Action', 'High-intensity and thrilling'),
('Drama', 'Character-driven storytelling'),
('Sci-Fi', 'Futuristic and imaginative'),
('Comedy', 'Light-hearted and humorous'),
('Horror', 'Intense and frightening');

INSERT INTO categories (category_name, notes) VALUES
('Adventure', 'Exciting and risky endeavors'),
('Romance', 'Love and relationships'),
('Mystery', 'Intriguing and puzzling'),
('Animation', 'Animated films'),
('Thriller', 'Suspenseful and thrilling');

INSERT INTO movies (title, director_id, copyright_year, length, genre_id, category_id, rating, notes) VALUES
('Inception', 1, 2010, '02:28:00', 3, 1, 8.7, 'Mind-bending thriller'),
('Pulp Fiction', 2, 1994, '02:34:00', 2, 5, 8.9, 'Cult classic'),
('Jurassic Park', 3, 1993, '02:07:00', 1, 1, 8.1, 'Dinosaurs come to life'),
('Lady Bird', 4, 2017, '01:34:00', 2, 2, 7.4, 'Coming-of-age drama'),
('Get Out', 5, 2017, '01:44:00', 5, 3, 7.7, 'Social thriller');