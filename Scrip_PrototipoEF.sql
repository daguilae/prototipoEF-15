CREATE DATABASE prototipoEF;
USE prototipoEF;

-- Mantenimiento de mi area 
create table Documento_bancario(
	codigo_Documento varchar(10) primary key,
    nombre_Documento varchar(50),
    afecta char(1),  -- + o - a la cuenta
    estatus_documento char(1)

) engine = InnoDB default char set=latin1;




Create table usuario(
Id_Usuario int primary key ,
NombreUsuario varchar (30) not null,
Pass varchar(12) not null

)Engine = InnoDB default char set=latin1;

-- drop table Bitacora;
Create table Bitacora(
Id_Bitacora int primary key auto_increment,
Id_Usuario varchar(80),
Concepto varchar (60),

Fecha date

)Engine = InnoDB default char set =latin1;

--- TRIGGER QUE PERMITE AGREGAR A LA BITACORA EL MOVIENTO QUE SE REALIZO 

CREATE TRIGGER AgregarBitacora AFTER INSERT 
ON Documento_bancario FOR EACH ROW INSERT INTO Bitacora(Id_Bitacora, Id_Usuario, Concepto,Fecha) 
VALUES (Id_Bitacora,current_user(), "Ingreso de Documento", NOW());

--- Vista que permite realizar una consulta de la tabal Documentos

-- DROP VIEW Vista_Bitacora;

CREATE VIEW Vista_Bitacora AS Select Bitacora.Id_Bitacora AS 'Codigo' , Bitacora.Id_Usuario AS 'USUARIO',
Bitacora.Concepto AS 'CONCEPTO' , Bitacora.Fecha AS 'Fecha' FROM Bitacora;
SELECT * FROM Bitacora;


-- Vista que permite realizar una consulta a la tabla bitacora 
-- DROP VIEW Vista_DocumentoBancario;
CREATE VIEW Vista_DocumentoBancario AS Select Documento_bancario.codigo_Documento AS 'ID' , Documento_bancario.nombre_Documento AS 'NOMBRE',
Documento_bancario.afecta AS 'AFECTA' , Documento_bancario.estatus_documento AS 'ESTATUS' FROM Documento_bancario;
SELECT * FROM Documento_bancario;

