/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
	id_usuarios INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);

-- PASO 2
-- Tu código aquí
CREATE TABLE usuarios (
	id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

-- PASO 3
-- Tu código aquí
ALTER TABLE test.usuarios ADD id_rol INT;

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol 
FROM usuarios 
INNER JOIN roles ON usuarios.id_rol=roles.id_rol
ORDER BY id_usuario ASC;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
	id_categorias INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria INT NOT NULL;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1,20);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2,19);
UPDATE usuarios SET id_categoria = 3 WHERE id_usuario IN (3,18);
UPDATE usuarios SET id_categoria = 4 WHERE id_usuario IN (4,17);
UPDATE usuarios SET id_categoria = 5 WHERE id_usuario IN (5,16);
UPDATE usuarios SET id_categoria = 6 WHERE id_usuario IN (6,15);
UPDATE usuarios SET id_categoria = 7 WHERE id_usuario IN (7,14);
UPDATE usuarios SET id_categoria = 8 WHERE id_usuario IN (8,13);
UPDATE usuarios SET id_categoria = 9 WHERE id_usuario IN (9,12);
UPDATE usuarios SET id_categoria = 10 WHERE id_usuario IN (10,11);

-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
INNER JOIN roles ON usuarios.id_rol = roles.id_rol 
INNER JOIN categorias ON usuarios.id_categoria = categorias.id_categorias
ORDER BY id_usuario ASC;


/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT
);

ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categorias);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 3),
(1, 4), 
(1, 6),
(2, 8), 
(2, 2),
(3, 4), 
(3, 6),
(4, 1), 
(4, 9), 
(4, 10),
(5, 10),
(5, 10),
(5, 10),
(5, 10),
(6, 10),
(6, 10),
(7, 10),
(7, 10),
(7, 10),
(8, 10),
(8, 10),
(8, 10),
(9, 10),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(18, 10),
(19, 10),
(20, 10);

-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
INNER JOIN roles ON usuarios.id_rol = roles.id_rol 
INNER JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario AND categorias.id_categoria = categoria.id_categoria
ORDER BY id_usuario ASC;
