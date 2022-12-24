-- Script para ordenar el campo de una tabla
drop procedure if exists sp_facturas;
delimiter // 
create procedure sp_facturas (inout campo varchar(20), inout orden varchar(20))
begin
set @t1 = concat('select * from factura order by', ' ', campo, ' ', orden);
prepare param_stmt from @t1;
execute param_stmt;
deallocate prepare param_stmt;
end // delimiter ; 
-- Query para insertar el campo y el orden 
set @campo = 'PRECIO_SIN_IVA';
set @orden = 'DESC';
call sp_facturas(@campo, @orden);



-- Script para insertar usuarios a tabla persona con variables
drop procedure if exists sp_insertar_usuarios;
delimiter // 
create procedure sp_insertar_usuarios (in p_dni int, in p_nombre varchar (30), in p_apellido varchar (30), in p_telefono int, in p_email varchar (30))
begin
	insert into persona (`ID_DNI_PERSONA`, `NOMBRE`, `APELLIDO`, `TELEFONO`, `EMAIL`) 
    values (p_dni, p_nombre, p_apellido, p_telefono, p_email);
end // delimiter ; 
-- Query para inserta usuario
call sp_insertar_usuarios(1135111, 'Edith', 'Pizarro', 9845, 'epizarro@gmail.com') ;
-- Query para revisar si se inserto el dato a la tabla
select * from persona;
select @p_dni, @p_nombre, @p_apellido, @p_telefono, @p_email



