/*----- Base de datos: CAC_22025_MAXIMILIANO_GARCIA_SOLORZANO --------------*/
create database CAC_22025_MAXIMILIANO_GARCIA_SOLORZANO;

/* ------Estructura de tabla `MITABLA`------- */
use CAC_22025_MAXIMILIANO_GARCIA_SOLORZANO;
CREATE TABLE `mitabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(40) CHARACTER SET latin1 NOT NULL,
  `edad` tinyint(2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `provincia` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*----para ver la "ESTRUCTURA" de mi tabla----*/
describe `mitabla`;

/*------Modificar Estructura de MITABLA, en este caso eliminar provincia---------*/
ALTER TABLE `mitabla` 
DROP COLUMN `provincia`;
describe `mitabla`;

/*------Modificar Estructura de MITABLA, en este caso AGREGAR provincia---------*/
ALTER TABLE `mitabla` 
ADD COLUMN `provincia` varchar(10000) CHARACTER SET latin1 NOT NULL;
describe `mitabla`;

/*------Modificar Estructura de MITABLA, en este caso modifico el varchar de provincia---------*/
ALTER TABLE `mitabla` 
MODIFY `provincia` varchar(30);
describe `mitabla`;

/* ------2) Ingresar 5 registros en la tabla---------------------------- */
/**---------no especifico el id, poreque el mismo es autoincremental-----*/
INSERT INTO `mitabla` (
`nombre`, `apellido`, `edad`, `fecha` ,`provincia`) VALUES 
( 'Maximiliano', 'Garcia Solorzano', '45', '2022-06-01 23:11:11','Buenos Aires'),
( 'Matias', 'Gonzalez', '48', '2022-06-01 23:11:11','Buenos Aires'),
( 'Esteban', 'Fernandez', '22','2022-06-02 23:11:12','Corrientes'),
( 'Jimena', 'Aguirre', '33', '2022-06-03 23:11:13','Tucuman'),
( 'Rosalia', 'Figueroa', '28','2022-06-04 23:11:14','Cordoba');

/*------Ver todos los "DATOS" de MITABLA-----------------------------------------*/
select * from MITABLA;

/*------Ver algunos "DATOS" de MITABLA-----------------------------------------*/
select id, nombre, apellido from MITABLA;

/*------Filtrar "DATOS" de MITABLA-----------------------------------------*/
select * from MITABLA where nombre like 'Maximiliano';
select * from MITABLA where provincia like 'Buenos Aires';

/*------Modificar "DATOS" de MITABLA-----------------------------------------*/
update MITABLA set provincia='Tucuman' where id=1;
select * from MITABLA;

/*---Finalizamos la transaccion SQL para aceptar los cambios realizados en la Base de Datos----*/
COMMIT;

/* -------------------------------------------------------------------------------------------------------------
Por defecto, MySQL trae activado el modo autocommit, es decir, realizada una transacción (por ejemplo un INSERT, 
UPDATE o DELETE) el mismo es confirmado apenas es ejecutado. Para desactivar el autocommit, se puede desactivar 
el autocomit ejecutando el comando:
SET AUTOCOMMIT=0;
Una vez deshabilitado el autocommit, tendremos que utilizar obligatoriamente el COMMIT para confirmar o ROLLBACK 
para deshacer la transacción.
Si se quiere deshabilitar el autocommit para una serie de comandos, lo ideal es utilizar START   TRANSACTION 
(sin necesidad de setear el AUTOCOMMIT en 0).
-------------------------------------------------------------------------------------------------------------*/

