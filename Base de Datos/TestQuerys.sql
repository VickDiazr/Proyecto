select * from docente;
select * from jornada;
SELECT * FROM tipo_id;
select * From persona;
select * from estudiante;
select * from usuario;
select * from programa;
select * from sede;
select * from facultad;
select * from departamento;
select * from proyecto.estado;
select * from docente_comite;
select * from persona;
select * from empresa;
select * from cargo;
select * from area;
select * from responsable;
select * from comite_asesor;
select * from actividad;
select * from pasantia;
select * from objetivo_especifico;
select * from evaluacion;
select id from docente;
select * from docente_comite where docente = (select ID from docente where Persona_id = (select Persona from usuario where Nombre = 'rodrigrau'and Contrasena ='1234'));
select nombre from empresa where id = (select empresa from responsable where id = '1');
select MAX(id) from pasantia;
insert into programa values (datediff('2023-05-19','2022-11-30')/7);

select id from responsable where empresa = (select id from empresa where nombre = 'Empresa1');

select nombre from programa where id = (select programa_id from comite_asesor where persona_id = '1020355481');
delete from persona where id = 1051238523;

select persona.nombre, persona.apellido, persona.id from persona left join usuario on persona.id = usuario.persona where usuario.persona is null;
select persona_id from estudiante where persona_id = '1000808411';
select persona_id from estudiante where persona_id = (select persona.id from persona left join usuario on persona.id = usuario.persona where usuario.persona is null);
select persona_id from docente where persona_id = (select persona.id from persona left join usuario on persona.id = usuario.persona where usuario.persona is null);
select persona_id from responsable where persona_id = (select persona.id from persona left join usuario on persona.id = usuario.persona where usuario.persona is null);



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