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
   DESCRIPCION          varchar(100)                   not null,
   PROGRAMA             int                            not null,
   constraint PK_COMITE_ASESOR primary key clustered (ID)
);

alter table COMITE_ASESOR
   add constraint FK_COMITE_A_REFERENCE_PROGRAMA foreign key (PROGRAMA)
      references PROGRAMA (ID)
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

INSERT INTO `proyecto`.`tipo_id` (`NOMBRE`) VALUES ('Cedula de ciudadania');
INSERT INTO `proyecto`.`persona` (`ID`,`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1000808481','1', 'Bogotá', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', '3053109089', '1');
INSERT INTO `proyecto`.`persona` (`ID`,`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1000808482','1', 'Bogotá', 'Victor Daniel', 'Díaz Reyes', 'vidiazr@unal.edu.co', '3053109090', '1');
INSERT INTO `proyecto`.`persona` (`ID`,`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1000808483','1', 'Bogotá', 'Ivan David', 'Molina Leguizamo', 'ivdmolinale@unal.edu.co', '3053109091', '1');
INSERT INTO `proyecto`.`usuario` (`NOMBRE`, `CONTRASENA`, `PERSONA`) VALUES ('ssiabatto', '1234', '1000808481');
INSERT INTO `proyecto`.`usuario` (`NOMBRE`, `CONTRASENA`, `PERSONA`) VALUES ('vidiazr', '1234', '1000808482');
INSERT INTO `proyecto`.`usuario` (`NOMBRE`, `CONTRASENA`, `PERSONA`) VALUES ('ivdmolinale', '1234', '1000808483');
INSERT INTO `proyecto`.`jornada` (`NOMBRE`) VALUES ('Diurno');
INSERT INTO `proyecto`.`sede` (`NOMBRE`, `CIUDAD`) VALUES ('Sede Bogotá','Bogotá');
INSERT INTO `proyecto`.`facultad` (`NOMBRE`, `Sede`) VALUES ('Ingeniería', '1');
INSERT INTO `proyecto`.`departamento` (`NOMBRE`,`FACULTAD`) VALUES ('Ingeniería Civil y Agrícola', '1');
INSERT INTO `proyecto`.`departamento` (`NOMBRE`,`FACULTAD`) VALUES ('Ingeniería de Sistemas e Industrial', '1');
INSERT INTO `proyecto`.`programa` (`ID`, `NOMBRE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('24','Ingeniería Agrícola','1','1');
INSERT INTO `proyecto`.`programa` (`ID`, `NOMBRE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('106661','Ingeniería de Sistemas y Computación','1','2');
insert into `proyecto`.`estado` (`NOMBRE`) VALUES ('Disponible');
INSERT INTO `proyecto`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`,`AVANCE`,`ESTADO`) VALUES ('1000808481','106661','50','1');
INSERT INTO `proyecto`.`docente` (`PERSONA_ID`, `DEPARTAMENTO`) VALUES ('1000808482','2');
INSERT INTO `proyecto`.`empresa` (`NIT`, `NOMBRE`, `CORREO`, `TELEFONO`, `CIUDAD`) VALUES ('890.900.608-9','Empresa1', 'empresa1@empresa.com', '3053109095', 'Bogotá');
INSERT INTO `proyecto`.`cargo` (`NOMBRE`) VALUES ('Gerente');
INSERT INTO `proyecto`.`cargo` (`NOMBRE`) VALUES ('Asesor');
INSERT INTO `proyecto`.`cargo` (`NOMBRE`) VALUES ('Auxiliar');
INSERT INTO `proyecto`.`cargo` (`NOMBRE`) VALUES ('Asistente');
INSERT INTO `proyecto`.`area` (`NOMBRE`) VALUES ('Ingeniería');
INSERT INTO `proyecto`.`area` (`NOMBRE`) VALUES ('Contaduría');
INSERT INTO `proyecto`.`area` (`NOMBRE`) VALUES ('Talento Humano');
INSERT INTO `proyecto`.`area` (`NOMBRE`) VALUES ('Compras');
INSERT INTO `proyecto`.`area` (`NOMBRE`) VALUES ('Presidencia');
INSERT INTO `proyecto`.`responsable` (`PERSONA_ID`, `EMPRESA`, `CARGO`, `AREA`) VALUES ('1000808483','1', '1', '5');


