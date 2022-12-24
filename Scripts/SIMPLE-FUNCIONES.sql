use simple;

drop function if exists fn_telefono;
delimiter //
create function fn_telefono (p_dni int)
returns int
deterministic
begin
declare telefonoPersona int;
select telefono into telefonoPersona from persona where id_dni_persona = p_dni;
return telefonoPersona;
end // delimiter ;

select fn_telefono (11111111);

drop function if exists fn_numero_cuenta;
delimiter //
CREATE FUNCTION fn_numero_cuenta (p_numero_cuenta int) 
RETURNS int
DETERMINISTIC
begin  
declare numeroDeCuenta int;
	SELECT NUMERO_CUENTA into numeroDeCuenta
	FROM BANCO JOIN CUENTA 
	ON BANCO.ID_CUENTA_SIMPLE = CUENTA.ID_CUENTA_SIMPLE 
	WHERE CUENTA.ID_CUENTA_SIMPLE = p_numero_cuenta ;
return numeroDeCuenta;
end // delimiter ;

select fn_numero_cuenta (1);