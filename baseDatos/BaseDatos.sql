CREATE DATABASE BaseDatos_Matriculacion;
USE BaseDatos_Matriculacion;


CREATE TABLE Usuario(
    usuario_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    usuario_cedula NVARCHAR(MAX),
    usuario_nombres NVARCHAR(MAX)
);


CREATE TABLE UsuarioPerfil(
    usuarioPerfil_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    usuarioPerfil_usuarioId INT,
    usuarioPerfil_perfilId INT,
    FOREIGN KEY(usuarioPerfil_usuarioId) REFERENCES Usuario(usuario_id),
    FOREIGN KEY(usuarioPerfil_perfilId) REFERENCES Perfil(perfil_id)
);

CREATE TABLE Perfil(
    perfil_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    perfil_descripcion NVARCHAR(MAX)
);

-- ===============================

CREATE TABLE Semestre(
    semestre_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    semestre_descripcion NVARCHAR(MAX)
);

CREATE TABLE SemestreMateria(
    semestreMateria_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    semestreMateria_semestreId INT,
    semestreMateria_materiaId INT,
    FOREIGN KEY(semestreMateria_semestreId) REFERENCES Semestre(semestre_id),
    FOREIGN KEY(semestreMateria_materiaId) REFERENCES Materia(materia_id)
);

CREATE TABLE Materia(
    materia_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    materia_descripcion NVARCHAR(MAX),
    materia_usuarioId INT,
    FOREIGN KEY(materia_usuarioId) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Matricula(
    matricula_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    matricula_usuarioId INT,
    matricula_semestreId INT,
    matricula_fecha DATE,
    FOREIGN KEY (matricula_usuarioId) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (matricula_semestreId) REFERENCES Semestre(semestre_id)
);

CREATE TABLE DetalleMatricula(
    detalleMatricula_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    detalleMatricula_matriculaId INT,
    detalleMatricula_semestreMateriaId INT,
    FOREIGN KEY (detalleMatricula_matriculaId) REFERENCES Matricula(matricula_id),
    FOREIGN KEY (detalleMatricula_semestreMateriaId) REFERENCES SemestreMateria(semestreMateria_id)
);

-- nombrePRoducto, precio unitario, cantidad en bodega -> tabla Producto
-- id, codigoFactura, fechaFactura, IdClient -> Factura
-- id, idCondigoFactura, idProducto, cantidadProducto, valor    Unitario, valorTotal -> detalle Factura

SELECT *
FROM