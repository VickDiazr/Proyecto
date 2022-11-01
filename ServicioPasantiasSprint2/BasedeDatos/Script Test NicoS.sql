drop table if exists VERIFICACION;
drop table if exists COMITE_ASESOR;
drop table if exists CRITERIO;
drop table if exists OBJETIVO_ESPECIFICO;
drop table if exists ACTIVIDAD;
drop table if exists EVALUACION;
drop table if exists PASANTE;
drop table if exists REGISTRO_PASANTIA;
drop table if exists ESTUDIANTE;
drop table if exists ESTADO;
drop table if exists DOCENTE;
drop table if exists PROGRAMA;
drop table if exists JORNADA;
drop table if exists SEDE;
drop table if exists FACULTAD;
drop table if exists RESPONSABLE;
drop table if exists AREA;
drop table if exists USUARIO;
drop table if exists PERSONA;
drop table if exists TIPO_ID;
drop table if exists EMPRESA;
drop table if exists CARGO;

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
	ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CORREO               varchar(100)                        NOT NULL,
   TELEFONO             varchar(100)                        NOT NULL,
   CIUDAD               varchar(100)                        null,
   CONSTRAINT PK_EMPRESA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: TIPO_ID                                               */
/*==============================================================*/
create table TIPO_ID (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_TIPO_ID PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   ID                   int                            NOT NULL,
   TIPO_ID              int                            NOT NULL,
   LUGAR_EXP_ID         varchar(100)                        NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   APELLIDO             varchar(100)                        NOT NULL,
   CORREO               varchar(100)                        NOT NULL,
   TELEFONO             varchar(100)                        NOT NULL,
   FIRMA                smallint                       NOT NULL,
   CONSTRAINT PK_PERSONA PRIMARY KEY clustered (ID)
);

alter table PERSONA
   add CONSTRAINT FK_PERSONA_REFERENCE_TIPO_ID foreign key (TIPO_ID)
      references TIPO_ID (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   PERSONA              int                            NOT NULL,
   NOMBRE               varchar(100)                   NOT NULL,
   CONTRASENA           varchar(100)                   NOT NULL,
   CONSTRAINT PK_USUARIO PRIMARY KEY clustered (ID)
);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PERSONA foreign key (PERSONA)
      references PERSONA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_AREA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/
CREATE TABLE RESPONSABLE (
    ID INT NOT NULL,
    PERSONA_ID INT NOT NULL,
    EMPRESA INT NOT NULL,
    CARGO INT NOT NULL,
    AREA INT NOT NULL,
    CONSTRAINT PK_RESPONSABLE PRIMARY KEY clustered (ID)
);

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_CARGO foreign key (CARGO)
      references CARGO (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_EMPRESA foreign key (EMPRESA)
      references EMPRESA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_AREA foreign key (AREA)
      references AREA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CIUDAD               varchar(100)                        null,
   CONSTRAINT PK_SEDE PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
create table JORNADA (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_JORNADA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   SEDE                 int                            NOT NULL,
   JORNADA              int                            NOT NULL,
   FACULTAD         int                            null,
   CONSTRAINT PK_PROGRAMA PRIMARY KEY clustered (ID)
);

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_FACULTAD foreign key (FACULTAD)
      references FACULTAD (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_JORNADA foreign key (JORNADA)
      references JORNADA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_SEDE foreign key (SEDE)
      references SEDE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE (
    ID INT NOT NULL,
    PERSONA_ID INT NOT NULL,
    PROGRAMA INT NOT NULL,
    TELEFONO INT NOT NULL,
    CONSTRAINT PK_DOCENTE PRIMARY KEY clustered (ID)
);

alter table DOCENTE
   add CONSTRAINT FK_DOCENTE_REFERENCE_PROGRAMA foreign key (PROGRAMA)
      references PROGRAMA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table DOCENTE
   add CONSTRAINT FK_DOCENTE_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_ESTADO PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
CREATE TABLE ESTUDIANTE (
    ID INT NOT NULL AUTO_INCREMENT,
    PERSONA_ID INT NOT NULL,
    PROGRAMA_ID INT NOT NULL,
    AVANCE FLOAT NOT NULL,
    ESTADO INT NOT NULL,
    CONSTRAINT PK_ESTUDIANTE PRIMARY KEY clustered (ID)
);

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_ESTADO foreign key (ESTADO)
      references ESTADO (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_PROGRAMA foreign key (PROGRAMA_ID)
      references PROGRAMA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: REGISTRO_PASANTIA                                     */
/*==============================================================*/
create table REGISTRO_PASANTIA (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   ESTUDIANTE           int                            NOT NULL,
   TITULO               varchar(100)                        null,
   OBJETIVO_GENERAL     varchar(100)                        null,
   INTRODUCCION         varchar(100)                        null,
   JUSTIFICACION        varchar(100)                        null,
   APLICACION_APORTE    varchar(100)                        null,
   CONTRATACION_INTENCION smallint                       null,
   DURACION             int                            null,
   RESPONSABLE          int                            null,
   DOCENTE_DIRECTOR     int                            null,
   CONSTRAINT PK_REGISTRO_PASANTIA PRIMARY KEY clustered (ID)
);

alter table REGISTRO_PASANTIA
   add CONSTRAINT FK_REGISTRO_REFERENCE_ESTUDIAN foreign key (ESTUDIANTE)
      references ESTUDIANTE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table REGISTRO_PASANTIA
   add CONSTRAINT FK_REGISTRO_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table REGISTRO_PASANTIA
   add CONSTRAINT FK_REGISTRO_REFERENCE_DOCENTE foreign key (DOCENTE_DIRECTOR)
      references DOCENTE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: PASANTE                                               */
/*==============================================================*/
CREATE TABLE PASANTE (
    ID INT NOT NULL AUTO_INCREMENT,
    ESTUDIANTE INT NOT NULL,
    REGISTRO INT NOT NULL,
    CONSTRAINT PK_PASANTE PRIMARY KEY clustered (ID)
);

alter table PASANTE
   add CONSTRAINT FK_PASANTE_REFERENCE_ESTUDIAN foreign key (ESTUDIANTE)
      references ESTUDIANTE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table PASANTE
   add CONSTRAINT FK_PASANTE_REFERENCE_REGISTRO foreign key (REGISTRO)
      references REGISTRO_PASANTIA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: EVALUACION                                            */
/*==============================================================*/
CREATE TABLE EVALUACION (
    ID INT NOT NULL AUTO_INCREMENT,
    PASANTE INT NOT NULL,
    RESPONSABLE INT NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    CONSTRAINT PK_EVALUACION PRIMARY KEY clustered (ID)
);

alter table EVALUACION
   add CONSTRAINT FK_EVALUACI_REFERENCE_PASANTE foreign key (PASANTE)
      references PASANTE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table EVALUACION
   add CONSTRAINT FK_EVALUACI_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   PASANTIA             int                            NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   SEMANA_INICIO        int                            NOT NULL,
   SEMANA_FIN           int                            NOT NULL,
   CONSTRAINT PK_ACTIVIDAD PRIMARY KEY clustered (ID)
);

alter table ACTIVIDAD
   add CONSTRAINT FK_ACTIVIDA_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: OBJETIVO_ESPECIFICO                                   */
/*==============================================================*/
create table OBJETIVO_ESPECIFICO (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   PASANTIA             int                            NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_OBJETIVO_ESPECIFICO PRIMARY KEY clustered (ID)
);

alter table OBJETIVO_ESPECIFICO
   add CONSTRAINT FK_OBJETIVO_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: CRITERIO                                              */
/*==============================================================*/
create table CRITERIO (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   PASANTIA             int                            NOT NULL,
   PORCENTAJE           float                          NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_CRITERIO PRIMARY KEY clustered (ID)
);

alter table CRITERIO
   add CONSTRAINT FK_CRITERIO_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

/*==============================================================*/
/* Table: COMITE_ASESOR                                         */
/*==============================================================*/
create table COMITE_ASESOR (
   ID                   int                            NOT NULL AUTO_INCREMENT,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_COMITE_ASESOR PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: VERIFICACION                                          */
/*==============================================================*/
CREATE TABLE VERIFICACION (
    ID INT NOT NULL AUTO_INCREMENT,
    REGISTRO_PASANTIA INT NULL,
    COMITE INT NULL,
    ACTA INT NOT NULL,
    CONSECUTIVO INT NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    RESULTADO SMALLINT NOT NULL,
    CONSTRAINT PK_VERIFICACION PRIMARY KEY clustered (ID)
);

alter table VERIFICACION
   add CONSTRAINT FK_VERIFICA_REFERENCE_REGISTRO foreign key (REGISTRO_PASANTIA)
      references REGISTRO_PASANTIA (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

alter table VERIFICACION
   add CONSTRAINT FK_VERIFICA_REFERENCE_COMITE_A foreign key (COMITE)
      references COMITE_ASESOR (ID)
      ON UPDATE CASCADE
      ON DELETE CASCADE;

INSERT INTO `proyecto`.`tipo_id` (`NOMBRE`) VALUES ('Cedula de ciudadania');
INSERT INTO `proyecto`.`persona` (`ID`,`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1000808481','1', 'Bogotá', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', '3053109089', '1');
INSERT INTO `proyecto`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('1000808481', 'Nico', '1234');
INSERT INTO `proyecto`.`jornada` (`NOMBRE`) VALUES ('Diurno');
INSERT INTO `proyecto`.`sede` (`NOMBRE`, `CIUDAD`) VALUES ('Sede Bogotá','Bogotá');
INSERT INTO `proyecto`.`facultad` (`NOMBRE`) VALUES ('Ingeniería');
INSERT INTO `proyecto`.`programa` (`ID`, `NOMBRE`, `SEDE`,`JORNADA`,`FACULTAD`) VALUES ('24','Ingeniería Agrícola','1','1','1');
INSERT INTO `proyecto`.`programa` (`ID`, `NOMBRE`, `SEDE`,`JORNADA`,`FACULTAD`) VALUES ('106661','Ingeniería de Sistemas y Computación','1','1','1');
insert into `proyecto`.`estado` (`NOMBRE`) VALUES ('Disponible');
INSERT INTO `proyecto`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`,`AVANCE`,`ESTADO`) VALUES ('1000808481','106661','50','1');