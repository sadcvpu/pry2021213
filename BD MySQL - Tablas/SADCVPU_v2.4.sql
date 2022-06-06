-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-13 04:49:05.233

-- tables
-- Table: actividades
CREATE TABLE actividades (
    id_actividad int NOT NULL AUTO_INCREMENT,
    nom_actividad varchar(100) NOT NULL,
    descripcion text NOT NULL,
    id_psicologo int NOT NULL,
    variable varchar(50) NOT NULL,
    fecha date NULL,
    CONSTRAINT actividades_pk PRIMARY KEY (id_actividad)
);

-- Table: alumno
CREATE TABLE alumno (
    id_alumno int NOT NULL AUTO_INCREMENT,
    carrera varchar(50) NOT NULL,
    edad int NOT NULL,
    ciclo varchar(25) NOT NULL,
    nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    contrasena varchar(50) NOT NULL,
    sexo varchar(25) NOT NULL,
    sede varchar(50) NOT NULL,
    CONSTRAINT alumno_pk PRIMARY KEY (id_alumno)
);

-- Table: alumno_escala
CREATE TABLE alumno_escala (
    id_alumno_escala int NOT NULL AUTO_INCREMENT,
    id_escala int NOT NULL,
    Ddesarrollo date NOT NULL,
    puntaje int NOT NULL,
    nivel_variable varchar(50) NOT NULL,
    id_alumno int NOT NULL,
    CONSTRAINT alumno_escala_pk PRIMARY KEY (id_alumno_escala)
);

-- Table: escala
CREATE TABLE escala (
    id_escala int NOT NULL AUTO_INCREMENT,
    nom_escala varchar(25) NOT NULL,
    nom_variable varchar(25) NOT NULL,
    descripcion text NULL,
    CONSTRAINT escala_pk PRIMARY KEY (id_escala)
);

-- Table: horario
CREATE TABLE horario (
    id_horario int NOT NULL AUTO_INCREMENT,
    dia date NOT NULL,
    h_inicio time NOT NULL,
    h_fin time NOT NULL,
    id_psicologo int NOT NULL,
    estado bool NOT NULL,
    CONSTRAINT horario_pk PRIMARY KEY (id_horario)
);

-- Table: psicologo
CREATE TABLE psicologo (
    id_psicologo int NOT NULL AUTO_INCREMENT,
    num_colegiado int NOT NULL,
    nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    contrasena varchar(50) NOT NULL,
    sede varchar(50) NOT NULL,
    CONSTRAINT psicologo_pk PRIMARY KEY (id_psicologo)
);

-- Table: reserva_cita
CREATE TABLE reserva_cita (
    id_reserva int NOT NULL AUTO_INCREMENT,
    dia date NOT NULL,
    hora time NOT NULL,
    id_psicologo int NOT NULL,
    id_alumno int NOT NULL,
    CONSTRAINT reserva_cita_pk PRIMARY KEY (id_reserva)
);

-- foreign keys
-- Reference: Alumno_Escala_Escala (table: alumno_escala)
ALTER TABLE alumno_escala ADD CONSTRAINT Alumno_Escala_Escala FOREIGN KEY Alumno_Escala_Escala (id_escala)
    REFERENCES escala (id_escala);

-- Reference: actividades_psicologo (table: actividades)
ALTER TABLE actividades ADD CONSTRAINT actividades_psicologo FOREIGN KEY actividades_psicologo (id_psicologo)
    REFERENCES psicologo (id_psicologo);

-- Reference: alumno_escala_alumno (table: alumno_escala)
ALTER TABLE alumno_escala ADD CONSTRAINT alumno_escala_alumno FOREIGN KEY alumno_escala_alumno (id_alumno)
    REFERENCES alumno (id_alumno);

-- Reference: horario_psicologo (table: horario)
ALTER TABLE horario ADD CONSTRAINT horario_psicologo FOREIGN KEY horario_psicologo (id_psicologo)
    REFERENCES psicologo (id_psicologo);

-- Reference: reserva_cita_alumno (table: reserva_cita)
ALTER TABLE reserva_cita ADD CONSTRAINT reserva_cita_alumno FOREIGN KEY reserva_cita_alumno (id_alumno)
    REFERENCES alumno (id_alumno);

-- Reference: reserva_cita_psicologo (table: reserva_cita)
ALTER TABLE reserva_cita ADD CONSTRAINT reserva_cita_psicologo FOREIGN KEY reserva_cita_psicologo (id_psicologo)
    REFERENCES psicologo (id_psicologo);

-- End of file.

