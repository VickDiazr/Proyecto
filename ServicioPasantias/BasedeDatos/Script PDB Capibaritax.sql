
/*==============================================================*/
/* Table: TIPO_ID                                                 */
/*==============================================================*/
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Cedula de Ciudadanía');
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Cedula de Extranjería');
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Numero de Identificación Personal');
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Numero de Identificación Tributaria');
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Tarjeta de Identidad');
INSERT INTO `capibaritax`.`tipo_id` (`NOMBRE`) VALUES ('Pasaporte');

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Bogotá', 'Sergio Nicolas', 'Siabatto Cleves', 'ssiabatto@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('5', 'Bogotá', 'Karen Tatiana', 'Alvarez Baez', 'kaalvarezb@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('2', 'Bogotá', 'Diana Marcela', 'Bello Lopez', 'dbellol@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('3', 'Bogotá', 'Camilo Andres', 'Cardenas Vargas', 'ccardenasv@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Soacha', 'Cristhian Yamith', 'Cely Oliveros', 'ccelyo@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('4', 'Soacha', 'Cristian Liu', 'Chois Amaya', 'cchois@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Soacha', 'Fabian Humberto', 'Chaparro Aguilera', 'fchaparroa@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Bogotá', 'David Alejandro', ' Cifuentes Gonzalez', 'fchaparroa@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('5', 'Bogotá', 'Carlos Alberto', 'Cortes Ramirez', 'ccortesra@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('2', 'Bogotá', 'Joel Esteban', 'Diaz Arevalo', 'jodiaza@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('3', 'Bogotá', 'Victor Daniel', 'Diaz Reyes', 'vidiazr@unal.edu.co', 'pendiente', '1');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Soacha', 'Brayan Alejandro', 'Duarte Acevedo', 'bduartea@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('4', 'Soacha', 'Obed Felipe', 'Espinosa Angarita', 'ofespinosaa@unal.edu.co', 'pendiente', '0');
INSERT INTO `capibaritax`.`persona` (`TIPO_ID`, `LUGAR_EXP_ID`, `NOMBRE`, `APELLIDO`, `CORREO`, `TELEFONO`, `FIRMA`) VALUES ('1', 'Soacha', 'Esteban', 'Gomez Bermudez', 'esgomezb@unal.edu.co', 'pendiente', '1');

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('1', 'Nico', '1234');
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('2', 'Tatiana', '2345');
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('3', 'Diana', '3456');
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('5', 'Yamith', '5678');
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('6', 'Liu', '6789');
INSERT INTO `capibaritax`.`usuario` (`PERSONA`, `NOMBRE`, `CONTRASENA`) VALUES ('4', 'Andres', '7890');

/*==============================================================*/
/* Table: CARGO                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`cargo` (`NOMBRE`) VALUES ('Gerente');
INSERT INTO `capibaritax`.`cargo` (`NOMBRE`) VALUES ('Asesor');
INSERT INTO `capibaritax`.`cargo` (`NOMBRE`) VALUES ('Auxiliar');
INSERT INTO `capibaritax`.`cargo` (`NOMBRE`) VALUES ('Asistente');

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`empresa` (`NOMBRE`, `CORREO`, `TELEFONO`, `CIUDAD`) VALUES ('samsung', 'samsumg@gmail.com', '8761234', 'bogotá');
INSERT INTO `capibaritax`.`empresa` (`NOMBRE`, `CORREO`, `TELEFONO`, `CIUDAD`) VALUES ('LG', 'LG@gmail.com', '2348761', 'soacha');

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
INSERT INTO `capibaritax`.`area` (`NOMBRE`) VALUES ('Ingeniería');
INSERT INTO `capibaritax`.`area` (`NOMBRE`) VALUES ('Contaduría');
INSERT INTO `capibaritax`.`area` (`NOMBRE`) VALUES ('Talento Humano');
INSERT INTO `capibaritax`.`area` (`NOMBRE`) VALUES ('Compras');
INSERT INTO `capibaritax`.`area` (`NOMBRE`) VALUES ('Presidencia');

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/ 
INSERT INTO `capibaritax`.`responsable` (`PERSONA_ID`, `EMPRESA`, `CARGO`, `AREA`) VALUES ('2', '1', '2', '5');
INSERT INTO `capibaritax`.`responsable` (`PERSONA_ID`, `EMPRESA`, `CARGO`, `AREA`) VALUES ('5', '2', '3', '2');

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
INSERT INTO `capibaritax`.`departamento` (`NOMBRE`) VALUES ('Ingeniería');
INSERT INTO `capibaritax`.`departamento` (`NOMBRE`) VALUES ('Humanas');
INSERT INTO `capibaritax`.`departamento` (`NOMBRE`) VALUES ('Ciencias');

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
INSERT INTO `capibaritax`.`sede` (`NOMBRE`, `CIUDAD`) VALUES ('Bogotá', 'Bogotá');
INSERT INTO `capibaritax`.`sede` (`NOMBRE`, `CIUDAD`) VALUES ('Medellin', 'Medellin');

/*==============================================================*/
/* Table: JORNADA                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`jornada` (`NOMBRE`) VALUES ('Diurna');
INSERT INTO `capibaritax`.`jornada` (`NOMBRE`) VALUES ('Nocturna');
INSERT INTO `capibaritax`.`jornada` (`NOMBRE`) VALUES ('Mixta');

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
INSERT INTO `capibaritax`.`programa` (`NOMBRE`, `SEDE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('Ingeniería de Sistemas y Computación', '1', '3', '1');
INSERT INTO `capibaritax`.`programa` (`NOMBRE`, `SEDE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('Ingeniería de Petróleos', '2', '3', '1');
INSERT INTO `capibaritax`.`programa` (`NOMBRE`, `SEDE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('Ingeniería Ambiental', '2', '3', '1');
INSERT INTO `capibaritax`.`programa` (`NOMBRE`, `SEDE`, `JORNADA`, `DEPARTAMENTO`) VALUES ('Ingeniería Mecatronia', '1', '3', '1');

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`docente` (`PERSONA_ID`, `PROGRAMA`, `EXTENCION`) VALUES ('1', '1', '1234');
INSERT INTO `capibaritax`.`docente` (`PERSONA_ID`, `PROGRAMA`, `EXTENCION`) VALUES ('3', '1', '4321');
INSERT INTO `capibaritax`.`docente` (`PERSONA_ID`, `PROGRAMA`, `EXTENCION`) VALUES ('8', '1', '2345');
INSERT INTO `capibaritax`.`docente` (`PERSONA_ID`, `PROGRAMA`, `EXTENCION`) VALUES ('10', '1', '5432');

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
INSERT INTO `capibaritax`.`estado` (`NOMBRE`) VALUES ('Activo');
INSERT INTO `capibaritax`.`estado` (`NOMBRE`) VALUES ('Aplasado');

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
INSERT INTO `capibaritax`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`, `AVANCE`, `ESTADO`) VALUES ('4', '1', '20', '1');
INSERT INTO `capibaritax`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`, `AVANCE`, `ESTADO`) VALUES ('6', '1', '50', '1');
INSERT INTO `capibaritax`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`, `AVANCE`, `ESTADO`) VALUES ('7', '1', '80', '2');
INSERT INTO `capibaritax`.`estudiante` (`PERSONA_ID`, `PROGRAMA_ID`, `AVANCE`, `ESTADO`) VALUES ('9', '1', '90', '1');

/*==============================================================*/
/* Table: REGISTRO_PASANTIA                                     */
/*==============================================================*/
INSERT INTO `capibaritax`.`registro_pasantia` (`ESTUDIANTE`, `TITULO`, `OBJETIVO_GENERAL`, `INTRODUCCION`, `JUSTIFICACION`, `APLICACION_APORTE`, `CONTRATACION_INTENCION`, `DURACION`, `RESPONSABLE`, `DOCENTE_DIRECTOR`) VALUES ('1', 'Programa de mantenimiento de 200 horas', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', '16', '1', '2');
INSERT INTO `capibaritax`.`registro_pasantia` (`ESTUDIANTE`, `TITULO`, `OBJETIVO_GENERAL`, `INTRODUCCION`, `JUSTIFICACION`, `APLICACION_APORTE`, `CONTRATACION_INTENCION`, `DURACION`, `RESPONSABLE`, `DOCENTE_DIRECTOR`) VALUES ('2', 'Traduccion del manial de normas y procedimientos', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', '8', '2', '2');
INSERT INTO `capibaritax`.`registro_pasantia` (`ESTUDIANTE`, `TITULO`, `OBJETIVO_GENERAL`, `INTRODUCCION`, `JUSTIFICACION`, `APLICACION_APORTE`, `CONTRATACION_INTENCION`, `DURACION`, `RESPONSABLE`, `DOCENTE_DIRECTOR`) VALUES ('3', 'Evaluacion del desempeño de un sistema de intercambio', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', '8', '1', '1');
INSERT INTO `capibaritax`.`registro_pasantia` (`ESTUDIANTE`, `TITULO`, `OBJETIVO_GENERAL`, `INTRODUCCION`, `JUSTIFICACION`, `APLICACION_APORTE`, `CONTRATACION_INTENCION`, `DURACION`, `RESPONSABLE`, `DOCENTE_DIRECTOR`) VALUES ('4', 'Reparaciones de filtraciones y Grietas en el ', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', 'Morbi et augue in mi pharetra ultricies. Mauris id est ut justo semper elementum.', '16', '2', '1');

/*==============================================================*/
/* Table: PASANTE                                               */
/*==============================================================*/
INSERT INTO `capibaritax`.`pasante` (`ESTUDIANTE`, `REGISTRO`) VALUES ('1', '1');
INSERT INTO `capibaritax`.`pasante` (`ESTUDIANTE`, `REGISTRO`) VALUES ('2', '2');
INSERT INTO `capibaritax`.`pasante` (`ESTUDIANTE`, `REGISTRO`) VALUES ('4', '4');

/*==============================================================*/
/* Table: EVALUACION                                            */
/*==============================================================*/

