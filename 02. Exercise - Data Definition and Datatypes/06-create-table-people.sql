CREATE TABLE people(
 id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(200) NOT NULL,
 picture BLOB,
 height DOUBLE(6,2),
 weight DOUBLE(6,2),
 gender char(1) NOT NULL,
 birthdate DATE NOT NULL,
 biography BLOB
);

INSERT INTO people(name, picture, height, weight, gender, birthdate, biography) VALUES 
('Ivan', 'test','1.89',95.5,'m','1976-05-04','test'),
('Gosho', 'test','1.89',95.5,'m','1976-05-04','test'),
('Lilyan', 'test','1.89',95.5,'m','1976-05-04','test'),
('Maria', 'test','1.89',95.5,'f','1976-05-04','test'),
('Tsveti', 'test','1.89',95.5,'f','1976-05-04','test');