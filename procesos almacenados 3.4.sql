DELIMITER //
CREATE PROCEDURE sp_tipo_usuario_insertar(
    IN t_descripcion VARCHAR(100),
    IN t_nombre VARCHAR(20)
)
BEGIN
    INSERT INTO tipo_usuario(descripcion_tipo, nombre_tipo, deleted)
    VALUES (t_descripcion, t_nombre, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tipo_usuario_borrado_logico(
    IN t_id INT
)
BEGIN
    UPDATE tipo_usuario
    SET deleted = 1
    WHERE id_tipo_usuario = t_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tipo_usuario_listar_activos()
BEGIN
    SELECT id_tipo_usuario, descripcion_tipo, nombre_tipo
    FROM tipo_usuario
    WHERE deleted = 0
    ORDER BY nombre_tipo;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tipo_usuario_listar_todo()
BEGIN
    SELECT id_tipo_usuario, descripcion_tipo, nombre_tipo, deleted
    FROM tipo_usuario
    ORDER BY nombre_tipo;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_usuario_insertar(
    IN u_nombre VARCHAR(50),
    IN u_contraseña VARCHAR(25),
    IN u_tipo_usuario_id INT
)
BEGIN
    INSERT INTO usuario(nombre_usuario, contraseña, tipo_usuario_id, deleted)
    VALUES (u_nombre, u_contraseña, u_tipo_usuario_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_borrado_logico(
    IN u_id INT
)
BEGIN
    UPDATE usuario
    SET deleted = 1
    WHERE id_usuario = u_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_listar_activos()
BEGIN
    SELECT id_usuario, nombre_usuario, tipo_usuario_id
    FROM usuario
    WHERE deleted = 0
    ORDER BY nombre_usuario;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_usuario_listar_todo()
BEGIN
    SELECT id_usuario, nombre_usuario, tipo_usuario_id, deleted
    FROM usuario
    ORDER BY nombre_usuario;
END//
DELIMITER ;
-- ------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_registro_personas_insertar(
    IN r_rut INT,
    IN r_email VARCHAR(50),
    IN r_numero_telefono INT,
    IN r_direccion VARCHAR(50),
    IN r_usuario_id INT
)
BEGIN
    INSERT INTO registro_personas(rut, email, numero_telefono, direccion, usuario_id_usuario, deleted)
    VALUES (r_rut, r_email, r_numero_telefono, r_direccion, r_usuario_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_personas_borrado_logico(
    IN r_rut INT
)
BEGIN
    UPDATE registro_personas
    SET deleted = 1
    WHERE rut = r_rut;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_personas_listar_activos()
BEGIN
    SELECT rut, email, numero_telefono, direccion, usuario_id_usuario
    FROM registro_personas
    WHERE deleted = 0
    ORDER BY rut;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_personas_listar_todo()
BEGIN
    SELECT rut, email, numero_telefono, direccion, usuario_id_usuario, deleted
    FROM registro_personas
    ORDER BY rut;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_estado_paciente_insertar(
    IN e_calificacion TINYINT,
    IN e_rut INT,
    IN e_usuario_id INT
)
BEGIN
    INSERT INTO estado_paciente(calificacion, registro_personas_rut, registro_personas_usuario_id_usuario, deleted)
    VALUES (e_calificacion, e_rut, e_usuario_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_paciente_borrado_logico(
    IN e_id INT
)
BEGIN
    UPDATE estado_paciente
    SET deleted = 1
    WHERE id_estado_paciente = e_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_paciente_listar_activos()
BEGIN
    SELECT id_estado_paciente, calificacion, registro_personas_rut, registro_personas_usuario_id_usuario
    FROM estado_paciente
    WHERE deleted = 0
    ORDER BY id_estado_paciente;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_estado_paciente_listar_todo()
BEGIN
    SELECT id_estado_paciente, calificacion, registro_personas_rut, registro_personas_usuario_id_usuario, deleted
    FROM estado_paciente
    ORDER BY id_estado_paciente;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_registro_doctor_insertar(
    IN d_rut INT,
    IN d_nombre VARCHAR(45),
    IN d_fecha_nacimiento DATE
)
BEGIN
    INSERT INTO registro_doctor(rut_doctor, nombre_doctor, fecha_nacimiento_doctor, deleted)
    VALUES (d_rut, d_nombre, d_fecha_nacimiento, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_doctor_borrado_logico(
    IN d_rut INT
)
BEGIN
    UPDATE registro_doctor
    SET deleted = 1
    WHERE rut_doctor = d_rut;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_doctor_listar_activos()
BEGIN
    SELECT rut_doctor, nombre_doctor, fecha_nacimiento_doctor
    FROM registro_doctor
    WHERE deleted = 0
    ORDER BY nombre_doctor;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registro_doctor_listar_todo()
BEGIN
    SELECT rut_doctor, nombre_doctor, fecha_nacimiento_doctor, deleted
    FROM registro_doctor
    ORDER BY nombre_doctor;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_tratamiento_medico_insertar(
    IN t_id INT,
    IN t_rut_persona INT,
    IN t_usuario_id INT,
    IN t_rut_doctor INT
)
BEGIN
    INSERT INTO tratamiento_medico(id_tratamiento_medico, registro_personas_rut, registro_personas_usuario_id_usuario, registro_doctor_rut_doctor, deleted)
    VALUES (t_id, t_rut_persona, t_usuario_id, t_rut_doctor, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tratamiento_medico_borrado_logico(
    IN t_id INT
)
BEGIN
    UPDATE tratamiento_medico
    SET deleted = 1
    WHERE id_tratamiento_medico = t_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tratamiento_medico_listar_activos()
BEGIN
    SELECT id_tratamiento_medico, registro_personas_rut, registro_personas_usuario_id_usuario, registro_doctor_rut_doctor
    FROM tratamiento_medico
    WHERE deleted = 0
    ORDER BY id_tratamiento_medico;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_tratamiento_medico_listar_todo()
BEGIN
    SELECT id_tratamiento_medico, registro_personas_rut, registro_personas_usuario_id_usuario, registro_doctor_rut_doctor, deleted
    FROM tratamiento_medico
    ORDER BY id_tratamiento_medico;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_medicamentos_insertar(
    IN m_id INT,
    IN m_nombre VARCHAR(50),
    IN m_descripcion VARCHAR(100),
    IN m_dosis VARCHAR(20),
    IN m_tratamiento_id INT
)
BEGIN
    INSERT INTO medicamentos(id_tratamiento_medico, medicamentos, descripcion_medicamento, dosis, tratamiento_medico_id_tratamiento_medico, deleted)
    VALUES (m_id, m_nombre, m_descripcion, m_dosis, m_tratamiento_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_medicamentos_borrado_logico(
    IN m_id INT
)
BEGIN
    UPDATE medicamentos
    SET deleted = 1
    WHERE id_tratamiento_medico = m_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_medicamentos_listar_activos()
BEGIN
    SELECT id_tratamiento_medico, medicamentos, descripcion_medicamento, dosis, tratamiento_medico_id_tratamiento_medico
    FROM medicamentos
    WHERE deleted = 0
    ORDER BY medicamentos;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_medicamentos_listar_todo()
BEGIN
    SELECT id_tratamiento_medico, medicamentos, descripcion_medicamento, dosis, tratamiento_medico_id_tratamiento_medico, deleted
    FROM medicamentos
    ORDER BY medicamentos;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_genero_insertar(
    IN g_id INT,
    IN g_nombre VARCHAR(45),
    IN g_descripcion VARCHAR(100),
    IN g_rut INT,
    IN g_usuario_id INT
)
BEGIN
    INSERT INTO genero(id_genero, nombre_genero, descripcion_genero, registro_personas_rut, registro_personas_usuario_id_usuario, deleted)
    VALUES (g_id, g_nombre, g_descripcion, g_rut, g_usuario_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_borrado_logico(
    IN g_id INT
)
BEGIN
    UPDATE genero
    SET deleted = 1
    WHERE id_genero = g_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_listar_activos()
BEGIN
    SELECT id_genero, nombre_genero, descripcion_genero, registro_personas_rut, registro_personas_usuario_id_usuario
    FROM genero
    WHERE deleted = 0
    ORDER BY nombre_genero;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_genero_listar_todo()
BEGIN
    SELECT id_genero, nombre_genero, descripcion_genero, registro_personas_rut, registro_personas_usuario_id_usuario, deleted
    FROM genero
    ORDER BY nombre_genero;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_chat_insertar(
    IN c_id INT,
    IN c_mensaje_doctor LONGTEXT,
    IN c_mensaje_paciente LONGTEXT,
    IN c_usuario_id INT,
    IN c_rut_doctor INT
)
BEGIN
    INSERT INTO chat(id_chat, mensaje_doctor, mesaje_paciente, usuario_id_usuario, registro_doctor_rut_doctor, deleted)
    VALUES (c_id, c_mensaje_doctor, c_mensaje_paciente, c_usuario_id, c_rut_doctor, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_chat_borrado_logico(
    IN c_id INT
)
BEGIN
    UPDATE chat
    SET deleted = 1
    WHERE id_chat = c_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_chat_listar_activos()
BEGIN
    SELECT id_chat, mensaje_doctor, mesaje_paciente, usuario_id_usuario, registro_doctor_rut_doctor
    FROM chat
    WHERE deleted = 0
    ORDER BY id_chat;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_chat_listar_todo()
BEGIN
    SELECT id_chat, mensaje_doctor, mesaje_paciente, usuario_id_usuario, registro_doctor_rut_doctor, deleted
    FROM chat
    ORDER BY id_chat;
END//
DELIMITER ;

-- ------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE sp_sintomas_insertar(
    IN s_id INT,
    IN s_nombre VARCHAR(50),
    IN s_descripcion VARCHAR(200),
    IN s_estado_id INT
)
BEGIN
    INSERT INTO sintomas(id_sintomas, nombre_sintomas, descripcion_sintomas, estado_paciente_id_estado_paciente, deleted)
    VALUES (s_id, s_nombre, s_descripcion, s_estado_id, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_sintomas_borrado_logico(
    IN s_id INT
)
BEGIN
    UPDATE sintomas
    SET deleted = 1
    WHERE id_sintomas = s_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_sintomas_listar_activos()
BEGIN
    SELECT id_sintomas, nombre_sintomas, descripcion_sintomas, estado_paciente_id_estado_paciente
    FROM sintomas
    WHERE deleted = 0
    ORDER BY nombre_sintomas;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_sintomas_listar_todo()
BEGIN
    SELECT id_sintomas, nombre_sintomas, descripcion_sintomas, estado_paciente_id_estado_paciente, deleted
    FROM sintomas
    ORDER BY nombre_sintomas;
END//
DELIMITER ;