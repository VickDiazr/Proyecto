select * from proyecto.docente;
select * from proyecto.jornada;
SELECT * FROM proyecto.tipo_id;
select * From proyecto.persona;
select * from proyecto.estudiante;
select * from proyecto.usuario;
select * from proyecto.programa;
select * from proyecto.sede;
select * from proyecto.facultad;
select * from departamento;
select * from proyecto.estado;
select * from docente;
select * from persona;
select * from empresa;
select * from cargo;
select * from area;
select * from responsable;

select * from empresa where id = (select empresa from responsable where persona_id = '1000808483');
select nombre from area where id = (select area from responsable where persona_id = '1000808483');
select nombre from cargo where id = (select cargo from responsable where persona_id = '1000808483');
select nombre from sede;
select nombre from facultad;
select nombre from departamento;
select nombre from tipo_id;
select nombre from programa;

select * from area where nombre = 'Compras';
select * from cargo where nombre = 'Gerente';
select * from empresa where NIT = '890.900.608-6';
select * from persona where ID = '1000900870';

update empresa set correo = 'empresa10@empresa.com', telefono = '3053109094' where id = '1';

select * from area where nombre = 'Compras';
select programa_id, avance from estudiante where persona_id = 1000808481;
select nombre, sede from facultad where id = (select facultad from departamento where id = 1);
select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234';

select * from proyecto.estudiante where Persona_id = (select Persona from proyecto.usuario where Nombre = 'Nico' and Contrasena = '1234');
select * from proyecto.docente where `Persona_id` = (select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234');

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
flush privileges