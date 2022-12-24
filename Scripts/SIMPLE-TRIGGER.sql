-- primer trigger aplicando before y auditoría

use simple;
select * from persona;

drop table if exists new_persona;
create table if not exists new_persona (
id_log int auto_increment primary key,
id_dni_persona int, 
nombre varchar(30),
apellido varchar(30),
telefono int,
email varchar(30),
campoNuevo_campoAnterior varchar(150),
nombreAccion varchar(50),
nombre_tabla varchar(50),
usuario varchar(50),
fecha timestamp
);

drop trigger if exists trigger_persona;
delimiter //
create trigger trigger_persona 
before update on simple.persona 
for each row 
begin
insert into new_persona (id_dni_persona, nombre, apellido, telefono, email, campoNuevo_campoAnterior, nombreAccion, nombre_tabla, usuario, fecha)
values (new.id_dni_persona, new.nombre, new.apellido, new.telefono, new.email, concat(old.nombre, '-', new.nombre), 'update', 'persona', session_user(), current_timestamp());
end // delimiter ;

update persona set EMAIL = 'antonellaperez@gmail.com' where ID_DNI_PERSONA = 554152;

SELECT * FROM new_persona;

-- segundo trigger aplicando before y auditoría

use simple;
select * from cuenta;

drop table if exists new_cuenta;
create table if not exists new_cuenta (
id_log int auto_increment primary key,
id_cuenta_simple int,
usuario varchar(30),
contraseña varchar(30),
cuenta_fecha date,
id_comprador int,
id_vendedor int,
campoNuevo_campoAnterior varchar(150),
nombreAccion varchar(50),
nombre_tabla varchar(50),
user varchar(50),
fecha timestamp
);

drop trigger if exists trigger_cuenta;
delimiter //
create trigger trigger_cuenta 
after update on simple.cuenta 
for each row 
begin
insert into new_cuenta (id_cuenta_simple, usuario, contraseña, cuenta_fecha, id_comprador, id_vendedor, campoNuevo_campoAnterior, nombreAccion, nombre_tabla, user, fecha)
values (new.id_cuenta_simple, new.usuario, new.contraseña, new.cuenta_fecha, new.id_comprador, new.id_vendedor, concat(old.usuario, ' - ', new.usuario, ' / ', old.contraseña, ' - ', new.contraseña ), 'update', 'cuenta', session_user(), current_timestamp());
end // delimiter ;

update cuenta set usuario = 'misalinas', contraseña = 'nuevacontraseña' where id_cuenta_simple = 1;

SELECT * FROM new_cuenta;

-- tercer trigger aplicando after

drop trigger if exists trigger_cuenta_after;
delimiter //
create trigger trigger_cuenta_after
after insert on simple.cuenta 
for each row 
begin
insert into new_cuenta (id_cuenta_simple, usuario, contraseña, cuenta_fecha, id_comprador, id_vendedor, campoNuevo_campoAnterior, nombreAccion, nombre_tabla, user, fecha)
values (new.id_cuenta_simple, new.usuario, new.contraseña, new.cuenta_fecha, new.id_comprador, new.id_vendedor, concat(new.usuario,'-', new.contraseña), 'insert', 'cuenta', session_user(), current_timestamp());
end // delimiter ;

insert into cuenta (usuario, contraseña, cuenta_fecha, id_dni_persona) 
VALUES ('Pepe', 'Mujica', 02/11/2022, 554152);

SELECT * FROM persona;
SELECT * FROM cuenta;
SELECT * FROM new_cuenta;

-- cuarto trigger aplicando after

drop trigger if exists trigger_persona_after;
delimiter //
create trigger trigger_persona_after
after insert on simple.persona 
for each row 
begin
insert into new_persona (id_dni_persona, nombre, apellido, telefono, email, campoNuevo_campoAnterior, nombreAccion, nombre_tabla, usuario, fecha)
values (new.id_dni_persona, new.nombre, new.apellido, new.telefono, new.email, concat(new.nombre, '-', new.apellido), 'insert', 'persona', session_user(), current_timestamp());
end // delimiter ;

insert into persona (id_dni_persona, nombre, apellido, telefono, email) 
VALUES (415611, 'roberto', 'gomez', 1231211, 'rgomez@gmail.com');

SELECT * FROM persona;
SELECT * FROM new_persona;
