INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'sistema',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'sistema@plataforma.cl',
    NULL,
    NULL,
    NULL
);

INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'admin',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'administrador@gmail.com',
    1,
    1,
    1
);

INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'gabriel',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'gabriel.altos@gmail.com',
    2,
    1,
    1
);

INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'hernesto',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'hernesto.lopez@gmail.com',
    3,
    1,
    1
);

INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'martin',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'martin.gonzales@gmail.com',
    4,
    1,
    1
);

INSERT INTO usuarios (
    nombre_usuario, password, correo,id_tipo_usuario , created_by, updated_by
)
VALUES (
    'martina',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'martina.gonzales@gmail.com',
    5,
    1,
    1
);

select * from usuarios;

INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion,
    created_by,
    updated_by
)
VALUES (
    'Administrador',
    'Accede a todas las funciones del sistema, incluida la administración de usuarios.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);

select * from tipo_usuarios;


INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion,
    created_by,
    updated_by
)
VALUES (
    'Vendedor',
    'encargado de la venta de el producto o servicio',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);
-- ------------------------------------------------
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion,
    created_by,
    updated_by
)
VALUES (
    'consumidor',
    'aquel que adquiere un bien o un servicio.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);
-- -------------------------------------------------
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion,
    created_by,
    updated_by
)
VALUES (
    'gerente',
    'encargado de organizar y administrar a los vendedore.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);
-- ---------------------------------------------------------
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion,
    created_by,
    updated_by
)
VALUES (
    'analista de sistema',
    'encargado de analizar el sistema y buscar soluciones a los problemas destro de el mismo',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);

select * FROM productos;

INSERT INTO productos (
nombre_producto,
descripcion,
precio,
stock,
created_by,
updated_by
)
VALUES (
'papas',
'tuberculo cafe',
800.00,
20,
1,
1
);

INSERT INTO productos (
nombre_producto,
descripcion,
precio,
stock,
created_by,
updated_by
)
VALUES (
'zanahoria',
'tuberculo naranjo',
200.00,
50,
1,
1
);
INSERT INTO productos (
nombre_producto,
descripcion,
precio,
stock,
created_by,
updated_by
)
VALUES (
'lechuga',
'vegetal de hojas comestibles',
1000.00,
10,
1,
1
);
INSERT INTO productos (
nombre_producto,
descripcion,
precio,
stock,
created_by,
updated_by
)
VALUES (
'coliflor',
'vegetal de flor comestibles',
1200.00,
10,
1,
1
);

INSERT INTO productos (
nombre_producto,
descripcion,
precio,
stock,
created_by,
updated_by
)
VALUES (
'brocoli',
'vegetal de flor comestibles',
1200.00,
10,
1,
1
);

INSERT INTO ventas (
usuario_id,
fecha,
created_by,
updated_by
)
VALUES (
3,
"2025-05-15",
1,
1
);
INSERT INTO ventas (
usuario_id,
fecha,
created_by,
updated_by
)
VALUES (
3,
"2024-12-03",
1,
1
);

INSERT INTO ventas (
usuario_id,
fecha,
created_by,
updated_by
)
VALUES (
3,
"1563-03-30",
1,
1
);

INSERT INTO ventas (
usuario_id,
fecha,
created_by,
updated_by
)
VALUES (
3,
"2005-11-11",
1,
1
);
INSERT INTO ventas (
usuario_id,
fecha,
created_by,
updated_by
)
VALUES (
3,
"2001-09-11",
1,
1
);
select * from ventas;

INSERT INTO  detalle_ventas(
    id_ventas, id_producto, cantidad, precio_unitario, created_by, updated_by
)
VALUES (
    1,
    2,
    50,
    1000,
    2,
    2
),
(
    5,
    4,
    100,
    1200,
    2,
    2
),
(
    2,
    1,
    30,
    800,
    2,
    2
),
(
    3,
    3,
    50,
    200,
    2,
    2
),
(
    4,
    5,
    70,
    1200,
    2,
    2
);
select * from detalle_ventas;