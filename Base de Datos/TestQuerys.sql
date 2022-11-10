SELECT * FROM proyecto.tipo_id;
select * From proyecto.persona;
select * from proyecto.usuario;
select * from proyecto.docente;
select * from proyecto.jornada;
select * from proyecto.programa;
select * from proyecto.sede;
select * from proyecto.facultad;
select * from proyecto.estado;
select * from proyecto.estudiante;
select * from departamento;
select * from docente;
select * from empresa;
select * from cargo;
select * from area;
select * from responsable;


select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234';

select * from proyecto.estudiante where Persona_id = (select Persona from proyecto.usuario where Nombre = 'Nico' and Contrasena = '1234');
select * from proyecto.docente where `Persona_id` = (select `Persona` from proyecto.usuario where `Nombre` = 'Nico' and `Contrasena` = '1234');