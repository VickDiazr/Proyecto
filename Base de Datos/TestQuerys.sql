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
select * from empresa;
select * from cargo;
select * from area;
select * from responsable;


select programa_id, avance from estudiante where persona_id = 1000808481;
select nombre, sede from facultad where id = (select facultad from departamento where id = 1);
select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234';

select * from proyecto.estudiante where Persona_id = (select Persona from proyecto.usuario where Nombre = 'Nico' and Contrasena = '1234');
select * from proyecto.docente where `Persona_id` = (select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234');

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
flush privileges