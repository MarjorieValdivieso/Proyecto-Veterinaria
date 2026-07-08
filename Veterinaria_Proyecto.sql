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

-- Insertar datos 
-- CLIENTES (30 registros)

INSERT INTO clientes (cedula, nombres, apellidos, telefono, correo, direccion) VALUES
('1700000001','Diego','Pérez Aguilar','0943321819','diego.pérez1@gmail.com','Av. América N14-13, Quito'),
('1700000002','Gabriela','Torres Ramírez','0989083863','gabriela.torres2@gmail.com','Calle Rumipamba N85-45, Quito'),
('1700000003','Carlos','Vega Cortez','0926542351','carlos.vega3@gmail.com','Av. 6 de Diciembre N58-22, Quito'),
('1700000004','Diana','Toapanta Morales','0994078161','diana.toapanta4@gmail.com','Av. Naciones Unidas N47-90, Quito'),
('1700000005','Alexis','Yépez Toapanta','0959310341','alexis.yépez5@gmail.com','Av. Eloy Alfaro N22-58, Quito'),
('1700000006','Johana','Herrera Guerrero','0952553419','johana.herrera6@gmail.com','Av. República N78-41, Quito'),
('1700000007','Miguel','Herrera Castillo','0948350305','miguel.herrera7@gmail.com','Av. América N44-18, Quito'),
('1700000008','Fernanda','Pazmiño Cevallos','0953767242','fernanda.pazmiño8@gmail.com','Av. Eloy Alfaro N81-78, Quito'),
('1700000009','Pablo','Aguilar Cevallos','0969653287','pablo.aguilar9@gmail.com','Av. 6 de Diciembre N16-24, Quito'),
('1700000010','Verónica','Guerrero Sánchez','0969166978','verónica.guerrero10@gmail.com','Av. Colón N80-11, Quito'),
('1700000011','Diego','Mendoza Yépez','0984514627','diego.mendoza11@gmail.com','Av. Amazonas N43-74, Quito'),
('1700000012','Paola','Ortiz Pazmiño','0914893252','paola.ortiz12@gmail.com','Av. Naciones Unidas N77-10, Quito'),
('1700000013','Alexis','Chávez Jiménez','0901543039','alexis.chávez13@gmail.com','Av. 6 de Diciembre N20-72, Quito'),
('1700000014','Gabriela','Vega Paredes','0922782489','gabriela.vega14@gmail.com','Av. América N37-79, Quito'),
('1700000015','Fernando','Rojas Vargas','0965787133','fernando.rojas15@gmail.com','Av. 6 de Diciembre N53-12, Quito'),
('1700000016','Estefanía','Paredes Ramírez','0993010310','estefanía.paredes16@gmail.com','Av. Occidental N19-75, Quito'),
('1700000017','Roberto','Flores Mendoza','0973829973','roberto.flores17@gmail.com','Calle Rumipamba N62-34, Quito'),
('1700000018','Andrea','López Mendoza','0965667010','andrea.lópez18@gmail.com','Av. América N53-23, Quito'),
('1700000019','Roberto','Torres Torres','0987262473','roberto.torres19@gmail.com','Av. 6 de Diciembre N66-80, Quito'),
('1700000020','Andrea','García Guerrero','0980132677','andrea.garcía20@gmail.com','Av. Eloy Alfaro N61-17, Quito'),
('1700000021','Miguel','Castillo Pérez','0964746872','miguel.castillo21@gmail.com','Av. Eloy Alfaro N47-37, Quito'),
('1700000022','Ana','Cevallos Aguilar','0980500978','ana.cevallos22@gmail.com','Av. Naciones Unidas N30-17, Quito'),
('1700000023','Rafael','Rodríguez Toapanta','0921913619','rafael.rodríguez23@gmail.com','Av. Eloy Alfaro N84-86, Quito'),
('1700000024','Ana','Salazar Rodríguez','0969985435','ana.salazar24@gmail.com','Av. Eloy Alfaro N43-60, Quito'),
('1700000025','Javier','Mendoza Guerrero','0947510799','javier.mendoza25@gmail.com','Av. 6 de Diciembre N19-78, Quito'),
('1700000026','Fernanda','Ortiz Flores','0925135427','fernanda.ortiz26@gmail.com','Av. Naciones Unidas N48-88, Quito'),
('1700000027','Rafael','Pérez Mendoza','0984124118','rafael.pérez27@gmail.com','Av. República N44-46, Quito'),
('1700000028','Nicole','Torres Rojas','0953487401','nicole.torres28@gmail.com','Av. América N45-15, Quito'),
('1700000029','Carlos','Chávez Vega','0924278680','carlos.chávez29@gmail.com','Av. 6 de Diciembre N19-98, Quito'),
('1700000030','Verónica','Paredes García','0959826204','verónica.paredes30@gmail.com','Av. Occidental N15-55, Quito');

-- VETERINARIOS (10 registros)
INSERT INTO veterinarios (nombres, apellidos, especialidad, telefono) VALUES
('Esteban','Mendoza Ramírez','Medicina General','0915869232'),
('Iván','Yépez Suárez','Cirugía','0902563421'),
('Verónica','Toapanta García','Dermatología','0973375433'),
('Luis','Mendoza Torres','Cardiología','0965414586'),
('Valentina','Chávez Pérez','Odontología Veterinaria','0914294019'),
('Cristina','Morales Aguilar','Nutrición Animal','0956981693'),
('Rafael','García Rojas','Oftalmología','0960883561'),
('Ana','Salazar Chávez','Traumatología','0914846564'),
('Priscila','Martínez Torres','Medicina Interna','0966299468'),
('Carlos','Vargas Vargas','Anestesiología','0936995777');

-- PROVEEDORES (10 registros)

INSERT INTO proveedores (nombre_empresa, telefono, correo, direccion) VALUES
('ProVet Ecuador S.A.','0938721489','contacto1@provet.com','Av. Occidental N21-40, Quito'),
('NutriPet Cía. Ltda.','0943320037','contacto2@nutripet.com','Calle Foch N19-68, Quito'),
('Farmavet del Ecuador','0969367632','contacto3@farmavet.com','Av. Amazonas N23-64, Quito'),
('DogFood Import','0932870831','contacto4@dogfood.com','Calle Rumipamba N27-69, Quito'),
('VetSupply Andina','0988957986','contacto5@vetsupply.com','Av. Naciones Unidas N67-30, Quito'),
('BioPet Insumos','0977434873','contacto6@biopet.com','Av. Colón N66-19, Quito'),
('AgroVet Quito','0943455812','contacto7@agrovet.com','Av. República N39-59, Quito'),
('MediPet Distribuidora','0923166587','contacto8@medipet.com','Av. América N17-36, Quito'),
('Purina Ecuador','0966909670','contacto9@purina.com','Av. Occidental N48-59, Quito'),
('Royal Canin Ecuador','0968893734','contacto10@royal.com','Av. América N72-13, Quito');

-- MASCOTAS (35 registros)
INSERT INTO mascotas (nombre, especie, raza, sexo, fecha_nacimiento, peso, id_cliente) VALUES
('Max','Conejo','Angora','Hembra','2019-11-08',29.55,30),
('Luna','Gato','Mestizo','Macho','2022-06-02',21.04,22),
('Rocky','Perro','Poodle','Hembra','2019-07-10',30.45,6),
('Nina','Perro','Chihuahua','Hembra','2021-09-02',8.04,11),
('Toby','Ave','Periquito','Hembra','2022-09-23',9.43,3),
('Bella','Conejo','Holandés','Macho','2021-12-04',8.47,3),
('Simón','Perro','Labrador','Macho','2020-03-27',29.5,20),
('Coco','Gato','Persa','Macho','2023-04-24',23.7,19),
('Zeus','Gato','Angora','Hembra','2022-02-19',6.54,20),
('Mia','Perro','Pastor Alemán','Hembra','2019-03-19',20.59,30),
('Thor','Ave','Loro','Hembra','2022-06-13',33.0,7),
('Lola','Perro','Schnauzer','Macho','2025-10-26',27.22,28),
('Bruno','Hamster','Sirio','Macho','2021-11-23',19.02,22),
('Kiara','Ave','Canario','Hembra','2018-02-21',29.86,27),
('Rex','Conejo','Holandés','Hembra','2022-01-23',22.54,27),
('Nala','Conejo','Holandés','Hembra','2019-12-23',25.9,21),
('Duque','Ave','Loro','Hembra','2023-03-20',15.7,24),
('Perla','Hamster','Ruso','Hembra','2020-10-02',29.21,3),
('Firulais','Ave','Periquito','Macho','2023-03-19',20.29,22),
('Canela','Conejo','Angora','Macho','2023-07-18',29.9,6),
('Oreo','Conejo','Holandés','Hembra','2020-11-24',12.44,29),
('Pelusa','Hamster','Ruso','Macho','2023-10-18',33.22,3),
('Chispa','Gato','Angora','Hembra','2024-03-24',26.73,23),
('Fido','Conejo','Angora','Hembra','2018-03-12',3.98,8),
('Blacky','Conejo','Holandés','Hembra','2025-06-12',20.69,16),
('Manchas','Hamster','Ruso','Hembra','2024-03-04',12.11,23),
('Rufus','Conejo','Angora','Hembra','2020-10-26',8.68,24),
('Estrella','Gato','Común Europeo','Macho','2024-01-04',33.32,23),
('Loki','Gato','Persa','Macho','2023-06-07',10.26,19),
('Sasha','Hamster','Ruso','Macho','2020-03-06',10.93,12),
('Bobby','Gato','Común Europeo','Macho','2025-12-10',19.07,9),
('Princesa','Perro','Labrador','Hembra','2025-10-27',33.09,21),
('Dante','Conejo','Holandés','Macho','2024-06-09',10.52,16),
('Sol','Conejo','Angora','Macho','2018-07-30',9.43,28),
('Peque','Conejo','Holandés','Macho','2022-06-30',17.62,19);


-- INVENTARIO (20 registros)

INSERT INTO inventario (nombre_producto, stock, precio, fecha_caducidad, id_proveedor) VALUES
('Alimento Perro Adulto 15kg',85,59.13,'2026-11-07',3),
('Alimento Gato Adulto 10kg',77,80.8,'2026-06-24',4),
('Vacuna Antirrábica',20,48.54,'2028-05-02',10),
('Vacuna Séxtuple',81,67.74,'2027-04-08',9),
('Antipulgas Spot-On',53,39.67,'2028-06-25',5),
('Desparasitante Oral',80,84.18,'2027-09-18',10),
('Shampoo Medicado',84,7.47,'2026-07-23',4),
('Suero Fisiológico',85,19.91,'2026-06-16',3),
('Antibiótico Amoxicilina',35,16.84,'2026-06-03',3),
('Antiinflamatorio Meloxicam',5,36.2,'2028-08-20',5),
('Vendas Elásticas',9,21.6,'2027-08-03',8),
('Jeringas Descartables',14,59.21,'2027-06-26',10),
('Collar Isabelino',89,68.82,'2027-02-10',7),
('Alimento Cachorro 3kg',19,47.43,'2026-11-02',5),
('Alimento Gatito 3kg',23,8.39,'2026-12-06',5),
('Suplemento Vitamínico',81,64.29,'2027-08-15',8),
('Analgésico Tramadol',20,41.17,'2027-09-15',7),
('Solución Antiséptica',39,43.79,'2028-10-08',8),
('Guantes de Látex',15,51.84,'2028-06-03',6),
('Termómetro Digital Veterinario',82,23.16,'2026-07-07',4);


-- CITAS (50 registros)
INSERT INTO citas (fecha, hora, motivo, estado, id_mascota, id_veterinario) VALUES
('2026-11-22','17:00:00','Control dermatológico','Pendiente',3,3),
('2026-04-27','16:45:00','Cirugía menor','Atendida',28,8),
('2025-04-04','15:30:00','Chequeo dental','Atendida',7,3),
('2025-12-04','14:45:00','Cirugía menor','Atendida',26,9),
('2025-02-07','15:00:00','Revisión post-operatoria','Atendida',8,7),
('2026-06-11','08:45:00','Chequeo dental','Atendida',34,6),
('2026-09-30','15:45:00','Consulta general','Atendida',9,5),
('2026-03-25','15:00:00','Consulta general','Cancelada',16,3),
('2025-11-15','16:00:00','Vómito y diarrea','Atendida',15,2),
('2026-04-18','09:15:00','Dolor abdominal','Cancelada',19,9),
('2026-12-24','12:45:00','Dolor abdominal','Cancelada',16,8),
('2026-07-19','10:45:00','Desparasitación','Cancelada',33,3),
('2025-03-13','12:45:00','Revisión post-operatoria','Cancelada',33,5),
('2025-01-03','12:30:00','Cojera','Atendida',32,3),
('2026-04-03','16:45:00','Revisión post-operatoria','Atendida',35,7),
('2026-04-12','13:15:00','Chequeo cardíaco anual','Atendida',25,4),
('2026-02-25','08:30:00','Chequeo cardíaco anual','Atendida',25,7),
('2026-11-11','10:45:00','Consulta general','Atendida',22,2),
('2026-03-27','09:45:00','Consulta general','Pendiente',27,3),
('2025-03-18','15:30:00','Revisión post-operatoria','Atendida',26,2),
('2025-12-03','16:45:00','Revisión post-operatoria','Atendida',32,9),
('2025-02-06','17:00:00','Desparasitación','Atendida',19,4),
('2025-04-03','14:00:00','Control dermatológico','Pendiente',7,8),
('2025-06-20','12:00:00','Consulta general','Atendida',4,5),
('2026-01-03','13:45:00','Control de peso','Atendida',27,10),
('2026-11-30','10:15:00','Control de peso','Atendida',25,10),
('2026-12-01','11:45:00','Cojera','Atendida',30,5),
('2026-04-16','12:00:00','Dolor abdominal','Cancelada',35,3),
('2025-03-17','15:30:00','Cojera','Atendida',28,5),
('2026-04-13','12:15:00','Chequeo dental','Pendiente',7,4),
('2026-01-26','17:30:00','Cojera','Atendida',19,1),
('2026-11-06','14:30:00','Consulta general','Atendida',4,10),
('2026-05-24','12:15:00','Cojera','Pendiente',15,4),
('2026-09-28','12:15:00','Control dermatológico','Atendida',3,5),
('2026-03-28','08:30:00','Chequeo cardíaco anual','Atendida',19,6),
('2026-03-02','10:15:00','Control de peso','Pendiente',24,9),
('2026-05-29','12:15:00','Cirugía menor','Cancelada',31,5),
('2025-12-13','09:45:00','Vacunación','Atendida',15,7),
('2026-07-25','13:00:00','Chequeo dental','Atendida',35,2),
('2026-04-11','13:30:00','Cojera','Atendida',24,2),
('2026-11-23','11:45:00','Consulta general','Atendida',21,10),
('2025-08-15','09:45:00','Chequeo cardíaco anual','Atendida',27,2),
('2025-05-24','08:00:00','Cirugía menor','Cancelada',8,2),
('2025-08-29','16:15:00','Chequeo dental','Atendida',35,7),
('2026-08-25','10:45:00','Control dermatológico','Atendida',32,10),
('2026-02-22','12:00:00','Chequeo cardíaco anual','Atendida',29,8),
('2025-08-30','13:00:00','Control dermatológico','Atendida',23,1),
('2026-02-12','12:15:00','Vacunación','Cancelada',30,2),
('2026-11-10','11:00:00','Consulta general','Pendiente',16,3),
('2026-08-02','11:00:00','Vómito y diarrea','Atendida',14,4);


-- CONSULTAS (30 registros)

INSERT INTO consultas (fecha_consulta, diagnostico, observaciones, id_mascota, id_veterinario) VALUES
('2025-12-03','Infección de oído','Paciente estable, continuar tratamiento',1,5),
('2025-05-29','Dermatitis alérgica','Se sugiere realizar exámenes complementarios',17,3),
('2025-04-23','Cistitis','Se recomienda control en 15 días',9,1),
('2026-01-02','Infección de oído','Paciente estable, continuar tratamiento',21,1),
('2025-06-28','Parásitos intestinales','Se recomienda control en 15 días',9,7),
('2026-06-23','Gastritis aguda','Buen estado general',5,8),
('2026-04-05','Infección de oído','Requiere seguimiento nutricional',33,10),
('2025-04-22','Obesidad','Se sugiere realizar exámenes complementarios',15,10),
('2025-02-14','Artrosis leve','Buen estado general',34,5),
('2026-04-15','Cistitis','Se recomienda control en 15 días',4,8),
('2026-02-16','Conjuntivitis','Buen estado general',7,8),
('2026-12-31','Estrés post-quirúrgico','Mejoría notable respecto a consulta anterior',5,2),
('2025-11-26','Bronquitis','Paciente estable, continuar tratamiento',5,3),
('2025-10-09','Bronquitis','Buen estado general',21,7),
('2026-09-04','Sarna demodécica','Requiere seguimiento nutricional',30,9),
('2026-09-12','Conjuntivitis','Se recomienda control en 15 días',8,9),
('2025-08-09','Conjuntivitis','Mejoría notable respecto a consulta anterior',15,7),
('2025-12-14','Alergia alimentaria','Mejoría notable respecto a consulta anterior',26,7),
('2025-04-08','Insuficiencia renal en etapa inicial','Mejoría notable respecto a consulta anterior',21,5),
('2026-01-19','Dermatitis alérgica','Buen estado general',31,2),
('2025-04-04','Alergia alimentaria','Se recomienda control en 15 días',6,7),
('2025-04-09','Artrosis leve','Buen estado general',24,3),
('2026-07-24','Otitis leve','Se sugiere realizar exámenes complementarios',22,2),
('2026-02-25','Insuficiencia renal en etapa inicial','Buen estado general',28,1),
('2025-10-22','Bronquitis','Requiere seguimiento nutricional',23,2),
('2026-08-15','Sarna demodécica','Paciente estable, continuar tratamiento',10,8),
('2025-08-18','Alergia alimentaria','Se recomienda control en 15 días',23,9),
('2026-01-12','Gastritis aguda','Requiere seguimiento nutricional',15,7),
('2026-07-29','Infección de oído','Se sugiere realizar exámenes complementarios',2,10),
('2026-11-05','Alergia alimentaria','Buen estado general',18,1);


-- TRATAMIENTOS (30 registros)

INSERT INTO tratamientos (descripcion, medicamento, dosis, id_consulta) VALUES
('Tratamiento asociado a la consulta #1','Tramadol','0.5 ml cada 8h por 3 días',1),
('Tratamiento asociado a la consulta #2','Prednisona','0.5 ml cada 8h por 3 días',2),
('Tratamiento asociado a la consulta #3','Enrofloxacina','1 comprimido cada 12h por 7 días',3),
('Tratamiento asociado a la consulta #4','Tramadol','5 mg/kg cada 24h por 5 días',4),
('Tratamiento asociado a la consulta #5','Metronidazol','1 comprimido cada 24h por 14 días',5),
('Tratamiento asociado a la consulta #6','Omeprazol','1 comprimido cada 12h por 7 días',6),
('Tratamiento asociado a la consulta #7','Tramadol','1 comprimido cada 24h por 14 días',7),
('Tratamiento asociado a la consulta #8','Amoxicilina','1 comprimido cada 12h por 7 días',8),
('Tratamiento asociado a la consulta #9','Cefalexina','5 mg/kg cada 24h por 5 días',9),
('Tratamiento asociado a la consulta #10','Omeprazol','1 aplicación única',10),
('Tratamiento asociado a la consulta #11','Furosemida','0.5 ml cada 8h por 3 días',11),
('Tratamiento asociado a la consulta #12','Tramadol','0.5 ml cada 8h por 3 días',12),
('Tratamiento asociado a la consulta #13','Prednisona','1 comprimido cada 24h por 14 días',13),
('Tratamiento asociado a la consulta #14','Enrofloxacina','2.5 mg/kg cada 12h por 10 días',14),
('Tratamiento asociado a la consulta #15','Metronidazol','1 comprimido cada 12h por 7 días',15),
('Tratamiento asociado a la consulta #16','Amoxicilina','5 mg/kg cada 24h por 5 días',16),
('Tratamiento asociado a la consulta #17','Tramadol','2.5 mg/kg cada 12h por 10 días',17),
('Tratamiento asociado a la consulta #18','Amoxicilina','1 comprimido cada 24h por 14 días',18),
('Tratamiento asociado a la consulta #19','Meloxicam','0.5 ml cada 8h por 3 días',19),
('Tratamiento asociado a la consulta #20','Furosemida','1 comprimido cada 24h por 14 días',20),
('Tratamiento asociado a la consulta #21','Omeprazol','1 aplicación única',21),
('Tratamiento asociado a la consulta #22','Metronidazol','1 aplicación única',22),
('Tratamiento asociado a la consulta #23','Omeprazol','0.5 ml cada 8h por 3 días',23),
('Tratamiento asociado a la consulta #24','Ivermectina','2.5 mg/kg cada 12h por 10 días',24),
('Tratamiento asociado a la consulta #25','Meloxicam','0.5 ml cada 8h por 3 días',25),
('Tratamiento asociado a la consulta #26','Omeprazol','1 comprimido cada 12h por 7 días',26),
('Tratamiento asociado a la consulta #27','Prednisona','1 comprimido cada 24h por 14 días',27),
('Tratamiento asociado a la consulta #28','Metronidazol','1 aplicación única',28),
('Tratamiento asociado a la consulta #29','Cefalexina','1 comprimido cada 24h por 14 días',29),
('Tratamiento asociado a la consulta #30','Prednisona','1 comprimido cada 12h por 7 días',30);

-- VACUNAS (20 registros)

INSERT INTO vacunas (nombre_vacuna, fecha_aplicacion, proxima_dosis, id_mascota) VALUES
('Leucemia Felina','2026-02-09','2027-02-09',4),
('Antirrábica','2025-07-29','2026-07-29',20),
('Leucemia Felina','2025-05-21','2026-05-21',17),
('Parvovirus','2025-12-02','2026-12-02',8),
('Antirrábica','2026-05-25','2027-05-25',28),
('Triple Felina','2025-05-13','2026-05-13',25),
('Leucemia Felina','2026-05-28','2027-05-28',23),
('Séxtuple','2026-02-11','2027-02-11',3),
('Bordetella','2025-01-20','2026-01-20',30),
('Séxtuple','2025-11-17','2026-11-17',28),
('Bordetella','2026-12-28','2027-12-28',27),
('Parvovirus','2025-04-28','2026-04-28',26),
('Antirrábica','2025-11-29','2026-11-29',11),
('Leptospirosis','2026-12-08','2027-12-08',24),
('Séxtuple','2026-03-24','2027-03-24',7),
('Leucemia Felina','2026-03-23','2027-03-23',26),
('Séxtuple','2026-02-10','2027-02-10',20),
('Moquillo','2025-08-15','2026-08-15',22),
('Triple Felina','2025-03-20','2026-03-20',33),
('Séxtuple','2026-06-28','2027-06-28',33);

-- VENTAS (50 registros)

INSERT INTO ventas (fecha_venta, total, id_cliente) VALUES
('2025-07-18',226.95,12),
('2025-12-26',183.21,27),
('2026-10-23',204.68,8),
('2025-04-16',40.88,7),
('2025-06-27',152.59,25),
('2026-11-03',23.46,25),
('2026-10-06',126.06,25),
('2026-08-01',191.17,15),
('2026-11-29',231.42,19),
('2026-10-21',160.65,20),
('2025-11-27',216.74,21),
('2025-11-20',41.98,3),
('2026-04-26',113.34,10),
('2025-10-09',149.9,12),
('2026-06-04',23.18,15),
('2026-04-08',14.21,12),
('2025-10-21',23.8,28),
('2025-04-03',155.68,17),
('2026-01-29',118.36,18),
('2025-02-12',115.18,26),
('2026-08-09',164.7,11),
('2026-09-12',121.53,5),
('2025-03-05',115.38,26),
('2025-12-18',245.68,3),
('2026-06-01',163.3,2),
('2025-09-11',178.37,15),
('2026-06-21',133.07,6),
('2026-01-08',96.35,10),
('2026-02-01',105.15,11),
('2026-11-27',151.48,26),
('2026-10-09',163.59,3),
('2025-12-04',28.15,22),
('2026-01-31',74.62,24),
('2026-11-04',241.28,20),
('2025-06-03',86.67,19),
('2026-11-11',39.65,12),
('2025-11-14',242.09,23),
('2026-11-10',101.03,20),
('2026-12-27',234.81,10),
('2026-07-27',97.29,26),
('2025-12-03',204.23,22),
('2026-12-21',208.09,24),
('2026-12-03',228.55,3),
('2026-10-24',169.26,17),
('2026-01-06',9.47,10),
('2025-07-04',238.04,11),
('2026-05-13',52.04,5),
('2025-06-08',23.91,28),
('2025-04-14',129.38,18),
('2026-06-24',14.25,11);


