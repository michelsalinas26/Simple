-- creación de usuarios 
create user if not exists 'userUno'@'localhost' identified by 'contraseñaUno';
create user if not exists 'userDos'@'localhost' identified by 'contraseñaDos';

-- Permiso de lectura sobre todas las tablas de schema Simple
grant select on simple.* to 'userUno'@'localhost';

-- Permiso de lectura, insección y modificación sobre todas las tablas de schema Simple
grant select, insert, update on simple.* to 'userUno'@'localhost';