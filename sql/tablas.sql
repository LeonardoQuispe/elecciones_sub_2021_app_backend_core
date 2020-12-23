/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 11-sep.-2019 11:33:27 AM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS adm_usuario CASCADE
;

DROP TABLE IF EXISTS candidato CASCADE
;

DROP TABLE IF EXISTS circunscripcion CASCADE
;

DROP TABLE IF EXISTS conteo CASCADE
;

DROP TABLE IF EXISTS departamento CASCADE
;

DROP TABLE IF EXISTS det_circunscripcion_municipio CASCADE
;

DROP TABLE IF EXISTS det_conteo_partido CASCADE
;

DROP TABLE IF EXISTS Det_Usuario_Departamento CASCADE
;

DROP TABLE IF EXISTS det_usuario_recinto CASCADE
;

DROP TABLE IF EXISTS distrito CASCADE
;

DROP TABLE IF EXISTS estado_mesa CASCADE
;

DROP TABLE IF EXISTS imagen_acta CASCADE
;

DROP TABLE IF EXISTS localidad_seccion CASCADE
;

DROP TABLE IF EXISTS mesa CASCADE
;

DROP TABLE IF EXISTS municipio CASCADE
;

DROP TABLE IF EXISTS pais CASCADE
;

DROP TABLE IF EXISTS partido CASCADE
;

DROP TABLE IF EXISTS plataforma CASCADE
;

DROP TABLE IF EXISTS provincia CASCADE
;

DROP TABLE IF EXISTS recinto CASCADE
;

DROP TABLE IF EXISTS tipo_candidato CASCADE
;

DROP TABLE IF EXISTS tipo_conteo CASCADE
;

/* Create Tables */

CREATE TABLE adm_usuario
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	apellido_paterno varchar NULL,
	apellido_materno varchar NULL,
	carnet_identidad varchar NULL,
	telefono1 varchar NULL,
	telefono2 varchar NULL,
	correo varchar NULL,
	cuenta varchar NOT NULL,
	contrasena varchar NOT NULL,
	tipo smallint NOT NULL,
	genero varchar(1) NOT NULL,
	hash bytea NULL,
	salt bytea NULL,
	id_rol bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NOT NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE candidato
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	apellido_paterno varchar NOT NULL,
	apellido_materno varchar NOT NULL,
	id_tipo_candidato bigint NOT NULL,
	id_circunscripcion bigint NULL,
	id_partido bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE circunscripcion
(
	id bigint NOT NULL,
	codigo_oep varchar(50) NULL,
	nombre varchar(50) NOT NULL,
	id_usuario bigint NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(50) NOT NULL
)
;

CREATE TABLE conteo
(
	id bigint NOT NULL,
	votos_validos integer NOT NULL,
	votos_nulos integer NOT NULL,
	votos_blancos integer NOT NULL,
	observacion varchar NOT NULL,
	id_mesa bigint NOT NULL,
	id_tipo_conteo bigint NOT NULL,
	id_imagen_acta bigint NULL,
	id_plataforma bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE departamento
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	id_pais bigint NOT NULL,
	id_usuario bigint NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE det_circunscripcion_municipio
(
	id bigint NOT NULL,
	id_circunscripcion bigint NOT NULL,
	id_municipio bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE det_conteo_partido
(
	id bigint NOT NULL,
	id_conteo bigint NOT NULL,
	id_partido bigint NOT NULL,
	total_voto integer NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE Det_Usuario_Departamento
(
	id bigint NOT NULL,
	id_usuario bigint NOT NULL,
	id_departamento bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NOT NULL,
	estado varchar(50) NOT NULL
)
;

CREATE TABLE det_usuario_recinto
(
	id bigint NOT NULL,
	id_usuario bigint NOT NULL,
	id_recinto bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE distrito
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	id_municipio bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE estado_mesa
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE imagen_acta
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	tamano integer NOT NULL,
	content_type varchar NOT NULL,
	archivo bytea NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE localidad_seccion
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	id_municipio bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE mesa
(
	id bigint NOT NULL,
	codigo_corto_oep varchar NOT NULL,
	codigo_largo_oep varchar NOT NULL,
	numero_mesa integer NOT NULL,
	habilitados integer NOT NULL,
	total_papeletas_anfora integer NULL,
	total_habilitados_votaron integer NULL,
	bandera_apertura boolean NULL,
	fecha_hora_apertura timestamp without time zone NULL,
	bandera_usuario_asignado boolean NULL,
	observacion varchar NULL,
	id_recinto bigint NOT NULL,
	id_estado_mesa bigint NOT NULL,
	id_usuario bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE municipio
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	id_provincia bigint NOT NULL,
	id_usuario bigint NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE pais
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE partido
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE plataforma
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE provincia
(
	id bigint NOT NULL,
	codigo_oep varchar NULL,
	nombre varchar NOT NULL,
	id_departamento bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE recinto
(
	id bigint NOT NULL,
	codigo_oep varchar NOT NULL,
	nombre varchar NOT NULL,
	total_mesa integer NOT NULL,
	total_habilitado integer NOT NULL,
	id_municipio bigint NOT NULL,
	id_localidad_seccion bigint NULL,
	id_distrito bigint NULL,
	id_circunscripcion bigint NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar NOT NULL
)
;

CREATE TABLE tipo_candidato
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

CREATE TABLE tipo_conteo
(
	id bigint NOT NULL,
	nombre varchar NOT NULL,
	fecha_registro timestamp without time zone NOT NULL,
	fecha_modificacion timestamp without time zone NULL,
	estado varchar(2) NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE adm_usuario ADD CONSTRAINT PK_Usuario
	PRIMARY KEY (id)
;

ALTER TABLE candidato ADD CONSTRAINT PK_Candidato
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Candidato_Circunscripcion ON candidato (id_circunscripcion ASC)
;

CREATE INDEX IXFK_Candidato_Partido ON candidato (id_partido ASC)
;

CREATE INDEX IXFK_Candidato_Tipo_Candidato ON candidato (id_tipo_candidato ASC)
;

ALTER TABLE circunscripcion ADD CONSTRAINT PK_Circunscripcion
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_circunscripcion_usuario ON circunscripcion (id_usuario ASC)
;

ALTER TABLE conteo ADD CONSTRAINT PK_Conteo
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Conteo_Imagen_Acta ON conteo (id_imagen_acta ASC)
;

CREATE INDEX IXFK_Conteo_Mesa ON conteo (id_mesa ASC)
;

CREATE INDEX IXFK_Conteo_plataforma ON conteo (id_plataforma ASC)
;

CREATE INDEX IXFK_Conteo_Tipo_Conteo ON conteo (id_tipo_conteo ASC)
;

ALTER TABLE departamento ADD CONSTRAINT PK_Departamento
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Departamento_Pais ON departamento (id_pais ASC)
;

CREATE INDEX IXFK_departamento_usuario ON departamento (id_usuario ASC)
;

ALTER TABLE det_circunscripcion_municipio ADD CONSTRAINT PK_det_cicunscripcion_provincia
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_det_circunscripcion_municipio_circunscripcion ON det_circunscripcion_municipio (id_circunscripcion ASC)
;

CREATE INDEX IXFK_det_circunscripcion_municipio_municipio ON det_circunscripcion_municipio (id_municipio ASC)
;

ALTER TABLE det_conteo_partido ADD CONSTRAINT PK_Det_Conteo_Candidato
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Det_Conteo_Partido_Conteo ON det_conteo_partido (id_conteo ASC)
;

CREATE INDEX IXFK_Det_Conteo_Partido_Partido ON det_conteo_partido (id_partido ASC)
;

ALTER TABLE Det_Usuario_Departamento ADD CONSTRAINT PK_Table2
	PRIMARY KEY (id)
;

ALTER TABLE det_usuario_recinto ADD CONSTRAINT PK_Table2
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_det_usuario_recinto_recinto ON det_usuario_recinto (id_recinto ASC)
;

CREATE INDEX IXFK_det_usuario_recinto_usuario ON det_usuario_recinto (id_usuario ASC)
;

ALTER TABLE distrito ADD CONSTRAINT PK_Distrito
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_distrito_municipio ON distrito (id_municipio ASC)
;

ALTER TABLE estado_mesa ADD CONSTRAINT PK_estado_mesa
	PRIMARY KEY (id)
;

ALTER TABLE imagen_acta ADD CONSTRAINT PK_Imagen_Acta
	PRIMARY KEY (id)
;

ALTER TABLE localidad_seccion ADD CONSTRAINT PK_Localidad_Seccion
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_localidad_seccion_municipio ON localidad_seccion (id_municipio ASC)
;

ALTER TABLE mesa ADD CONSTRAINT PK_Mesa
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_mesa_estado_mesa ON mesa (id_estado_mesa ASC)
;

CREATE INDEX IXFK_mesa_recinto ON mesa (id_recinto ASC)
;

CREATE INDEX IXFK_mesa_usuario ON mesa (id_usuario ASC)
;

ALTER TABLE municipio ADD CONSTRAINT PK_Municipio
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Municipio_Provincia ON municipio (id_provincia ASC)
;

CREATE INDEX IXFK_municipio_usuario ON municipio (id_usuario ASC)
;

ALTER TABLE pais ADD CONSTRAINT PK_Pais
	PRIMARY KEY (id)
;

ALTER TABLE partido ADD CONSTRAINT PK_Partido
	PRIMARY KEY (id)
;

ALTER TABLE plataforma ADD CONSTRAINT PK_plataforma
	PRIMARY KEY (id)
;

ALTER TABLE provincia ADD CONSTRAINT PK_Provincia
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_Provincia_Departamento ON provincia (id_departamento ASC)
;

ALTER TABLE recinto ADD CONSTRAINT PK_Recinto
	PRIMARY KEY (id)
;

CREATE INDEX IXFK_recinto_Circunscripcion ON recinto (id_circunscripcion ASC)
;

CREATE INDEX IXFK_recinto_distrito ON recinto (id_distrito ASC)
;

CREATE INDEX IXFK_recinto_localidad_seccion ON recinto (id_localidad_seccion ASC)
;

CREATE INDEX IXFK_recinto_municipio ON recinto (id_municipio ASC)
;

ALTER TABLE tipo_candidato ADD CONSTRAINT PK_Tipo_Candidato
	PRIMARY KEY (id)
;

ALTER TABLE tipo_conteo ADD CONSTRAINT PK_Tipo_Conteo
	PRIMARY KEY (id)
;

/* Create Foreign Key Constraints */

ALTER TABLE candidato ADD CONSTRAINT FK_Candidato_Circunscripcion
	FOREIGN KEY (id_circunscripcion) REFERENCES circunscripcion (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE candidato ADD CONSTRAINT FK_Candidato_Tipo_Candidato
	FOREIGN KEY (id_tipo_candidato) REFERENCES tipo_candidato (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE circunscripcion ADD CONSTRAINT FK_circunscripcion_usuario
	FOREIGN KEY (id_usuario) REFERENCES adm_usuario (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE conteo ADD CONSTRAINT FK_Conteo_Imagen_Acta
	FOREIGN KEY (id_imagen_acta) REFERENCES imagen_acta (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE conteo ADD CONSTRAINT FK_Conteo_Mesa
	FOREIGN KEY (id_mesa) REFERENCES mesa (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE conteo ADD CONSTRAINT FK_Conteo_plataforma
	FOREIGN KEY (id_plataforma) REFERENCES plataforma (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE conteo ADD CONSTRAINT FK_Conteo_Tipo_Conteo
	FOREIGN KEY (id_tipo_conteo) REFERENCES tipo_conteo (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE departamento ADD CONSTRAINT FK_Departamento_Pais
	FOREIGN KEY (id_pais) REFERENCES pais (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE departamento ADD CONSTRAINT FK_departamento_usuario
	FOREIGN KEY (id_usuario) REFERENCES adm_usuario (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_circunscripcion_municipio ADD CONSTRAINT FK_det_circunscripcion_municipio_circunscripcion
	FOREIGN KEY (id_circunscripcion) REFERENCES circunscripcion (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_circunscripcion_municipio ADD CONSTRAINT FK_det_circunscripcion_municipio_municipio
	FOREIGN KEY (id_municipio) REFERENCES municipio (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_conteo_partido ADD CONSTRAINT FK_Det_Conteo_Partido_Conteo
	FOREIGN KEY (id_conteo) REFERENCES conteo (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_conteo_partido ADD CONSTRAINT FK_Det_Conteo_Partido_Partido
	FOREIGN KEY (id_partido) REFERENCES partido (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_usuario_recinto ADD CONSTRAINT FK_det_usuario_recinto_recinto
	FOREIGN KEY (id_recinto) REFERENCES recinto (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE det_usuario_recinto ADD CONSTRAINT FK_det_usuario_recinto_usuario
	FOREIGN KEY (id_usuario) REFERENCES adm_usuario (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE distrito ADD CONSTRAINT FK_distrito_municipio
	FOREIGN KEY (id_municipio) REFERENCES municipio (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE localidad_seccion ADD CONSTRAINT FK_localidad_seccion_municipio
	FOREIGN KEY (id_municipio) REFERENCES municipio (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE mesa ADD CONSTRAINT FK_mesa_estado_mesa
	FOREIGN KEY (id_estado_mesa) REFERENCES estado_mesa (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE mesa ADD CONSTRAINT FK_mesa_recinto
	FOREIGN KEY (id_recinto) REFERENCES recinto (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE mesa ADD CONSTRAINT FK_mesa_usuario
	FOREIGN KEY (id_usuario) REFERENCES adm_usuario (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE mesa ADD CONSTRAINT FK_Estado_Mesa
	FOREIGN KEY () REFERENCES  () ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE municipio ADD CONSTRAINT FK_Municipio_Provincia
	FOREIGN KEY (id_provincia) REFERENCES provincia (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE municipio ADD CONSTRAINT FK_municipio_usuario
	FOREIGN KEY (id_usuario) REFERENCES adm_usuario (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE provincia ADD CONSTRAINT FK_Provincia_Departamento
	FOREIGN KEY (id_departamento) REFERENCES departamento (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE recinto ADD CONSTRAINT FK_recinto_Circunscripcion
	FOREIGN KEY (id_circunscripcion) REFERENCES circunscripcion (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE recinto ADD CONSTRAINT FK_recinto_distrito
	FOREIGN KEY (id_distrito) REFERENCES distrito (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE recinto ADD CONSTRAINT FK_recinto_localidad_seccion
	FOREIGN KEY (id_localidad_seccion) REFERENCES localidad_seccion (id) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE recinto ADD CONSTRAINT FK_recinto_municipio
	FOREIGN KEY (id_municipio) REFERENCES municipio (id) ON DELETE No Action ON UPDATE No Action
;
