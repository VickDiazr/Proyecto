/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_CARGO primary key clustered (ID)
);
/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_AREA primary key clustered (ID)
);
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
   constraint PK_EMPRESA primary key clustered (ID)
);
/*==============================================================*/
/* Table: TIPO_ID                                               */
/*==============================================================*/
create table TIPO_ID 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   ESTADO               smallint                       null,
   FIRMA                smallint                       null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
   constraint PK_PERSONA primary key clustered (ID)
);

alter table PERSONA
   add constraint FK_PERSONA_REFERENCE_TIPO_ID foreign key (TIPO_ID)
      references TIPO_ID (ID)
      on update cascade
      on delete cascade;
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
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
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   CONTRASENA           varchar(100)                   not null,
   PERSONA              int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
   constraint PK_USUARIO primary key clustered (ID)
);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PERSONA foreign key (PERSONA)
      references PERSONA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   CIUDAD               varchar(100)                   null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_SEDE primary key clustered (ID)
);
/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   SEDE                 int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   NOMBRE               varchar(100)                   not null,
   FACULTAD             int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   DEPARTAMENTO         int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_PROGRAMA primary key clustered (ID)
);

alter table PROGRAMA
   add constraint FK_PROGRAMA_REFERENCE_DEPARTAM foreign key (DEPARTAMENTO)
      references DEPARTAMENTO (ID)
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_COMITE_ASESOR primary key clustered (ID)
);

alter table COMITE_ASESOR
   add constraint FK_COMITE_A_REFERENCE_PROGRAMA foreign key (PROGRAMA)
      references PROGRAMA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   ID                   int                            not null AUTO_INCREMENT,
   PERSONA_ID           int                            not null,
   PROGRAMA_ID          int                            not null,
   AVANCE               float                          null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
   constraint PK_ESTUDIANTE primary key clustered (ID)
);

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
   DEPARTAMENTO         int                            not null,
   EXTENSION            int                            null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   USUARIO              int                            null,
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
   ID                   int                            not null AUTO_INCREMENT,
   ESTUDIANTE           int                            null,
   TITULO               varchar(100)                   null,
   OBJETIVO_GENERAL     varchar(100)                   null,
   INTRODUCCION         varchar(100)                   null,
   JUSTIFICACION        varchar(100)                   null,
   APLICACION_APORTE    varchar(100)                   null,
   CONTRATACION_INTENCION smallint                     null,
   DURACION             float                          null,
   RESPONSABLE          int                            null,
   DOCENTE_DIRECTOR     int                            null,
   ESTADO               smallint                       null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   RESULTADO            smallint                       not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   TITULO				varchar(100) 				   not null,
   DESCRIPCION          varchar(100)                   not null,
   TIPOLOGIA 			varchar(10)					   not null,
   FECHA_INICIO         varchar(30)                    not null,
   FECHA_FIN            varchar(30)                    not null,
   UBICACION 		    varchar(100)                   not null,
   RESPONSABLE          int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_ACTIVIDAD primary key clustered (ID)
);

alter table ACTIVIDAD
   add constraint FK_ACTIVIDA_REFERENCE_RESPONSA foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
/*==============================================================*/
/* Table: DOCENTE_COMITE                                        */
/*==============================================================*/
create table DOCENTE_COMITE 
(
   ID                   int                            not null AUTO_INCREMENT,
   DOCENTE              int                            not null,
   COMITE               int                            not null,
   FECHA                timestamp                      not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint PK_DOCENTE_COMITE primary key clustered (ID)
);

alter table DOCENTE_COMITE
   add constraint FK_DOCENTE_REFERENCE_COMITE_A foreign key (COMITE)
      references COMITE_ASESOR (ID)
      on update cascade
      on delete cascade;

alter table DOCENTE_COMITE
   add constraint FK_DOCENTE_REFERENCE_DOCENTE foreign key (DOCENTE)
      references DOCENTE (ID)
      on update cascade
      on delete cascade;      
/*===================================================================================*/
/* AUDITORIA                                                                         */
/*===================================================================================*/
/*==============================================================*/
/* Table: AUD_CARGO                                             */
/*==============================================================*/
create table AUD_CARGO 
(
   ID                   int                            not null AUTO_INCREMENT,
   CARGO                int                            not null,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_CARGO primary key clustered (ID)
);

alter table AUD_CARGO
   add constraint FK_AUD_CARGO_REFERENCE_CARGO foreign key (CARGO)
      references CARGO (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_AREA                                              */
/*==============================================================*/
create table AUD_AREA 
(
   ID                   int                            not null AUTO_INCREMENT,
   AREA                 int                            not null,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_AREA primary key clustered (ID)
);

alter table AUD_AREA
   add constraint FK_AUD_AREA_REFERENCE_AREA foreign key (AREA)
      references AREA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_EMPRESA                                               */
/*==============================================================*/
create table AUD_EMPRESA 
(
   ID                   int                            not null AUTO_INCREMENT,
   EMPRESA              int                            not null,
   NOMBRE               varchar(100)                   not null,
   CORREO               varchar(100)                   null,
   TELEFONO             varchar(100)                   null,
   CIUDAD               varchar(100)                   null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_EMPRESA primary key clustered (ID)
);

alter table AUD_EMPRESA
   add constraint FK_AUD_EMPRESA_REFERENCE_EMPRESA foreign key (EMPRESA)
      references EMPRESA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_TIPO_ID                                               */
/*==============================================================*/
create table AUD_TIPO_ID 
(
   ID                   int                            not null AUTO_INCREMENT,
   TIPO_ID              int                            not null,
   NOMBRE               varchar(100)                   not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_TIPO_ID primary key clustered (ID)
);

alter table AUD_TIPO_ID
   add constraint FK_AUD_TIPO_ID_REFERENCE_TIPO_ID foreign key (TIPO_ID)
      references TIPO_ID (ID)
      on update cascade
      on delete cascade;      
/*==============================================================*/
/* Table: AUD_PERSONA                                               */
/*==============================================================*/
create table AUD_PERSONA 
(
   ID                   int                            not null,
   PERSONA              int                            not null,
   TIPO_ID              int                            not null,
   LUGAR_EXP_ID         varchar(100)                   not null,
   NOMBRE               varchar(100)                   not null,
   APELLIDO             varchar(100)                   not null,
   CORREO               varchar(100)                   not null UNIQUE,
   TELEFONO             varchar(100)                   not null,
   FIRMA                smallint                       null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_PERSONA primary key clustered (ID)
);

alter table AUD_PERSONA
   add constraint FK_AUD_PERSONA_REFERENCE_PERSONA foreign key (PERSONA)
      references PERSONA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_RESPONSABLE                                           */
/*==============================================================*/
create table AUD_RESPONSABLE 
(
   ID                   int                            not null AUTO_INCREMENT,
   RESPONSABLE          int                            not null,
   PERSONA_ID           int                            not null,
   EMPRESA              int                            not null,
   CARGO                int                            null,
   AREA                 int                            null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_RESPONSABLE primary key clustered (ID)
);

alter table AUD_RESPONSABLE
   add constraint FK_AUD_RESPONSABLE_REFERENCE_RESPONSABLE foreign key (RESPONSABLE)
      references RESPONSABLE (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_USUARIO                                               */
/*==============================================================*/
create table AUD_USUARIO 
(
   ID                   int                            not null AUTO_INCREMENT,
   USUARIO_ID           int                            not null,
   NOMBRE               varchar(100)                   not null,
   CONTRASENA           varchar(100)                   not null,
   PERSONA              int                            not null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_USUARIO primary key clustered (ID)
);

alter table AUD_USUARIO
   add constraint FK_AUD_USUARIO_REFERENCE_USUARIO foreign key (USUARIO)
      references USUARIO (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_SEDE                                                  */
/*==============================================================*/
create table AUD_SEDE 
(
   ID                   int                            not null AUTO_INCREMENT,
   SEDE                 int                            not null,
   NOMBRE               varchar(100)                   not null,
   CIUDAD               varchar(100)                   null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_SEDE primary key clustered (ID)
);

alter table AUD_SEDE
   add constraint FK_AUD_SEDE_REFERENCE_SEDE foreign key (SEDE)
      references SEDE (ID)
      on update cascade
      on delete cascade;      
/*==============================================================*/
/* Table: AUD_FACULTAD                                              */
/*==============================================================*/
create table AUD_FACULTAD 
(
   ID                   int                            not null AUTO_INCREMENT,
   FACULTAD             int                            not null,
   NOMBRE               varchar(100)                   not null,
   SEDE                 int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_FACULTAD primary key clustered (ID)
);

alter table AUD_FACULTAD
   add constraint FK_AUD_FACULTAD_REFERENCE_FACULTAD foreign key (FACULTAD)
      references FACULTAD (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_DEPARTAMENTO                                          */
/*==============================================================*/
create table AUD_DEPARTAMENTO 
(
   ID                   int                            not null AUTO_INCREMENT,
   DEPARTAMENTO         int                            not null,
   NOMBRE               varchar(100)                   not null,
   FACULTAD             int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_DEPARTAMENTO primary key clustered (ID)
);

alter table AUD_DEPARTAMENTO
   add constraint FK_AUD_DEPARTAMENTO_REFERENCE_DEPARTAMENTO foreign key (DEPARTAMENTO)
      references DEPARTAMENTO (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_PROGRAMA                                              */
/*==============================================================*/
create table AUD_PROGRAMA 
(
   ID                   int                            not null AUTO_INCREMENT,
   PROGRAMA             int                            not null,
   NOMBRE               varchar(100)                   not null,
   DEPARTAMENTO         int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_PROGRAMA primary key clustered (ID)
);

alter table AUD_PROGRAMA
   add constraint FK_AUD_PROGRAMA_REFERENCE_PROGRAMA foreign key (PROGRAMA)
      references PROGRAMA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_COMITE_ASESOR                                         */
/*==============================================================*/
create table AUD_COMITE_ASESOR 
(
   ID                   int                            not null AUTO_INCREMENT,
   COMITE_ASESOR        int                            not null,
   DESCRIPCION          varchar(100)                   not null,
   PROGRAMA             int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_COMITE_ASESOR primary key clustered (ID)
);

alter table AUD_COMITE_ASESOR
   add constraint FK_AUD_COMITE_ASESOR_REFERENCE_COMITE_ASESOR foreign key (COMITE_ASESOR)
      references COMITE_ASESOR (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_ESTUDIANTE                                            */
/*==============================================================*/
create table AUD_ESTUDIANTE 
(
   ID                   int                            not null AUTO_INCREMENT,
   ESTUDIANTE           int                            not null,
   PERSONA_ID           int                            not null,
   PROGRAMA_ID          int                            not null,
   AVANCE               float                          null,
   ESTADO               smallint                       null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_ESTUDIANTE primary key clustered (ID)
);

alter table AUD_ESTUDIANTE
   add constraint FK_AUD_ESTUDIANTE_REFERENCE_ESTUDIANTE foreign key (ESTUDIANTE)
      references ESTUDIANTE (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_DOCENTE                                               */
/*==============================================================*/
create table AUD_DOCENTE 
(
   ID                   int                            not null AUTO_INCREMENT,
   DOCENTE              int                            not null,
   PERSONA_ID           int                            not null,
   DEPARTAMENTO         int                            not null,
   EXTENSION            int                            null,
   FECHA                timestamp                      not null,
   USUARIO              int                            null,
   constraint PK_AUD_DOCENTE primary key clustered (ID)
);

alter table AUD_DOCENTE
   add constraint FK_AUD_DOCENTE_REFERENCE_DOCENTE foreign key (DOCENTE)
      references DOCENTE (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_PASANTIA                                              */
/*==============================================================*/
create table AUD_PASANTIA 
(
   ID                   int                            not null AUTO_INCREMENT,
   PASANTIA             int                            not null,
   ESTUDIANTE           int                            null,
   TITULO               varchar(100)                   null,
   OBJETIVO_GENERAL     varchar(100)                   null,
   INTRODUCCION         varchar(100)                   null,
   JUSTIFICACION        varchar(100)                   null,
   APLICACION_APORTE    varchar(100)                   null,
   CONTRATACION_INTENCION smallint                     null,
   DURACION             float                          null,
   RESPONSABLE          int                            null,
   DOCENTE_DIRECTOR     int                            null,
   ESTADO               smallint                       null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_PASANTIA primary key clustered (ID)
);

alter table AUD_PASANTIA
   add constraint FK_AUD_PASANTIA_REFERENCE_PASANTIA foreign key (PASANTIA)
      references PASANTIA (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_VERIFICACION                                          */
/*==============================================================*/
create table AUD_VERIFICACION 
(
   ID                   int                            not null AUTO_INCREMENT,
   VERIFICACION         int                            not null,
   PASANTIA             int                            not null,
   COMITE               int                            not null,
   ACTA                 int                            null,
   CONSECUTIVO          int                            null,
   RESULTADO            smallint                       not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_VERIFICACION primary key clustered (ID)
);

alter table AUD_VERIFICACION
   add constraint FK_AUD_VERIFICACION_REFERENCE_VERIFICACION foreign key (VERIFICACION)
      references VERIFICACION (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_ACTIVIDAD                                             */
/*==============================================================*/
create table AUD_ACTIVIDAD 
(
   ID                   int                            not null AUTO_INCREMENT,
   ACTIVIDAD            int                            not null,
   TITULO               varchar(100)                   not null,
   DESCRIPCION          varchar(100)                   not null,
   TIPOLOGIA            varchar(10)                    not null,
   FECHA_INICIO         varchar(30)                    not null,
   FECHA_FIN            varchar(30)                    not null,
   UBICACION			varchar(100)				   not null,
   RESPONSABLE			int							   not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_ACTIVIDAD primary key clustered (ID)
);

alter table AUD_ACTIVIDAD
   add constraint FK_AUD_ACTIVIDAD_REFERENCE_ACTIVIDAD foreign key (ACTIVIDAD)
      references ACTIVIDAD (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_CRITERIO                                              */
/*==============================================================*/
create table AUD_CRITERIO 
(
   ID                   int                            not null AUTO_INCREMENT,
   CRITERIO             int                            not null,
   PASANTIA             int                            not null,
   PORCENTAJE           float                          not null,
   DESCRIPCION          varchar(100)                   not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_CRITERIO primary key clustered (ID)
);

alter table AUD_CRITERIO
   add constraint FK_AUD_CRITERIO_REFERENCE_CRITERIO foreign key (CRITERIO)
      references CRITERIO (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_OBJETIVO_ESPECIFICO                                   */
/*==============================================================*/
create table AUD_OBJETIVO_ESPECIFICO 
(
   ID                   int                            not null AUTO_INCREMENT,
   OBJETIVO_ESPECIFICO  int                            not null,
   PASANTIA             int                            not null,
   DESCRIPCION          varchar(100)                   not null,
   FECHA                timestamp                      not null,
   constraint PK_OBJETIVO_ESPECIFICO primary key clustered (ID)
);

alter table AUD_OBJETIVO_ESPECIFICO
   add constraint FK_AUD_OBJETIVO_ESPECIFICO_REFERENCE_OBJETIVO_ESPECIFICO foreign key (OBJETIVO_ESPECIFICO)
      references OBJETIVO_ESPECIFICO (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_EVALUACION                                            */
/*==============================================================*/
create table AUD_EVALUACION 
(
   ID                   int                            not null AUTO_INCREMENT,
   EVALUACION           int                            not null,
   PASANTIA             int                            not null,
   RESPONSABLE          int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_EVALUACION primary key clustered (ID)
);

alter table AUD_EVALUACION
   add constraint FK_AUD_EVALUACION_REFERENCE_EVALUACION foreign key (EVALUACION)
      references EVALUACION (ID)
      on update cascade
      on delete cascade;
/*==============================================================*/
/* Table: AUD_DOCENTE_COMITE                                    */
/*==============================================================*/
create table AUD_DOCENTE_COMITE 
(
   ID                   int                            not null AUTO_INCREMENT,
   DOCENTE_COMITE       int                            not null,
   DOCENTE              int                            not null,
   COMITE               int                            not null,
   FECHA                timestamp                      not null,
   constraint PK_AUD_DOCENTE_COMITE primary key clustered (ID)
);

alter table AUD_DOCENTE_COMITE
   add constraint FK_AUD_DOCENTE_COMITE_REFERENCE_DOCENTE_COMITE foreign key (DOCENTE_COMITE)
      references DOCENTE_COMITE (ID)
      on update cascade
      on delete cascade;
/*===================================================================================*/
/* TRIGGERS                                                                          */
/*===================================================================================*/
CREATE TRIGGER trigger_cargo BEFORE UPDATE ON cargo FOR EACH ROW
   INSERT INTO AUD_CARGO(CARGO,NOMBRE,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.FECHA);

CREATE TRIGGER trigger_area BEFORE UPDATE ON area FOR EACH ROW
   INSERT INTO AUD_AREA(AREA,NOMBRE,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.FECHA);

CREATE TRIGGER trigger_empresa BEFORE UPDATE ON empresa FOR EACH ROW
   INSERT INTO AUD_EMPRESA(EMPRESA,NOMBRE,CORREO,TELEFONO,CIUDAD,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.CORREO,OLD.TELEFONO,OLD.CIUDAD,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_tipo_id BEFORE UPDATE ON tipo_id FOR EACH ROW
   INSERT INTO AUD_TIPO_ID(TIPO_ID,NOMBRE,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.FECHA);

CREATE TRIGGER trigger_persona BEFORE UPDATE ON persona FOR EACH ROW
   INSERT INTO AUD_PERSONA(PERSONA,TIPO_ID,LUGAR_EXP_ID,NOMBRE,APELLIDO,CORREO,TELEFONO,ESTADO,FIRMA,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.TIPO_ID,OLD.LUGAR_EXP_ID,OLD.NOMBRE,OLD.APELLIDO,OLD.CORREO,OLD.TELEFONO,OLD.ESTADO,OLD.FIRMA,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_responsable BEFORE UPDATE ON responsable FOR EACH ROW
   INSERT INTO AUD_RESPONSABLE(RESPONSABLE,PERSONA_ID,EMPRESA,CARGO,AREA,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.PERSONA_ID,OLD.EMPRESA,OLD.CARGO,OLD.AREA,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_usuario BEFORE UPDATE ON usuario FOR EACH ROW
   INSERT INTO AUD_USUARIO(USUARIO_ID,NOMBRE,CONTRASENA,PERSONA,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.CONTRASENA,OLD.PERSONA,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_sede BEFORE UPDATE ON sede FOR EACH ROW
   INSERT INTO AUD_SEDE(SEDE,NOMBRE,CIUDAD,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.CIUDAD,OLD.FECHA);

CREATE TRIGGER trigger_facultad BEFORE UPDATE ON facultad FOR EACH ROW
   INSERT INTO AUD_FACULTAD(FACULTAD,NOMBRE,SEDE,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.SEDE,OLD.FECHA);

CREATE TRIGGER trigger_departamento BEFORE UPDATE ON departamento FOR EACH ROW
   INSERT INTO AUD_DEPARTAMENTO(DEPARTAMENTO,NOMBRE,FACULTAD,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.FACULTAD,OLD.FECHA);

CREATE TRIGGER trigger_programa BEFORE UPDATE ON programa FOR EACH ROW
   INSERT INTO AUD_PROGRAMA(PROGRAMA,NOMBRE,DEPARTAMENTO,FECHA) 
   VALUES(OLD.ID,OLD.NOMBRE,OLD.DEPARTAMENTO,OLD.FECHA);

CREATE TRIGGER trigger_comite_asesor BEFORE UPDATE ON comite_asesor FOR EACH ROW
   INSERT INTO AUD_COMITE_ASESOR(COMITE_ASESOR,DESCRIPCION,PROGRAMA,FECHA) 
   VALUES(OLD.ID,OLD.DESCRIPCION,OLD.PROGRAMA,OLD.FECHA);

CREATE TRIGGER trigger_estudiante BEFORE UPDATE ON estudiante FOR EACH ROW
   INSERT INTO AUD_ESTUDIANTE(ESTUDIANTE,PERSONA_ID,PROGRAMA_ID,AVANCE,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.PERSONA_ID,OLD.PROGRAMA_ID,OLD.AVANCE,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_docente BEFORE UPDATE ON docente FOR EACH ROW
   INSERT INTO AUD_DOCENTE(DOCENTE,PERSONA_ID,DEPARTAMENTO,EXTENSION,FECHA,USUARIO) 
   VALUES(OLD.ID,OLD.PERSONA_ID,OLD.DEPARTAMENTO,OLD.EXTENSION,OLD.FECHA,OLD.USUARIO);

CREATE TRIGGER trigger_pasantia BEFORE UPDATE ON pasantia FOR EACH ROW
   INSERT INTO AUD_PASANTIA(PASANTIA,ESTUDIANTE,TITULO,OBJETIVO_GENERAL,INTRODUCCION,JUSTIFICACION,APLICACION_APORTE,CONTRATACION_INTENCION,DURACION,RESPONSABLE,DOCENTE_DIRECTOR,ESTADO,FECHA) 
   VALUES(OLD.ID,OLD.ESTUDIANTE,OLD.TITULO,OLD.OBJETIVO_GENERAL,OLD.INTRODUCCION,OLD.JUSTIFICACION,OLD.APLICACION_APORTE,OLD.CONTRATACION_INTENCION,OLD.DURACION,OLD.RESPONSABLE,OLD.DOCENTE_DIRECTOR,OLD.ESTADO,OLD.FECHA);

CREATE TRIGGER trigger_verificacion BEFORE UPDATE ON verificacion FOR EACH ROW
   INSERT INTO AUD_VERIFICACION(VERIFICACION,PASANTIA,COMITE,ACTA,CONSECUTIVO,RESULTADO,FECHA) 
   VALUES(OLD.ID,OLD.PASANTIA,OLD.COMITE,OLD.ACTA,OLD.CONSECUTIVO,OLD.RESULTADO,OLD.FECHA);

CREATE TRIGGER trigger_actividad BEFORE UPDATE ON actividad FOR EACH ROW
   INSERT INTO AUD_ACTIVIDAD(ACTIVIDAD,TITULO,DESCRIPCION,TIPOLOGIA,FECHA_INICIO,FECHA_FIN,UBICACION,RESPONSABLE,FECHA) 
   VALUES(OLD.ID,OLD.TITULO,OLD.DESCRIPCION,OLD.TIPOLOGIA,OLD.FECHA_INICIO,OLD.FECHA_FIN,OLD.UBICACION,OLD.RESPONSABLE,OLD.FECHA);

CREATE TRIGGER trigger_criterio BEFORE UPDATE ON criterio FOR EACH ROW
   INSERT INTO AUD_CRITERIO(CRITERIO,PASANTIA,PORCENTAJE,DESCRIPCION,FECHA) 
   VALUES(OLD.ID,OLD.PASANTIA,OLD.PORCENTAJE,OLD.DESCRIPCION,OLD.FECHA);

CREATE TRIGGER trigger_objetivo_especifico BEFORE UPDATE ON objetivo_especifico FOR EACH ROW
   INSERT INTO AUD_OBJETIVO_ESPECIFICO(OBJETIVO_ESPECIFICO,PASANTIA,DESCRIPCION,FECHA) 
   VALUES(OLD.ID,OLD.PASANTIA,OLD.DESCRIPCION,OLD.FECHA);

CREATE TRIGGER trigger_evaluacion BEFORE UPDATE ON evaluacion FOR EACH ROW
   INSERT INTO AUD_EVALUACION(EVALUACION,PASANTIA,RESPONSABLE,FECHA) 
   VALUES(OLD.ID,OLD.PASANTIA,OLD.RESPONSABLE,OLD.FECHA);

CREATE TRIGGER trigger_docente_comite BEFORE UPDATE ON docente_comite FOR EACH ROW
   INSERT INTO AUD_DOCENTE_COMITE(DOCENTE_COMITE,DOCENTE,COMITE,FECHA) 
   VALUES(OLD.ID,OLD.DOCENTE,OLD.COMITE,OLD.FECHA);
/*===================================================================================*/
/* INSERTS                                                                           */
/*===================================================================================*/
INSERT INTO tipo_id (NOMBRE) VALUES
('Cédula de ciudadanía'),
('Tarjeta de identidad'),
('Cédula de extranjería');

Insert into persona (id, tipo_id, lugar_exp_id, nombre, apellido, correo, telefono, estado, firma) values
('1000808483','1', 'Bogota', 'Ivan David', 'Molina Leguizamo', 'ivdmolinale@empresa1.com', '3053109091','1', '1'),
('1000808481','1', 'Bogota', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', '3053109089', '1', '1'),
('1000808482','1', 'Bogota', 'Victor Daniel', 'Díaz Reyes', 'vidiazr@unal.edu.co', '3053109090',  '1', '1'),
(1000808491, 1, 'Bogotá', 'Karen Tatiana', 'Alvarez Baez', 'kaalvarezb@unal.edu.co', '3053119089', '1', 1),
(1000808471, 1, 'Bogotá', 'Diana Marcela', 'Bello Lopez', 'dbellol@unal.edu.co', '3053129089', '1', 1),
(1000808461, 1, 'Bogotá', 'Camilo Andres', 'Cardenas Vargas', 'ccardenasv@unal.edu.co', '3053139089', '1', 1),
(1000808451, 1, 'Bogotá', 'Calina', 'Catalina Roz', 'catroz@gmail.com', '3053139986', '1', 1),
(1000808431, 1, 'Soacha', 'Raul', 'Rodriguez', 'similar@gmail.com', '3053136985', '1', 1),
(1000808421, 1, 'Soacha', 'Nicolas', 'Ruiz Garzon', 'nic@gmail.com', '3053116895', '1', 1),
(1020355481, 1, 'Soacha', 'Raul', 'Rodriguez', 'rodrigrau@unal.edu.co', '3203251258', '1', 1),
(1000808411, 1, 'Soacha', 'Nicolas', 'Ruiz Garzon', 'snsc25@hotmail.com', '3053116854', null, 1),
(1051238523, 1, 'Bogotá', 'Calina', 'Catalina Roa', 'catroa@unal.edu.co', '3058421851', null, 1),
(1003235621, 1, 'Tunja', 'Obed Felipe', 'Espinosa Angarita', 'ofespinosaa@unal.edu.co', '3058085048', null, 1),
(1051586412, 1, 'Bogotá', 'David Alejandro', ' Cifuentes Gonzalez', 'dcifuentesg@unal.edu.co', '3205612315', null, 1);

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

INSERT INTO sede (NOMBRE, CIUDAD) VALUES ('Sede Bogotá','Bogotá');

INSERT INTO facultad (NOMBRE, SEDE) VALUES ('Ingeniería', '1');

INSERT INTO departamento (NOMBRE, FACULTAD) VALUES
('Ingeniería Civil y Agrícola', '1'),
('Ingeniería de Sistemas e Industrial', '1');

INSERT INTO programa (ID, NOMBRE, DEPARTAMENTO) VALUES
('24','Ingeniería Agrícola','1'),
('106661','Ingeniería de Sistemas y Computación','2');

INSERT INTO docente (PERSONA_ID, DEPARTAMENTO, EXTENSION) VALUES
('1000808482','2', null),
('1000808451','2', null),
('1000808431','2', null),
('1000808421','2', null),
('1051586412','1', null),
('1020355481','1', null);

INSERT INTO comite_asesor (descripcion, programa) values ('Comité Asesor de Ingeniería Agrícola', '24');

INSERT INTO docente_comite (docente, comite) values ('6', '1');

INSERT INTO estudiante (PERSONA_ID, PROGRAMA_ID, AVANCE) VALUES
('1000808481','106661','70'),
('1000808491','24','80'),
('1000808471','106661','82'),
('1000808461','24','92'),
('1000808411','24', null),
('1051238523','106661',null);

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

Insert into actividad (TITULO, DESCRIPCION, TIPOLOGIA, FECHA_INICIO, FECHA_FIN, UBICACION, RESPONSABLE) values
('Programa de mantenimiento de 200 horas','Mantenimiento','Pasantía', '2022-11-30','2023-05-19','Bogotá','1'),
('Traduccion del manial de normas y procedimientos','Traducción','Pasantía','2022-11-30','2023-05-19','Bogotá','1'),
('Evaluacion del desempeño de un sistema de intercambio','Evaluación','Pasantía','2022-11-30','2023-05-19','Bogotá','1'),
('Reparaciones de filtraciones y grietas', 'Reparación','Pasantía','2022-11-30','2023-05-19','Bogotá','1');

INSERT INTO pasantia (ESTUDIANTE, TITULO, OBJETIVO_GENERAL, INTRODUCCION, JUSTIFICACION, APLICACION_APORTE, CONTRATACION_INTENCION, DURACION, RESPONSABLE, DOCENTE_DIRECTOR) VALUES
('1', 'Programa de mantenimiento de 200 horas', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', (datediff('2023-05-19','2022-11-30')/7), '1', '1'),
('1', 'Programa de mantenimiento de 200 horas', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '8', '1', '1'),
('2', 'Traduccion del manial de normas y procedimientos', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '1', '8', '1', '2'),
('3', 'Evaluacion del desempeño de un sistema de intercambio', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '8', '1', '3'),
('4', 'Reparaciones de filtraciones y Grietas en el ', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', '0', '16', '1', '4');

Insert into verificacion (PASANTIA, COMITE, ACTA, CONSECUTIVO, RESULTADO) values
('1','1','29','1','0'),
('1','1','29','1','1'),
('2','1','35','1','1'),
('3','1','36','1','1');