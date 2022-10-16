USE DB_PTR;

--Creacion del procedimiento almacenado registrar usuario
CREATE PROCEDURE pa_registrar_usuario(
	@primer_nom varchar (20),
	@segundo_nom varchar (20),
	@primer_ape varchar(20),
	@segundo_ape varchar(20),
	@telefono int,
	@rut int,
	@DV varchar(1),
	@correo varchar(30),
	@contrasenia varchar(200),
	@registrado bit output,
	@mensaje varchar(100) output
)
AS
BEGIN
	IF(not exists(SELECT * FROM USUARIO WHERE correo = @correo))
	BEGIN
		INSERT INTO USUARIO(primer_nom,segundo_nom,primer_ape,segundo_ape,telefono,rut,DV,correo,contrasenia) VALUES(@primer_nom,@segundo_nom,@primer_ape,@segundo_ape,@telefono,@rut,@DV,@correo,@contrasenia)
		SET @registrado = 1
		SET @mensaje = 'Usuario Registrado'
	END
	ELSE
	BEGIN
		SET @registrado = 0
		SET @mensaje = 'Correo ya existe'
	END
END;

--Creacion procedimiento almacenado validar usuario
CREATE PROCEDURE pa_validar_usuario(
	@correo varchar(30),
	@contrasenia varchar(200)
)
AS
BEGIN
	IF(exists(SELECT * FROM USUARIO WHERE correo = @correo AND contrasenia = @contrasenia))
		SELECT id_usuario FROM USUARIO WHERE  correo = @correo AND contrasenia = @contrasenia
	ELSE
		SELECT '0'
END;

--Ejecucion procedimiento almacenado regitrar usuario
DECLARE @registrado bit, @mensaje varchar(100)

EXEC pa_registrar_usuario 'Nicolas', 'Alexander', 'Navarrete', 'Sanchez', 931972415, 19829472, '1', 'nnavarrete22.nn@outlook.com', '01f0a55c866eeb79adee1aa0b130e2a6da664a7b912a6cab70d560649a0caa7b', @registrado output, @mensaje output
SELECT @registrado
SELECT @mensaje

-- Ejecucion procedimiento almacenado validar usuario
EXEC pa_validar_usuario 'nnavarrete22@outlook.com', '7f132f3a683f37ace4d257fa91926ae8fa2ee792333712f884fcceecc67a2506'

SELECT * FROM USUARIO;

DELETE FROM USUARIO WHERE correo = 'nnavarrete22@outlook.com';