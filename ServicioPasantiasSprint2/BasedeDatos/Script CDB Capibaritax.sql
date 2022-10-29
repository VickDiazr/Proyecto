
/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
drop table if exists CARGO;

create table CARGO (
	ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
drop table if exists EMPRESA;

create table EMPRESA (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CORREO               varchar(100)                        NOT NULL,
   TELEFONO             varchar(100)                        NOT NULL,
   CIUDAD               varchar(100)                        null,
   CONSTRAINT PK_EMPRESA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: TIPO_ID                                               */
/*==============================================================*/
drop table if exists TIPO_ID;

create table TIPO_ID (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_TIPO_ID PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
drop table if exists PERSONA;

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
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
drop table if exists AREA;

create table AREA (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_AREA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/      
drop table if exists RESPONSABLE;

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
      on update restrict
      on delete restrict;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_EMPRESA foreign key (EMPRESA)
      references EMPRESA (ID)
      on update restrict
      on delete restrict;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update restrict
      on delete restrict;

alter table RESPONSABLE
   add CONSTRAINT FK_RESPONSA_REFERENCE_AREA foreign key (AREA)
      references AREA (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
drop table if exists DEPARTAMENTO;

create table DEPARTAMENTO (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
drop table if exists SEDE;

create table SEDE (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CIUDAD               varchar(100)                        null,
   CONSTRAINT PK_SEDE PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
drop table if exists JORNADA;

create table JORNADA (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_JORNADA PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
drop table if exists PROGRAMA;

create table PROGRAMA (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   SEDE                 int                            NOT NULL,
   JORNADA              int                            NOT NULL,
   DEPARTAMENTO         int                            null,
   CONSTRAINT PK_PROGRAMA PRIMARY KEY clustered (ID)
);

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_DEPARTAM foreign key (DEPARTAMENTO)
      references DEPARTAMENTO (ID)
      on update restrict
      on delete restrict;

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_JORNADA foreign key (JORNADA)
      references JORNADA (ID)
      on update restrict
      on delete restrict;

alter table PROGRAMA
   add CONSTRAINT FK_PROGRAMA_REFERENCE_SEDE foreign key (SEDE)
      references SEDE (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
drop table if exists DOCENTE;

CREATE TABLE DOCENTE (
    ID INT NOT NULL,
    PERSONA_ID INT NOT NULL,
    PROGRAMA INT NOT NULL,
    EXTENCION INT NOT NULL,
    CONSTRAINT PK_DOCENTE PRIMARY KEY clustered (ID)
);

alter table DOCENTE
   add CONSTRAINT FK_DOCENTE_REFERENCE_PROGRAMA foreign key (PROGRAMA)
      references PROGRAMA (ID)
      on update restrict
      on delete restrict;

alter table DOCENTE
   add CONSTRAINT FK_DOCENTE_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
drop table if exists ESTADO;

create table ESTADO (
   ID                   int                            NOT NULL,
   NOMBRE               varchar(100)                        NOT NULL,
   CONSTRAINT PK_ESTADO PRIMARY KEY clustered (ID)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
drop table if exists ESTUDIANTE;

CREATE TABLE ESTUDIANTE (
    ID INT NOT NULL,
    PERSONA_ID INT NOT NULL,
    PROGRAMA_ID INT NOT NULL,
    AVANCE FLOAT NOT NULL,
    ESTADO INT NOT NULL,
    CONSTRAINT PK_ESTUDIANTE PRIMARY KEY clustered (ID)
);

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_ESTADO foreign key (ESTADO)
      references ESTADO (ID)
      on update restrict
      on delete restrict;

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_PERSONA foreign key (PERSONA_ID)
      references PERSONA (ID)
      on update restrict
      on delete restrict;

alter table ESTUDIANTE
   add CONSTRAINT FK_ESTUDIAN_REFERENCE_PROGRAMA foreign key (PROGRAMA_ID)
      references PROGRAMA (ID)
      on update restrict
      on delete restrict;


/*==============================================================*/
/* Table: REGISTRO_PASANTIA                                     */
/*==============================================================*/
drop table if exists REGISTRO_PASANTIA;

create table REGISTRO_PASANTIA (
   ID                   int                            NOT NULL,
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
      on update restrict
      on delete restrict;

alter table REGISTRO_PASANTIA
   add CONSTRAINT FK_REGISTRO_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      on update restrict
      on delete restrict;

alter table REGISTRO_PASANTIA
   add CONSTRAINT FK_REGISTRO_REFERENCE_DOCENTE foreign key (DOCENTE_DIRECTOR)
      references DOCENTE (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: PASANTE                                               */
/*==============================================================*/
drop table if exists PASANTE;

CREATE TABLE PASANTE (
    ID INT NOT NULL,
    ESTUDIANTE INT NOT NULL,
    REGISTRO INT NOT NULL,
    CONSTRAINT PK_PASANTE PRIMARY KEY clustered (ID)
);

alter table PASANTE
   add CONSTRAINT FK_PASANTE_REFERENCE_ESTUDIAN foreign key (ESTUDIANTE)
      references ESTUDIANTE (ID)
      on update restrict
      on delete restrict;

alter table PASANTE
   add CONSTRAINT FK_PASANTE_REFERENCE_REGISTRO foreign key (REGISTRO)
      references REGISTRO_PASANTIA (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: EVALUACION                                            */
/*==============================================================*/
drop table if exists EVALUACION;

CREATE TABLE EVALUACION (
    ID INT NOT NULL,
    PASANTE INT NOT NULL,
    RESPONSABLE INT NOT NULL,
    FECHA TIMESTAMP NOT NULL,
    CONSTRAINT PK_EVALUACION PRIMARY KEY clustered (ID)
);

alter table EVALUACION
   add CONSTRAINT FK_EVALUACI_REFERENCE_PASANTE foreign key (PASANTE)
      references PASANTE (ID)
      on update restrict
      on delete restrict;

alter table EVALUACION
   add CONSTRAINT FK_EVALUACI_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      on update restrict
      on delete restrict;


/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
drop table if exists ACTIVIDAD;

create table ACTIVIDAD (
   ID                   int                            NOT NULL,
   PASANTIA             int                            NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   SEMANA_INICIO        int                            NOT NULL,
   SEMANA_FIN           int                            NOT NULL,
   CONSTRAINT PK_ACTIVIDAD PRIMARY KEY clustered (ID)
);

alter table ACTIVIDAD
   add CONSTRAINT FK_ACTIVIDA_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: OBJETIVO_ESPECIFICO                                   */
/*==============================================================*/
drop table if exists OBJETIVO_ESPECIFICO;

create table OBJETIVO_ESPECIFICO (
   ID                   int                            NOT NULL,
   PASANTIA             int                            NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_OBJETIVO_ESPECIFICO PRIMARY KEY clustered (ID)
);

alter table OBJETIVO_ESPECIFICO
   add CONSTRAINT FK_OBJETIVO_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      on update restrict
      on delete restrict;


/*==============================================================*/
/* Table: CRITERIO                                              */
/*==============================================================*/
drop table if exists CRITERIO;

create table CRITERIO (
   ID                   int                            NOT NULL,
   PASANTIA             int                            NOT NULL,
   PORCENTAJE           float                          NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_CRITERIO PRIMARY KEY clustered (ID)
);

alter table CRITERIO
   add CONSTRAINT FK_CRITERIO_REFERENCE_REGISTRO foreign key (PASANTIA)
      references REGISTRO_PASANTIA (ID)
      on update restrict
      on delete restrict;

/*==============================================================*/
/* Table: COMITE_ASESOR                                         */
/*==============================================================*/
drop table if exists COMITE_ASESOR;

create table COMITE_ASESOR (
   ID                   int                            NOT NULL,
   DESCRIPCION          varchar(100)                        NOT NULL,
   CONSTRAINT PK_COMITE_ASESOR PRIMARY KEY clustered (ID)
);


/*==============================================================*/
/* Table: VERIFICACION                                          */
/*==============================================================*/
drop table if exists VERIFICACION;

CREATE TABLE VERIFICACION (
    ID INT NOT NULL,
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
      on update restrict
      on delete restrict;

alter table VERIFICACION
   add CONSTRAINT FK_VERIFICA_REFERENCE_COMITE_A foreign key (COMITE)
      references COMITE_ASESOR (ID)
      on update restrict
      on delete restrict;
