/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   constraint PK_CARGO primary key clustered (ID)
);

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   constraint PK_AREA primary key clustered (ID)
);

/*==============================================================*/
/* Table: TIPO_ID                                               */
/*==============================================================*/
create table TIPO_ID 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   constraint PK_TIPO_ID primary key clustered (ID)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA 
(
   ID                   int                            not null,
   TIPO_ID              int                            not null,
   LUGAR_EXP_ID         varchar(100)                   not null,
   NOMBRE               varchar(100)                   not null,
   APELLIDO             varchar(100)                   not null,
   CORREO               varchar(100)                   not null UNIQUE,
   TELEFONO             varchar(100)                   not null,
   FIRMA                smallint                       null,
   constraint PK_PERSONA primary key clustered (ID)
);

alter table PERSONA
   add constraint FK_PERSONA_REFERENCE_TIPO_ID foreign key (TIPO_ID)
      references TIPO_ID (ID)
      on update cascade
      on delete cascade;
      
/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NIT					varchar(100)				   not null UNIQUE,
   NOMBRE               varchar(100)                   not null,
   CORREO               varchar(100)                   null,
   TELEFONO             varchar(100)                   null,
   CIUDAD               varchar(100)                   null,
   constraint PK_EMPRESA primary key clustered (ID)
);

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/
create table RESPONSABLE 
(
   ID                   int                            not null AUTO_INCREMENT,
   PERSONA_ID           int                            not null,
   EMPRESA              int                            not null,
   CARGO                int                            null,
   AREA                 int                            null,
   constraint PK_RESPONSABLE primary key clustered (ID)
);

alter table RESPONSABLE
   add constraint FK_RESPONSA_REFERENCE_CARGO foreign key (CARGO)
      references CARGO (ID)
      on update cascade
      on delete cascade;

alter table RESPONSABLE
   add constraint FK_RESPONSA_REFERENCE_EMPRESA foreign key (EMPRESA)
      references EMPRESA (ID)
      on update cascade
      on delete cascade;

alter table RESPONSABLE
   add constraint FK_RESPONSA_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update cascade
      on delete cascade;

alter table RESPONSABLE
   add constraint FK_RESPONSA_REFERENCE_AREA foreign key (AREA)
      references AREA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   NOMBRE               varchar(100)                   not null,
   CONTRASENA           varchar(100)                   not null,
   PERSONA              int                            not null,
   constraint PK_USUARIO primary key clustered (NOMBRE)
);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PERSONA foreign key (PERSONA)
      references PERSONA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
create table JORNADA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   constraint PK_JORNADA primary key clustered (ID)
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   CIUDAD               varchar(100)                   null,
   constraint PK_SEDE primary key clustered (ID)
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   SEDE                 int                            not null,
   constraint PK_FACULTAD primary key clustered (ID)
);

alter table FACULTAD
   add constraint FK_FACULTAD_REFERENCE_SEDE foreign key (SEDE)
      references SEDE (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   FACULTAD             int 		                   not null,
   constraint PK_DEPARTAMENTO primary key clustered (ID)
);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_FACULTAD foreign key (FACULTAD)
      references FACULTAD (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   JORNADA              int                            null,
   DEPARTAMENTO         int 	   	                   not null,
   constraint PK_PROGRAMA primary key clustered (ID)
);

alter table PROGRAMA
   add constraint FK_PROGRAMA_REFERENCE_DEPARTAM foreign key (DEPARTAMENTO)
      references DEPARTAMENTO (ID)
      on update cascade
      on delete cascade;

alter table PROGRAMA
   add constraint FK_PROGRAMA_REFERENCE_JORNADA foreign key (JORNADA)
      references JORNADA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: COMITE_ASESOR                                         */
/*==============================================================*/
create table COMITE_ASESOR 
(
   ID                   int                            not null AUTO_INCREMENT,
   PERSONA_ID           int                   		   not null,
   PROGRAMA_ID          int                            not null,
   constraint PK_COMITE_ASESOR primary key clustered (ID)
);

alter table COMITE_ASESOR
   add constraint FK_COMITE_A_REFERENCE_PROGRAMA foreign key (PROGRAMA_ID)
      references PROGRAMA (ID)
      on update cascade
      on delete cascade;

alter table COMITE_ASESOR
   add constraint FK_COMITE_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null UNIQUE,
   constraint PK_ESTADO primary key clustered (ID)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   ID                   int                            not null AUTO_INCREMENT,
   PERSONA_ID           int                            not null,
   PROGRAMA_ID          int                            not null,
   AVANCE               float                          null,
   ESTADO               int                            null,
   constraint PK_ESTUDIANTE primary key clustered (ID)
);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_REFERENCE_ESTADO foreign key (ESTADO)
      references ESTADO (ID)
      on update cascade
      on delete cascade;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update cascade
      on delete cascade;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_REFERENCE_PROGRAMA foreign key (PROGRAMA_ID)
      references PROGRAMA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE 
(
   ID                   int                            not null AUTO_INCREMENT,
   PERSONA_ID           int                            not null,
   DEPARTAMENTO         int 		                   not null,
   EXTENSION            int                            null,
   constraint PK_DOCENTE primary key clustered (ID)
);

alter table DOCENTE
   add constraint FK_DOCENTE_REFERENCE_DEPARTAM foreign key (DEPARTAMENTO)
      references DEPARTAMENTO (ID)
      on update cascade
      on delete cascade;

alter table DOCENTE
   add constraint FK_DOCENTE_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: PASANTIA                                              */
/*==============================================================*/
create table PASANTIA 
(
   ID                   	int                            not null AUTO_INCREMENT,
   ESTUDIANTE           	int                            not null,
   TITULO               	varchar(100)                   null,
   OBJETIVO_GENERAL     	varchar(100)                   null,
   INTRODUCCION         	varchar(100)                   null,
   JUSTIFICACION        	varchar(100)                   null,
   APLICACION_APORTE    	varchar(100)                   null,
   CONTRATACION_INTENCION 	smallint                       null,
   DURACION             	int                            null,
   RESPONSABLE          	int                            null,
   DOCENTE_DIRECTOR     	int                            null,
   FECHA                	timestamp                      not null,
   constraint PK_PASANTIA primary key clustered (ID)
);

alter table PASANTIA
   add constraint FK_PASANTIA_REFERENCE_ESTUDIAN foreign key (ESTUDIANTE)
      references ESTUDIANTE (ID)
      on update cascade
      on delete cascade;

alter table PASANTIA
   add constraint FK_PASANTIA_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      on update cascade
      on delete cascade;

alter table PASANTIA
   add constraint FK_PASANTIA_REFERENCE_DOCENTE foreign key (DOCENTE_DIRECTOR)
      references DOCENTE (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: VERIFICACION                                          */
/*==============================================================*/
create table VERIFICACION 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   COMITE               int                            not null,
   ACTA                 int                            null,
   CONSECUTIVO          int                            null,
   FECHA                timestamp                      not null,
   RESULTADO            smallint                       not null,
   constraint PK_VERIFICACION primary key clustered (ID)
);

alter table VERIFICACION
   add constraint FK_VERIFICA_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;

alter table VERIFICACION
   add constraint FK_VERIFICA_REFERENCE_COMITE_A foreign key (COMITE)
      references COMITE_ASESOR (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   DESCRIPCION          varchar(100)                   not null,
   SEMANA_INICIO        int                            not null,
   SEMANA_FIN           int                            not null,
   constraint PK_ACTIVIDAD primary key clustered (ID)
);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: CRITERIO                                              */
/*==============================================================*/
create table CRITERIO 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   PORCENTAJE           float                          not null,
   DESCRIPCION          varchar(100)                   not null,
   constraint PK_CRITERIO primary key clustered (ID)
);

alter table CRITERIO
   add constraint FK_CRITERIO_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: OBJETIVO_ESPECIFICO                                   */
/*==============================================================*/
create table OBJETIVO_ESPECIFICO 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   DESCRIPCION          varchar(100)                   not null,
   constraint PK_OBJETIVO_ESPECIFICO primary key clustered (ID)
);

alter table OBJETIVO_ESPECIFICO
   add constraint FK_OBJETIVO_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;

/*==============================================================*/
/* Table: EVALUACION                                            */
/*==============================================================*/
create table EVALUACION 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   RESPONSABLE          int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_EVALUACION primary key clustered (ID)
);
alter table EVALUACION
   add constraint FK_EVALUACI_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      on update cascade
      on delete cascade;

alter table EVALUACION
   add constraint FK_EVALUACI_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;

INSERT INTO tipo_id (NOMBRE) VALUES
('Cédula de ciudadanía'),
('Tarjeta de identidad'),
('Cédula de extranjería');

Insert into persona (id, tipo_id, lugar_exp_id, nombre, apellido, correo, telefono, firma) values
('1000808483','1', 'Bogota', 'Ivan David', 'Molina Leguizamo', 'ivdmolinale@empresa1.com', '3053109091', '1'),
('1000808481','1', 'Bogota', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', '3053109089', '1'),
('1000808482','1', 'Bogota', 'Victor Daniel', 'Díaz Reyes', 'vidiazr@unal.edu.co', '3053109090', '1'),
(1000808491, 1, 'Bogotá', 'Karen Tatiana', 'Alvarez Baez', 'kaalvarezb@unal.edu.co', '3053119089', 1),
(1000808471, 1, 'Bogotá', 'Diana Marcela', 'Bello Lopez', 'dbellol@unal.edu.co', '3053129089', 1),
(1000808461, 1, 'Bogotá', 'Camilo Andres', 'Cardenas Vargas', 'ccardenasv@unal.edu.co', '3053139089', 1),
(1000808451, 1, 'Bogotá', 'Calina', 'Catalina Roz', 'catroz@gmail.com', '3053139986', 1),
(1000808431, 1, 'Soacha', 'Raul', 'Rodriguez', 'similar@gmail.com', '3053136985', 1),
(1000808421, 1, 'Soacha', 'Nicolas', 'Ruiz Garzon', 'nic@gmail.com', '3053116895', 1),
(1000808411, 1, 'Soacha', 'Nicolas', 'Ruiz Garzon', 'snsc25@hotmail.com', '3053116854', 1),
(1020355481, 1, 'Soacha', 'Raul', 'Rodriguez', 'rodrigrau@unal.edu.co', '3203251258', 1),
(1051238523, 1, 'Bogotá', 'Calina', 'Catalina Roa', 'catroa@unal.edu.co', '3058421851', 1),
(1003235621, 1, 'Tunja', 'Obed Felipe', 'Espinosa Angarita', 'ofespinosaa@unal.edu.co', '3058085048', 1),
(1051586412, 1, 'Bogotá', 'David Alejandro', ' Cifuentes Gonzalez', 'dcifuentesg@unal.edu.co', '3205612315', 1);

INSERT INTO usuario (NOMBRE, CONTRASENA, PERSONA) VALUES
('ivdmolinale', '1234', '1000808483'),
('ssiabatto', '1234', '1000808481'),
('vidiazr', '1234', '1000808482'),
('kaalvarezb', '1234', '1000808491'),
('dbello', '1234', '1000808471'),
('ccardenas', '1234', '1000808461'),
('catroz', '1234', '1000808451'),
('similar', '1234', '1000808431'),
('nic', '1234', '1000808421'),
('rodrigrau', '1234', '1020355481');

INSERT INTO jornada (NOMBRE) VALUES ('Diurno');

INSERT INTO sede (NOMBRE, CIUDAD) VALUES ('Sede Bogotá','Bogotá');

INSERT INTO facultad (NOMBRE, Sede) VALUES ('Ingeniería', '1');

INSERT INTO departamento (NOMBRE, FACULTAD) VALUES
('Ingeniería Civil y Agrícola', '1'),
('Ingeniería de Sistemas e Industrial', '1');

INSERT INTO programa (ID, NOMBRE, JORNADA, DEPARTAMENTO) VALUES
('24','Ingeniería Agrícola','1','1'),
('106661','Ingeniería de Sistemas y Computación','1','2');

INSERT INTO comite_asesor (persona_id, programa_id) values ('1020355481', '24');

insert into estado (NOMBRE) VALUES ('Disponible');

INSERT INTO estudiante (PERSONA_ID, PROGRAMA_ID, AVANCE, ESTADO) VALUES
('1000808481','106661','70','1'),
('1000808491','24','80','1'),
('1000808471','106661','82','1'),
('1000808461','24','92','1'),
('1000808411','24', null, '1'),
('1051238523','106661',null, '1');

INSERT INTO docente (PERSONA_ID, DEPARTAMENTO, Extension) VALUES
('1000808482','2', null),
('1000808451','2', null),
('1000808431','2', null),
('1000808421','2', null),
('1051586412','1', null);

INSERT INTO empresa (NIT, NOMBRE, CORREO, TELEFONO, CIUDAD) VALUES 
('890.900.608-9','Empresa1', 'empresa1@empresa1.com', '3053109095', 'Bogotá'),
('890.879.680-5','Empresa2', 'empresa2@empresa2.com', '3058475184', 'Bogotá');

INSERT INTO cargo (NOMBRE) VALUES
('Gerente'),
('Asesor'),
('Auxiliar'),
('Asistente'),
('Secretario');

INSERT INTO area (NOMBRE) VALUES
('Ingeniería'), 
('Contaduría'),
('Talento Humano'),
('Compras'),
('Presidencia');

INSERT INTO responsable (PERSONA_ID, EMPRESA, CARGO, AREA) VALUES 
('1000808483','1', '1', '5'),
(1003235621,'2','4','1');

INSERT INTO pasantia (ESTUDIANTE, TITULO, OBJETIVO_GENERAL, INTRODUCCION, JUSTIFICACION, APLICACION_APORTE, CONTRATACION_INTENCION, DURACION, RESPONSABLE, DOCENTE_DIRECTOR, FECHA) VALUES
('1', 'Programa de mantenimiento de 200 horas', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '8', '1', '1', '2022-11-19 21:37:37'),
('2', 'Traduccion del manial de normas y procedimientos', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '1', '8', '1', '2', '2022-11-10 05:00:00'),
('3', 'Evaluacion del desempeño de un sistema de intercambio', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '8', '1', '3', '2022-10-15 05:00:00'),
('4', 'Reparaciones de filtraciones y Grietas en el ', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '16', '1', '4', '2022-11-19 05:00:00');


