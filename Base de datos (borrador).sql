
DROP DATABASE IF EXISTS fis_cartagena;
CREATE DATABASE fis_cartagena;
USE fis_cartagena;

-- 1. Tabla de becas
CREATE TABLE becas (
    id_beca INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

INSERT INTO becas (id_beca, nombre, descripcion) VALUES
(1, 'Beca Musical', 'Apoyo económico para estudiantes de música'),
(2, 'Beca Académica', 'Reconocimiento por rendimiento académico'),
(3, 'Beca de Transporte', 'Ayuda para gastos de transporte'),
(4, 'Beca Alimentaria', 'Subsidio de alimentación durante el semestre');

-- 2. Tabla de instrumentos
CREATE TABLE instrumentos (
    id_instrumento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE
);

INSERT INTO instrumentos (nombre) VALUES
('Clarinete'),
('Oboe'),
('Arpa'),
('Composición'),
('Improvisación'),
('Trombón'),
('Piano Jazz'),
('Violín Eléctrico'),
('Tecnología Musical'),
('Historia de la Música');

-- 3. Tabla de usuarios (estudiantes y profesores)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    rol VARCHAR(50),
    id_beca INT,
    id_instrumento INT,
    FOREIGN KEY (id_beca) REFERENCES becas(id_beca),
    FOREIGN KEY (id_instrumento) REFERENCES instrumentos(id_instrumento)
);

-- Insertar estudiantes (sin instrumento)
INSERT INTO usuarios (nombre, correo, rol, id_beca, id_instrumento) VALUES
('Braian Heladio', 'braianheladio@fis.com', 'estudiante', 1, NULL),
('Claudia Magnolia', 'magnolia@fis.com', 'estudiante', 2, NULL),
('Paula Rivas', 'paula@fis.com', 'estudiante', 3, NULL),
('Nicolás Duarte', 'nicolas@fis.com', 'estudiante', 4, NULL),
('Gabriela Vargas', 'gabriela@fis.com', 'estudiante', 1, NULL),
('Tomás Peña', 'tomas@fis.com', 'estudiante', 2, NULL),
('Camila Suárez', 'camila@fis.com', 'estudiante', 3, NULL),
('Juliana Torres', 'juliana@fis.com', 'estudiante', 4, NULL),
('Emilio Moreno', 'emilio@fis.com', 'estudiante', 1, NULL),
('Renata Salazar', 'renata@fis.com', 'estudiante', 2, NULL),
('Samuel Ortiz', 'samuel@fis.com', 'estudiante', NULL, NULL),
('Luciana Paredes', 'luciana@fis.com', 'estudiante', NULL, NULL);

-- Insertar profesores
INSERT INTO usuarios (nombre, correo, rol, id_beca, id_instrumento) VALUES
('Mariana Torres', 'mariana@fis.com', 'profesor', NULL, 1),
('Jorge Salinas', 'jorge@fis.com', 'profesor', NULL, 2),
('Daniela Acosta', 'daniela@fis.com', 'profesor', NULL, 3),
('Ricardo Méndez', 'ricardo@fis.com', 'profesor', NULL, 4),
('Laura Ríos', 'laura@fis.com', 'profesor', NULL, 5),
('Diego Cárdenas', 'diego@fis.com', 'profesor', NULL, 6),
('Ángela Pérez', 'angela@fis.com', 'profesor', NULL, 7),
('Felipe Gutiérrez', 'felipe@fis.com', 'profesor', NULL, 8),
('Tatiana Lozano', 'tatiana@fis.com', 'profesor', NULL, 9),
('Leonardo Reyes', 'leonardo@fis.com', 'profesor', NULL, 10);

-- 4. Tabla de clases
CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    horario VARCHAR(50),
    salon VARCHAR(50),
    FOREIGN KEY (id_profesor) REFERENCES usuarios(id_usuario)
);

-- 5. Tabla de inscripciones (estudiantes en clases)
CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_clase INT,
    id_estudiante INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
    FOREIGN KEY (id_estudiante) REFERENCES usuarios(id_usuario)
);

-- 6. Tabla de asistencia
CREATE TABLE asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_inscripcion INT,
    fecha DATE,
    presente BOOLEAN,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);

-- 7. Tabla de evaluaciones
CREATE TABLE evaluaciones (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    id_inscripcion INT,
    descripcion VARCHAR(100),
    calificacion DECIMAL(4,2),
    fecha DATE,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);

-- 8. Tabla de instrumentos asignados a usuarios
CREATE TABLE instrumentos_asignados (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_instrumento INT,
    fecha_entrega DATE,
    estado VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_instrumento) REFERENCES instrumentos(id_instrumento)
);

