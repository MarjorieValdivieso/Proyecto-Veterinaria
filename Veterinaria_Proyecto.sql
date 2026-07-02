create database Veterinaria_Proyecto;

use Veterinaria_Proyecto;
-- Tablas

create table Clientes(

	id_cliente INT AUTO_INCREMENT PRIMARY KEY,

    cedula VARCHAR(10) UNIQUE NOT NULL,

    nombres VARCHAR(100) NOT NULL,

    apellidos VARCHAR(100) NOT NULL,

    telefono VARCHAR(15),

    correo VARCHAR(100),

    direccion VARCHAR(150)

);

CREATE TABLE veterinarios (

    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,

    nombres VARCHAR(100) NOT NULL,

    apellidos VARCHAR(100) NOT NULL,

    especialidad VARCHAR(100),

    telefono VARCHAR(15)

);

CREATE TABLE proveedores (

    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,

    nombre_empresa VARCHAR(100) NOT NULL,

    telefono VARCHAR(15),

    correo VARCHAR(100),

    direccion VARCHAR(150)

);

CREATE TABLE mascotas (

    id_mascota INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    especie VARCHAR(50),

    raza VARCHAR(50),

    sexo VARCHAR(20),

    fecha_nacimiento DATE,

    peso DECIMAL(5,2),

    id_cliente INT NOT NULL,

    CONSTRAINT fk_mascota_cliente

    FOREIGN KEY (id_cliente)

    REFERENCES clientes(id_cliente)

    ON UPDATE CASCADE

    ON DELETE RESTRICT

);

CREATE TABLE citas (

    id_cita INT AUTO_INCREMENT PRIMARY KEY,

    fecha DATE NOT NULL,

    hora TIME NOT NULL,

    motivo VARCHAR(200),

    estado VARCHAR(30),

    id_mascota INT NOT NULL,

    id_veterinario INT NOT NULL,



    CONSTRAINT fk_cita_mascota

    FOREIGN KEY (id_mascota)

    REFERENCES mascotas(id_mascota)

    ON UPDATE CASCADE

    ON DELETE CASCADE,



    CONSTRAINT fk_cita_veterinario

    FOREIGN KEY (id_veterinario)

    REFERENCES veterinarios(id_veterinario)

    ON UPDATE CASCADE

    ON DELETE RESTRICT

);

CREATE TABLE consultas (

    id_consulta INT AUTO_INCREMENT PRIMARY KEY,

    fecha_consulta DATE NOT NULL,

    diagnostico TEXT,

    observaciones TEXT,

    id_mascota INT NOT NULL,

    id_veterinario INT NOT NULL,

    CONSTRAINT fk_consulta_mascota

    FOREIGN KEY (id_mascota)

    REFERENCES mascotas(id_mascota)

    ON UPDATE CASCADE

    ON DELETE CASCADE,

    CONSTRAINT fk_consulta_veterinario

    FOREIGN KEY (id_veterinario)

    REFERENCES veterinarios(id_veterinario)

    ON UPDATE CASCADE

    ON DELETE RESTRICT

);



-- TABLA TRATAMIENTOS

CREATE TABLE tratamientos (

    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,

    descripcion TEXT,

    medicamento VARCHAR(100),

    dosis VARCHAR(50),

    id_consulta INT NOT NULL,



    CONSTRAINT fk_tratamiento_consulta

    FOREIGN KEY (id_consulta)

    REFERENCES consultas(id_consulta)

    ON UPDATE CASCADE

    ON DELETE CASCADE

);



-- TABLA VACUNAS

CREATE TABLE vacunas (

    id_vacuna INT AUTO_INCREMENT PRIMARY KEY,

    nombre_vacuna VARCHAR(100) NOT NULL,

    fecha_aplicacion DATE,

    proxima_dosis DATE,

    id_mascota INT NOT NULL,



    CONSTRAINT fk_vacuna_mascota

    FOREIGN KEY (id_mascota)

    REFERENCES mascotas(id_mascota)

    ON UPDATE CASCADE

    ON DELETE CASCADE

);



-- TABLA INVENTARIO

CREATE TABLE inventario (

    id_producto INT AUTO_INCREMENT PRIMARY KEY,

    nombre_producto VARCHAR(100) NOT NULL,

    stock INT DEFAULT 0,

    precio DECIMAL(10,2),

    fecha_caducidad DATE,

    id_proveedor INT NOT NULL,



    CONSTRAINT fk_inventario_proveedor

    FOREIGN KEY (id_proveedor)

    REFERENCES proveedores(id_proveedor)

    ON UPDATE CASCADE

    ON DELETE RESTRICT

);



-- TABLA VENTAS

CREATE TABLE ventas (

    id_venta INT AUTO_INCREMENT PRIMARY KEY,

    fecha_venta DATE NOT NULL,

    total DECIMAL(10,2),

    id_cliente INT NOT NULL,



    CONSTRAINT fk_venta_cliente

    FOREIGN KEY (id_cliente)

    REFERENCES clientes(id_cliente)

    ON UPDATE CASCADE

    ON DELETE RESTRICT

); 