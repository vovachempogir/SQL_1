    Домашнее задание 1
        Задание 1

    CREATE DATABASE skypro;
    \c skypro

        Задание 2

    CREATE TABLE employee(
        id BIGSERIAL NOT NULL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        gender VARCHAR(6) NOT NULL
        age INT NOT NULL
    );

        Задание 3

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
___________________________________________________________________________________
    Домашнее задание 2
        Задание 1

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Светлана', 'Кудрякова', 'жен', 64);

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Оля', 'Кат', 'жен', 23);

    INSERT INTO employee(
        first_name, last_name, gender, age
    )
    VALUES ('Олег', 'Сырчин', 'муж', 54);

    SELECT first_name AS Имя,
           last_name AS Фамилия
    FROM employee;

    SELECT first_name AS Имя,
           last_name AS Фамилия
    FROM employee
    WHERE age < 30 OR age >50;

    SELECT first_name AS Имя,
           last_name AS Фамилия
    FROM employee
    WHERE age BETWEEN 30 AND 50;

    SELECT * FROM employee
    ORDER BY last_name DESC;

    SELECT first_name
    From employee
    where first_name like '_____%';

        Задание 2

    UPDATE employee
    SET first_name='Владимир',
        last_name='Чемпогир'
    where id='3';

    UPDATE employee
    SET first_name='Светлана',
        last_name='Кудрякова'
    where id='5';

    SELECT first_name AS Имя,
    SUM(age) AS Суммарный_возраст
    FROM employee
    GROUP BY first_name;

    SELECT first_name AS Имя,
           age AS Возраст
    FROM employee
    WHERE age=(
        SELECT MIN(age)
        FROM employee
    );

    SELECT first_name AS Имя,
           age AS Возраст
    FROM employee
    WHERE age=(SELECT MAX(age)
               FROM employee
               WHERE first_name = 'Владимир')
       OR age=(SELECT MAX(age)
               FROM employee
               WHERE first_name = 'Светлана')
    ORDER BY age;
___________________________________________________________________________________
    Домашнее задание 3
        Задание 1

    CREATE TABLE city(
        city_id BIGSERIAL NOT NULL PRIMARY KEY,
        city_name VARCHAR(50) NOT NULL);

    ALTER TABLE employee
        ADD city_id INT;

    ALTER TABLE employee
        ADD CONSTRAINT city_id
        FOREIGN KEY (city_id) REFERENCES city(city_id);

    INSERT INTO city(city_name)
    VALUES ('Санкт-Петербург');

    INSERT INTO city(city_name)
    VALUES ('Москва');

    INSERT INTO city(city_name)
    VALUES ('Дудинка');

    INSERT INTO city(city_name)
    VALUES ('Красноярск');

    Update employee
        SET city_id = '1'
        WHERE first_name = 'Владимир';

    Update employee
        SET city_id = '2'
        WHERE first_name = 'Светлана';

    UPDATE employee
        SET city_id = '3'
        WHERE last_name = 'Сырчин';

        Задание 2

    SELECT employee.first_name AS Имя,
           employee.last_name  AS фамилия,
           city.city_name      AS Город
    FROM employee
             INNER JOIN city
                        ON employee.city_id = city.city_id;

    SELECT employee.first_name AS Имя,
           employee.last_name  AS фамилия,
           city.city_name      AS Город
    FROM employee
             RIGHT JOIN city
                        ON employee.city_id = city.city_id;

    INSERT INTO employee(first_name, last_name, gender, age)
    VALUES ('Юлия', 'Кат', 'жен', 32);

    SELECT employee.first_name AS Имя,
           employee.last_name  AS фамилия,
           city.city_name      AS Город
    FROM employee
             FULL JOIN city
                       ON employee.city_id = city.city_id;

    SELECT employee.first_name AS Имя,
           employee.last_name  AS фамилия,
           city.city_name      AS Город
    FROM employee
             CROSS JOIN city;
___________________________________________________________________________________