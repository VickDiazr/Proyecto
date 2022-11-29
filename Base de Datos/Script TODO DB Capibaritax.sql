drop table if exists VERIFICACION;
drop table if exists COMITE_ASESOR;
drop table if exists CRITERIO;
drop table if exists OBJETIVO_ESPECIFICO;
drop table if exists ACTIVIDAD;
drop table if exists EVALUACION;
drop table if exists PASANTIA;
drop table if exists ESTUDIANTE;
drop table if exists ESTADO;
drop table if exists DOCENTE;
drop table if exists RESPONSABLE;
drop table if exists PROGRAMA;
drop table if exists DEPARTAMENTO;
drop table if exists FACULTAD;
drop table if exists SEDE;
drop table if exists AREA;
drop table if exists CARGO;
drop table if exists EMPRESA;
drop table if exists USUARIO;
drop table if exists PERSONA;
drop table if exists JORNADA;
drop table if exists TIPO_ID;


/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   constraint PK_CARGO primary key clustered (ID)
);

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   constraint PK_AREA primary key clustered (ID)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
   CORREO               varchar(100)                   null,
   TELEFONO             varchar(100)                   null,
   CIUDAD               varchar(100)                   null,
   constraint PK_EMPRESA primary key clustered (ID)
);

/*==============================================================*/
/* Table: TIPO_ID                                               */
/*==============================================================*/
create table TIPO_ID 
(
   ID                   int                            not null AUTO_INCREMENT,
   NOMBRE               varchar(100)                   not null,
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
   NOMBRE               varchar(100)                   not null,
   CIUDAD               varchar(100)                   null,
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
   DEPARTAMENTO         int                            not null,
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
   NOMBRE               varchar(100)                   not null,
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
   ESTADO               int                            not null,
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
   DEPARTAMENTO         int                            not null,
   EXTENCION            int                            null,
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
   ESTUDIANTE           int                            not null,
   TITULO               varchar(100)                   null,
   OBJETIVO_GENERAL     varchar(100)                   null,
   INTRODUCCION         varchar(100)                   null,
   JUSTIFICACION        varchar(100)                   null,
   APLICACION_APORTE    varchar(100)                   null,
   CONTRATACION_INTENCION smallint                       null,
   DURACION             int                            null,
   RESPONSABLE          int                            null,
   DOCENTE_DIRECTOR     int                            null,
   FECHA                timestamp                      not null,
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


      --
-- Base de datos: `capibaritax`
--

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`ID`, `NOMBRE`) VALUES
(1, 'Ingeniería'),
(2, 'Contaduría'),
(3, 'Talento Humano'),
(4, 'Compras'),
(5, 'Presidencia');

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`ID`, `NOMBRE`) VALUES
(1, 'Gerente'),
(2, 'Asesor'),
(3, 'Auxiliar'),
(4, 'Asistente');

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`ID`, `NOMBRE`, `CORREO`, `TELEFONO`, `CIUDAD`) VALUES
(1, 'Samsung', 'gerencia@samsung.com', '8761234', 'bogotá'),
(2, 'LG', 'rrhh@lg.com', '2348761', 'soacha'),
(3, 'Amazon', 'servicio@amazon.com', '4581124', 'bogotá'),
(4, 'Metalrec S.A.S.', 'melalrec@gmail.com', '7518147', 'bogotá'),
(5, 'Softmec Ltda', 'gerencia@soflmec.com', '8447424', 'soacha');

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID`, `NOMBRE`) VALUES
(1, 'Activo'),
(2, 'Aplasado');

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`ID`, `NOMBRE`) VALUES
(1, 'Diurna'),
(2, 'Nocturna'),
(3, 'Mixta');

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`ID`, `NOMBRE`, `CIUDAD`) VALUES
(1, 'Bogotá', 'Bogotá'),
(2, 'Medellin', 'Medellin');

--
-- Volcado de datos para la tabla `tipo_id`
--

INSERT INTO `tipo_id` (`ID`, `NOMBRE`) VALUES
(1, 'Cedula de Ciudadanía'),
(2, 'Cedula de Extranjería'),
(3, 'Numero de Identificación Personal'),
(4, 'Numero de Identificación Tributaria'),
(5, 'Tarjeta de Identidad'),
(6, 'Pasaporte');

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`ID`, `NOMBRE`, `SEDE`) VALUES
(1, 'Ingeniería', 1),
(2, 'Ingeniería y Minas', 2);


--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID`, `NOMBRE`, `FACULTAD`) VALUES
(1, 'Ingeniería Civil y Agrícola', 1),
(2, 'Ingeniería de Sistemas e Industrial', 1),
(3, 'Ingeniería Eléctrica y Electrónica', 1),
(4, 'Ingeniería Mecánica', 1),
(5, 'Ingeniería Quimica y Ambiental', 1),
(6, 'Instrituto de Extensión e Investigación IEI', 1),
(7, 'Ingeniería Mecánica', 2),
(8, 'Procesos y Energía', 2),
(9, 'Ingeniería Civil', 2),
(10, 'Ciencias de la Computación y de la Decisión', 2),
(11, 'Departamento de Energía Eléctrica y Automática', 2);

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`ID`, `NOMBRE`, `JORNADA`, `DEPARTAMENTO`) VALUES
(1, 'Ingeniería de Sistemas y Computación', 3, 2),
(2, 'Ingeniería Mecatronica', 3, 4),
(3, 'Ingeniería de Petróleos', 3, 8),
(4, 'Ingeniería Mecánica', 1, 7);

--
-- Volcado de datos para la tabla `comite_asesor`
--

INSERT INTO `comite_asesor` (`ID`, `DESCRIPCION`, `PROGRAMA`) VALUES
(1, 'Comité Ingeniería de Sistemas', 1),
(2, 'Comité Ingeniería Mecanica', 1);

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ID`, `TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES
(1, 1, 'Bogotá', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', 'pendiente', 1),
(2, 5, 'Bogotá', 'Karen Tatiana', 'Alvarez Baez', 'kaalvarezb@unal.edu.co', 'pendiente', 0),
(3, 2, 'Bogotá', 'Diana Marcela', 'Bello Lopez', 'dbellol@unal.edu.co', 'pendiente', 1),
(4, 3, 'Bogotá', 'Camilo Andres', 'Cardenas Vargas', 'ccardenasv@unal.edu.co', 'pendiente', 1),
(5, 1, 'Soacha', 'Cristhian Yamith', 'Cely Oliveros', 'ccelyo@unal.edu.co', 'pendiente', 0),
(6, 4, 'Soacha', 'Cristian Liu', 'Chois Amaya', 'cchois@unal.edu.co', 'pendiente', 0),
(7, 1, 'Soacha', 'Fabian Humberto', 'Chaparro Aguilera', 'fchaparroa@unal.edu.co', 'pendiente', 1),
(8, 1, 'Bogotá', 'David Alejandro', ' Cifuentes Gonzalez', 'dcifuentesg@unal.edu.co', 'pendiente', 1),
(9, 5, 'Bogotá', 'Carlos Alberto', 'Cortes Ramirez', 'ccortesra@unal.edu.co', 'pendiente', 0),
(10, 2, 'Bogotá', 'Joel Esteban', 'Diaz Arevalo', 'jodiaza@unal.edu.co', 'pendiente', 1),
(11, 3, 'Bogotá', 'Victor Daniel', 'Diaz Reyes', 'vidiazr@unal.edu.co', 'pendiente', 1),
(12, 1, 'Soacha', 'Brayan Alejandro', 'Duarte Acevedo', 'bduartea@unal.edu.co', 'pendiente', 0),
(13, 4, 'Soacha', 'Obed Felipe', 'Espinosa Angarita', 'ofespinosaa@unal.edu.co', 'pendiente', 0),
(14, 1, 'Soacha', 'Esteban', 'Gomez Bermudez', 'esgomezb@unal.edu.co', 'pendiente', 1),
(15, 1, 'Bogotá', 'Javier', 'Rodriguez Gomez', 'jarodriguez@gmail.com', 'pendiente', 1),
(16, 1, 'Bogotá', 'Calina', 'Catalina Roz', 'catroz@gmail.com', 'pendiente', 1),
(17, 1, 'Soacha', 'Raul', 'Rodriguez', 'similar@gmail.com', 'pendiente', 1),
(18, 1, 'Soacha', 'Nicolas', 'Ruiz Garzon', 'nic@gmail.com', 'pendiente', 0);

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`ID`, `PERSONA_ID`, `EMPRESA`, `CARGO`, `AREA`) VALUES
(1, 15, 1, 2, 5),
(2, 16, 2, 3, 2),
(3, 17, 3, 1, 5),
(4, 18, 4, 4, 3);
--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`ID`, `PERSONA_ID`, `PROGRAMA_ID`, `AVANCE`, `ESTADO`) VALUES
(2, 1, 1, 20, 1),
(3, 2, 1, 50, 1),
(4, 3, 1, 80, 2),
(5, 4, 1, 90, 1),
(6, 5, 1, 90, 2);

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`ID`, `PERSONA_ID`, `DEPARTAMENTO`, `EXTENCION`) VALUES
(1, 6, 2, 1001),
(2, 7, 2, 1002),
(3, 8, 1, 1003),
(4, 9, 2, 1004),
(5, 10, 3, 1005);

--
-- Volcado de datos para la tabla `pasantia`
--

INSERT INTO `pasantia` (`ID`, `ESTUDIANTE`, `TITULO`, `OBJETIVO_GENERAL`, `INTRODUCCION`, `JUSTIFICACION`, `APLICACION_APORTE`, `CONTRATACION_INTENCION`, `DURACION`, `RESPONSABLE`, `DOCENTE_DIRECTOR`, `FECHA`) VALUES
(1, 2, 'Programa de mantenimiento de 200 horas', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', 0, 8, 1, 2, '2022-11-19 21:37:37'),
(2, 3, 'Traduccion del manial de normas y procedimientos', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', 1, 8, 2, 2, '2022-11-10 05:00:00'),
(3, 4, 'Evaluacion del desempeño de un sistema de intercambio', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', 0, 8, 3, 3, '2022-10-15 05:00:00'),
(4, 5, 'Reparaciones de filtraciones y Grietas en el ', 'Desarollo del yonoseque con el sisecuando automatizando el abc', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', 'Lorem ipsum dolor sit amet.', 0, 16, 4, 4, '2022-11-19 05:00:00');

--
-- Volcado de datos para la tabla `objetivo_especifico`
--

INSERT INTO `objetivo_especifico` (`ID`, `PASANTIA`, `DESCRIPCION`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales quis lorem id convallis'),
(2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales quis lorem id convallis');

--
-- Volcado de datos para la tabla `criterio`
--

INSERT INTO `criterio` (`ID`, `PASANTIA`, `PORCENTAJE`, `DESCRIPCION`) VALUES
(1, 1, 20, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.'),
(2, 1, 40, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.'),
(3, 1, 35, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.'),
(4, 1, 5, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.');


--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`ID`, `PASANTIA`, `DESCRIPCION`, `SEMANA_INICIO`, `SEMANA_FIN`) VALUES
(1, 1, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 1, 3),
(2, 1, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 3, 4),
(3, 1, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 4, 5),
(4, 1, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 6, 7),
(5, 1, 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 7, 8);

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`NOMBRE`, `CONTRASENA`, `PERSONA`) VALUES
('Cristian', '1234', 6),
('Diana', '1234', 3),
('Javier', '1234', 15),
('Nicolas', '1234', 1),
('Tatiana', '1234', 2),
('Victor', '1234', 11);


--
-- Volcado de datos para la tabla `verificacion`
--

INSERT INTO `verificacion` (`ID`, `PASANTIA`, `COMITE`, `ACTA`, `CONSECUTIVO`, `FECHA`, `RESULTADO`) VALUES
(1, 1, 1, 1, 1, '2022-10-01 05:00:00', 1),
(2, 2, 1, 1, 1, '2022-10-01 05:00:00', 1);

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`ID`, `PASANTIA`, `RESPONSABLE`, `FECHA`) VALUES
(1, 1, 1, '2022-10-19 05:00:00'),
(2, 2, 2, '2022-11-01 05:00:00'),
(3, 3, 3, '2022-11-15 05:00:00');