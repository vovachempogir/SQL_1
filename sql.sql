CREATE DATABASE skypro;
    \c skypro
    CREATE TABLE employee(
        id BIGSERIAL NOT NULL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        gender VARCHAR(6) NOT NULL
        age INT NOT NULL
    );

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Владимир', 'Чемпогир', 'муж', 25);

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Юлия', 'Кат', 'жен', 32);

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Михаил', 'Кудряков', 'муж', 42);

    SELECT * FROM employee;

    UPDATE employee SET first_name = 'Константин' WHERE id = 2;
    UPDATE employee SET last_name = 'Петросян' WHERE id = 2;
    UPDATE employee SET gender = 'муж' WHERE id = 2;
    UPDATE employee SET age = 26 WHERE id = 2;

    SELECT * FROM employee;

    DELETE FROM employee WHERE id = 2;

    SELECT * FROM employee;
