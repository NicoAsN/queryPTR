-- Creacion de la base de datos
CREATE DATABASE DB_PTR;

USE DB_PTR;

-- Creacion de la tabla comuna
CREATE TABLE COMUNA (
	id_comuna int primary key identity(1,1),
	nom_comuna varchar(100)
);

-- Creacion de la tabla ciudad
CREATE TABLE CIUDAD (
	id_ciudad int primary key identity(1,1),
	nom_ciudad varchar(100)
);

-- Creacion de la tabla UBICACION
CREATE TABLE UBICACION (
	id_ubicacion int primary key identity(1,1),
	nom_pais varchar(100),
	codigo_postal varchar (30),
	id_comuna int foreign key references COMUNA(id_comuna),
	id_ciudad int foreign key references CIUDAD(id_ciudad)
);

-- Creacion de tabla tipo de usuario
CREATE TABLE TIPO_USUARIO (
	id_tipo_usuario int primary key identity (1,1),
	nom_tipo_usuario varchar (200)
);

-- Creacion de la tabla usuario
CREATE TABLE USUARIO (
	id_usuario int primary key identity(1,1),
	primer_nom varchar(20),
	segundo_nom varchar(20),
	primer_ape varchar(20),
	segundo_ape varchar(20),
	telefono int,
	rut int,
	DV varchar(1),
	correo varchar(30),
	contrasenia varchar(200),
	id_tipo_usuario int foreign key references TIPO_USUARIO(id_tipo_usuario)
);

-- Creacion tabla mantencion
CREATE TABLE MANTENCION (
	id_mantencion int primary key identity(1,1),
	fecha_inicio date,
	fecha_termino date,
	descripcion_mantencion varchar(200)
);

-- Creacion tabla estado_depto
CREATE TABLE ESTADO_DEPTO (
	id_estado int primary key identity(1,1),
	nom_estado varchar(20),
	descripcion_depto varchar(200),
	id_mantencion int foreign key references MANTENCION(id_mantencion)
);

--Creacion tabla inventario
CREATE TABLE INVENTARIO (
	id_inventario int primary key identity(1,1),
	descripcion_inventario varchar(200)
);

-- Creacion tabla departamento
CREATE TABLE DEPARTAMENTO (
	id_depto int primary key identity(1,1),
	direccion varchar (200),
	num_piso int,
	capacidad int,
	cant_habitaciones int,
	cant_baños int,
	precio_depto int,
	id_ubicacion int foreign key references UBICACION(id_ubicacion),
	id_estado int foreign key references ESTADO_DEPTO(id_estado),
	id_inventario int foreign key references INVENTARIO(id_inventario)
);

--Creacion tabla vehiculo
CREATE TABLE VEHICULO (
	id_vehiculo int primary key identity (1,1),
	patente varchar (10),
	marca varchar (20),
	modelo varchar (20),
	capacidad int,
	año int
);

-- Creacion de la tabla transporte
CREATE TABLE TRANSPORTE (
	id_transporte int primary key identity (1,1),
	precio_transporte int,
	id_vehiculo int foreign key references VEHICULO(id_vehiculo)
);

-- Creacion de la tabla tour
CREATE TABLE TOUR (
	id_tour int primary key identity (1,1),
	descripcion_tour varchar (200),
	precio_tour int
);

-- Creacion de la tabla servicios_extras
CREATE TABLE SERVICIOS_EXTRAS (
	id_serv_extra int primary key identity (1,1),
	descripcion_serv_extra varchar(200),
	precio_serv_extra int,
	id_transporte int foreign key references TRANSPORTE (id_transporte),
	id_tour int foreign key references TOUR(id_tour)
);

-- Creacion de la tabla metodo de pago
CREATE TABLE METODO_PAGO (
	id_metodo_pago int primary key identity (1,1),
	tipo_tarjeta varchar(20),
	num_tarjeta int,
	caducidad date,
	codigo_cvv int
);

-- Creacion de la tabla reportes
CREATE TABLE REPORTES (
	id_reporte int primary key identity (1,1),
	fecha_desde date,
	fecha_hasta date,
	descripcion_reporte varchar (200)
);

-- Creacion de la tala reserva
CREATE TABLE RESERVA (
	id_reserva int primary key identity (1,1),
	fecha_inicio date,
	fecha_termino date,
	precio_total int,
	id_usuario int foreign key references USUARIO(id_usuario),
	id_depto int foreign key references DEPARTAMENTO(id_depto),
	id_serv_extra int foreign key references SERVICIOS_EXTRAS(id_serv_extra),
	id_metodo_pago int foreign key references METODO_PAGO(id_metodo_pago),

);