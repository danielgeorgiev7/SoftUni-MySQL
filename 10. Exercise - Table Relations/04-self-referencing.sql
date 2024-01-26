CREATE TABLE teachers (
    teacher_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manager_id INT,
    CONSTRAINT fk_teachers_manager_id FOREIGN KEY (manager_id)
        REFERENCES teachers (teacher_id)
);

INSERT INTO teachers (teacher_id, name, manager_id) VALUES
(101, 'John', NULL),
(106, 'Greta', 101),
(105, 'Mark', 101),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105);
