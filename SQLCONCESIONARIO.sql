CREATE DATABASE INVERAUTO

USE INVERAUTO

CREATE TABLE CONCESIONARIO(
ID INT IDENTITY (1,1)NOT NULL,
NIT VARCHAR (15) NOT NULL PRIMARY KEY,
IDENTIFICACION VARCHAR (15) NOT NULL,
EMPLEADO VARCHAR (20),
FECHA DATE DEFAULT GETDATE(),
SEDE VARCHAR (30),
FORMA_PAGO VARCHAR (20),
MODELO_VEHICULO INT,
COSTO FLOAT,
VALOR_VEHICULO FLOAT,
IVA AS (0.19*VALOR_VEHICULO),
NETO_PAGAR AS (0.19*VALOR_VEHICULO)+VALOR_VEHICULO
)



SELECT * FROM CONCESIONARIO
--INSERTAMOS LOS DATOS 
INSERT INTO CONCESIONARIO(NIT,IDENTIFICACION,EMPLEADO,SEDE,FORMA_PAGO,MODELO_VEHICULO,COSTO,VALOR_VEHICULO)
VALUES('90049831','53637377','EFRAIN','SUR','CREDITO',2018,23000000,34000000),
('90000937','53637373','JAIRO','NORTE','CONTADO',2019,23000000,34000000),
('90012344','4037366','DANILO','ESTE','CONTADO',2018,33000000,54000000),
('90675643','32637373','JOSE','SUR','CREDITO',2021,21000000,31000000),
('90001202','24455578','PEDRO','OESTE','CONTADO',2022,55000000,94000000),
('90098736','57884999','PABLO','SUR','CONTADO',2018,28000000,37000000),
('900A4553','53475750','HUGO','SUR','CREDITO',2018,66000000,104000000),
('90000341','12233844','RODRIGO','NORTE','CONTADO',2021,44000000,73000000),
('90011119','27494746','JAVIER','NORTE','CONTADO',2022,31000000,52000000),
('90033227','12827373','HERNAN','ESTE','CREDITO',2022,18000000,25000000),
('90099873','26473633','ANDRES','NORTE','CREDITO',2023,22000000,38000000),
('90076453','70373535','SAUL','SUR','CONTADO',2023,40000000,55000000),
('90085666','65848484','HECTOR','OESTE','CREDITO',2019,42000000,56000000),
('90123776','40009388','TEOVALDO','OESTE','CONTADO',2022,37000000,45000000),
('90293364','70853424','IVAN','SUR','CREDITO',2023,65000000,88000000)
--CONSULTAS
--EMPLEADOS CON VENTAS ENTRE 30000000 Y 100000000
SELECT IDENTIFICACION, EMPLEADO, NETO_PAGAR FROM CONCESIONARIO WHERE NETO_PAGAR BETWEEN 30000000 AND 100000000
--VENTAS POR MODELO DE VEHICULO 
SELECT NETO_PAGAR, MODELO_VEHICULO FROM CONCESIONARIO WHERE MODELO_VEHICULO = 2018
SELECT NETO_PAGAR, MODELO_VEHICULO FROM CONCESIONARIO  WHERE MODELO_VEHICULO BETWEEN 2019 AND 2023 ORDER BY MODELO_VEHICULO
--VENTAS POR SEDE
SELECT  SEDE,NETO_PAGAR FROM CONCESIONARIO ORDER BY SEDE
--EMPLEADOS QUE EMPIECEN POR ? Y VALOR VENTA >
SELECT EMPLEADO, NETO_PAGAR FROM CONCESIONARIO  WHERE EMPLEADO LIKE 'H%' AND NETO_PAGAR > 50000000 ORDER BY NETO_PAGAR
--CINCO PRIMEROS REGISTROS
SELECT  TOP 5  * FROM CONCESIONARIO ORDER BY ID
--EXCLUYA LOS  2 PRIMERO REGISTROS
SELECT * FROM CONCESIONARIO ORDER BY ID OFFSET 2 ROW
--FORMA DE PAGO
SELECT * FROM CONCESIONARIO WHERE FORMA_PAGO = 'CREDITO' ORDER BY ID ASC
SELECT * FROM CONCESIONARIO WHERE FORMA_PAGO = 'CONTADO' ORDER BY ID ASC
--IDENTIFICACIONES QUE EMPIECEN POR
SELECT * FROM CONCESIONARIO WHERE IDENTIFICACION LIKE('2%') ORDER BY ID ASC
--EMPLEADOS QUE CONTENGAN 
SELECT * FROM CONCESIONARIO WHERE EMPLEADO  IN ('JAIRO','HECTOR') 
--CONSULTAS ACTUALIZACION
--ACTUALIZA EL VALOR DE COSTO UN 10% PARA LOS VEHICULOS CUYO MODELO SON 2022 O 2023: PARA LOS INFERIORES DISMINUYELES UN 5%
SELECT MODELO_VEHICULO,COSTO FROM CONCESIONARIO  WHERE MODELO_VEHICULO = 2022 OR MODELO_VEHICULO=2023
UPDATE CONCESIONARIO SET  COSTO   = COSTO*1.10 WHERE MODELO_VEHICULO = 2022 OR MODELO_VEHICULO=2023
SELECT MODELO_VEHICULO,COSTO FROM CONCESIONARIO  WHERE MODELO_VEHICULO = 2022 OR MODELO_VEHICULO=2023

SELECT MODELO_VEHICULO,COSTO FROM CONCESIONARIO  WHERE MODELO_VEHICULO < 2022
UPDATE CONCESIONARIO SET  COSTO   = COSTO*0.95 WHERE MODELO_VEHICULO < 2022 
SELECT MODELO_VEHICULO,COSTO FROM CONCESIONARIO  WHERE MODELO_VEHICULO < 2022

--ACTUALIZA NOMBRES DE VENDEDORES
SELECT EMPLEADO FROM CONCESIONARIO WHERE EMPLEADO LIKE '%O'
UPDATE CONCESIONARIO SET EMPLEADO = EMPLEADO + 'JUNIOR' WHERE EMPLEADO LIKE '%O'
SELECT EMPLEADO FROM CONCESIONARIO WHERE EMPLEADO LIKE '%JUNIOR%'

SELECT EMPLEADO FROM CONCESIONARIO WHERE FORMA_PAGO LIKE 'CREDITO'
UPDATE CONCESIONARIO SET EMPLEADO = EMPLEADO + 'FIA' WHERE FORMA_PAGO LIKE 'CREDITO'
SELECT EMPLEADO FROM CONCESIONARIO WHERE FORMA_PAGO LIKE 'CREDITO'





 