SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Usuarios`;
DROP TABLE IF EXISTS `Publicaciones`;
DROP TABLE IF EXISTS `Libros`;
DROP TABLE IF EXISTS `Editoriales`;
DROP TABLE IF EXISTS `Autores`;
DROP TABLE IF EXISTS `Libros_Autores`;
DROP TABLE IF EXISTS `Carrito`;
DROP TABLE IF EXISTS `Foto_publicaciones`;
DROP TABLE IF EXISTS `Categorias`;
DROP TABLE IF EXISTS `carrito_detalle`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Usuarios` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `dni` INTEGER NOT NULL,
    `direccion` VARCHAR(100) NOT NULL,
    `localidad` VARCHAR(100) NOT NULL,
    `provincia` VARCHAR(100) NOT NULL,
    `pais` VARCHAR(100) NOT NULL,
    `telefono` INTEGER NOT NULL,
    `img_url` VARCHAR(100) NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Publicaciones` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `titulo` VARCHAR(100) NOT NULL,
    `detalle` VARCHAR(500),
    `estado_libro` CHAR(1) NOT NULL,
    `precio` DECIMAL NOT NULL,
    `fecha_publicacion` DATETIME NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    `id_libro` INTEGER NOT NULL,
    `id_usuario` INTEGER NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Libros` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `titulo` VARCHAR(100) NOT NULL,
    `isbn` INTEGER NOT NULL,
    `edicion` SMALLINT NOT NULL,
    `fecha_edicion` DATE NOT NULL,
    `id_editorial` INTEGER NOT NULL,
    `id_categoria` INTEGER NOT NULL,
    `status` SMALLINT  DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`, `isbn`)
);

CREATE TABLE `Editoriales` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `direccion` VARCHAR(100),
    `telefono` INTEGER,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Autores` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Libros_Autores` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `id_libro` INTEGER NOT NULL,
    `id_autor` INTEGER NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Carrito` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `fecha` DATETIME NOT NULL,
    `id_usuario` INTEGER NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Foto_publicaciones` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `filename` VARCHAR(20) NOT NULL,
    `path` VARCHAR(100) NOT NULL,
    `id_publicacion` INTEGER NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `Categorias` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `categoria` VARCHAR(50) NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

CREATE TABLE `carrito_detalle` (
    `id` INTEGER AUTO_INCREMENT NOT NULL,
    `id_carrito` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `id_publicacion` INTEGER NOT NULL,
    `status` SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`id`)
);

ALTER TABLE `Publicaciones` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios`(`id`);
ALTER TABLE `Publicaciones` ADD FOREIGN KEY (`id_libro`) REFERENCES `Libros`(`id`);
ALTER TABLE `Libros` ADD FOREIGN KEY (`id_editorial`) REFERENCES `Editoriales`(`id`);
ALTER TABLE `Libros` ADD FOREIGN KEY (`id_categoria`) REFERENCES `Categorias`(`id`);
ALTER TABLE `Libros_Autores` ADD FOREIGN KEY (`id_libro`) REFERENCES `Libros`(`id`);
ALTER TABLE `Libros_Autores` ADD FOREIGN KEY (`id_autor`) REFERENCES `Autores`(`id`);
ALTER TABLE `Carrito` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios`(`id`);
ALTER TABLE `Foto_publicaciones` ADD FOREIGN KEY (`id_publicacion`) REFERENCES `Publicaciones`(`id`);
ALTER TABLE `carrito_detalle` ADD FOREIGN KEY (`id_carrito`) REFERENCES `Carrito`(`id`);
ALTER TABLE `carrito_detalle` ADD FOREIGN KEY (`id_publicacion`) REFERENCES `Publicaciones`(`id`);