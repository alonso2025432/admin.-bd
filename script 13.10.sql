DELIMITER //
CREATE PROCEDURE sp_categoria_insertar(
IN c_nombre VARCHAR(100)
)
BEGIN
INSERT INTO categoria(nombre, deleted)
VALUES (c_nombre, 0);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_categoria_borrado_logico(
IN c_id INT
)
BEGIN
UPDATE categoria
SET deleted = 1
WHERE id = c_id;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_categoria_listar_activos()
BEGIN
SELECT
c.id,
c.nombre AS categoria,

c.nombre AS categoria
FROM categoria c
WHERE c.deleted = 0
ORDER BY c.nombre;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_categoria_listar_todo()
BEGIN
SELECT
c.id,
c.nombre AS categoria,
c.deleted
FROM categoria c
ORDER BY c.nombre;
END//
DELIMITER ;

