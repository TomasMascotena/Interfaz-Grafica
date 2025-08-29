DROP DATABASE editoriales;

CREATE DATABASE editoriales;

USE editoriales;
CREATE TABLE editoriales(
    id_editorial int PRIMARY KEY,
    nombre_editorial VARCHAR(100)
);

CREATE TABLE empleados(
    id_empleado int PRIMARY KEY,
    nombre_empleado VARCHAR(50),
    id_editorial INT,
    Foreign Key (id_editorial) REFERENCES editoriales(id_editorial)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE libros(
    id_libro int PRIMARY KEY,
    titulo_libro VARCHAR(50),
    id_editorial INT,
    Foreign Key (id_editorial) REFERENCES editoriales(id_editorial)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO editoriales (id_editorial, nombre_editorial)
VALUES
    (1, 'Editorial Planeta'),
    (2, 'Editorial Santillana'),
    (3, 'Editorial Anaya'),
    (4, 'Editorial Alfaguara'),
    (5, 'Editorial SM'),
    (6, 'Editorial Fondo de Cultura Económica'),
    (7, 'Editorial Siglo XXI'),
    (8, 'Editorial Cátedra'),
    (9, 'Editorial Tecnos'),
    (10, 'Editorial Ariel');


INSERT INTO empleados (id_empleado, nombre_empleado, id_editorial)
VALUES
    (1, 'Juan Pérez', 1),
    (2, 'María Rodríguez', 1),
    (3, 'Pedro López', 2),
    (4, 'Ana Martínez', 2),
    (5, 'Carlos García', 3),
    (6, 'Laura González', 3),
    (7, 'Luis Fernández', 4),
    (8, 'Elena Sánchez', 4),
    (9, 'Javier Ruiz', 5),
    (10, 'Sofía Torres', 5);


INSERT INTO libros (id_libro, titulo_libro, id_editorial)
VALUES
    (1, 'Cien años de soledad', 1),
    (2, 'Don Quijote de la Mancha', 1),
    (3, 'La sombra del viento', 2),
    (4, 'Rayuela', 2),
    (5, 'Crónica de una muerte anunciada', 3),
    (6, 'Los detectives salvajes', 3),
    (7, 'Ficciones', 4),
    (8, 'La casa de los espíritus', 4),
    (9, 'La ciudad y los perros', 5),
    (10, 'Cien años de soledad', 5);

SELECT * FROM editoriales;
SELECT * FROM empleados;
SELECT * FROM libros;
-- Ejercicios sobre integridad referencial:
-- 1.	Eliminar una editorial: Si se elimina una editorial de la tabla editoriales, ¿qué sucede con los libros asociados? Escriba una consulta SQL que elimine una editorial y sus libros relacionados.
DELETE FROM editoriales WHERE id_editorial = 1; 

-- 2.  Actualizar el nombre de una editorial: Si se actualiza el nombre de una editorial en la tabla editoriales, ¿qué sucede con los libros relacionados?
UPDATE editoriales SET nombre_editorial = "Editorial Cosmos" WHERE id_editorial = 2;

-- 3.	Eliminar un empleado: Si se elimina un empleado de la tabla empleados, ¿qué sucede con los libros relacionados con esa editorial?
DELETE FROM empleados WHERE id_empleado = 3;

-- 4.	Actualizar el nombre de un empleado: Si se actualiza el nombre de un empleado en la tabla empleados, ¿qué sucede con los libros relacionados con esa editorial?
UPDATE emplead

-- 5.	Eliminar un libro: Si se elimina un libro de la tabla libros, ¿qué sucede con la relación con la editorial?

-- 6.	Cambiar la editorial de un libro: Si se cambia la editorial a la que está asociado un libro en la tabla libros, ¿qué sucede con la relación con la editorial anterior?

-- 7.	Eliminar una editorial con empleados: Si se intenta eliminar una editorial que tiene empleados asociados, ¿qué sucede?

-- 8.	Eliminar un empleado con libros: Si se intenta eliminar un empleado que tiene libros asociados, ¿qué sucede?

-- 9.	Eliminar una editorial y sus empleados: ¿Cómo se eliminaría una editorial y todos sus empleados?

-- 10.	Eliminar una editorial y transferir sus empleados a otra editorial: ¿Cómo se eliminaría una editorial y reasignaría a sus empleados a otra editorial?
