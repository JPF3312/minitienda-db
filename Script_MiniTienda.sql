-- Categorias 
-- Insertar
DELIMITER //
create procedure procInsertCategory(IN v_description VARCHAR (45) )
begin
	INSERT INTO tbl_categorias(cat_descripcion) values(v_description);
end//
DELIMITER ;

-- Actualizar
DELIMITER //

create procedure procUpdateCategory(IN v_id INT, IN v_description VARCHAR(45))
begin
	update tbl_categorias
    set cat_descripcion = v_description
    where cat_id = v_id;
end//

DELIMITER ;

-- Mostrar
DELIMITER //
create procedure procSelectCategory()
begin
	select cat_id,cat_descripcion from tbl_categorias;
end//
DELIMITER ;

-- Eliminar 
DELIMITER //

create procedure procDeleteCategory(IN v_id INT)
begin
	delete from tbl_categorias where cat_id = v_id;
end//
DELIMITER ;

-- Proveedores


-- Insertar
DELIMITER //
create procedure procInsertProviderss(IN v_nit VARCHAR (45), IN v_nombre VARCHAR(100))
begin
    INSERT INTO tbl_proveedores(prov_nit, prov_nombre) values(v_nit, v_nombre); 
end//
DELIMITER ;



-- Mostrar
DELIMITER //
create procedure procSelectProviders()
begin
	select prov_id,prov_nit,prov_nombre from tbl_proveedores;
end//
DELIMITER ;




-- Eliminar 
DELIMITER //
create procedure procDeleteProviders(IN v_id INT)
begin
	delete from tbl_proveedores where prov_id = v_id;
end//
DELIMITER ;



-- Actualizar
DELIMITER //
create procedure procUpdateProviders(IN v_id INT, IN v_nit VARCHAR(45), IN v_nombre VARCHAR (100))
begin
	update tbl_proveedores
    set prov_nit = v_nit , prov_nombre = v_nombre
    where prov_id = v_id;
end//
DELIMITER ;



-- Productos

-- Insertar producto
DELIMITER //
CREATE PROCEDURE pro_InsertProduct(
    IN v_codigo VARCHAR(45),
    IN v_descripcion VARCHAR(100),
    IN v_cantidad INT,
    IN v_precio DOUBLE,
    IN v_proveedor_id INT,
    IN v_categoria_id INT
)
BEGIN
    INSERT INTO tbl_productos (
        pro_codigo, 
        pro_descripcion, 
        pro_cantidad, 
        pro_precio, 
        tbl_proveedores_prov_id, 
        tbl_categorias_cat_id
    ) 
    VALUES (
        v_codigo, 
        v_descripcion, 
        v_cantidad, 
        v_precio, 
        v_proveedor_id, 
        v_categoria_id
    );
END //
DELIMITER ;

-- Actualizar producto
DELIMITER //
CREATE PROCEDURE procUpdateProduct(
    IN v_id INT,
    IN v_codigo VARCHAR(45),
    IN v_descripcion VARCHAR(100),
    IN v_cantidad INT,
    IN v_precio DOUBLE,
    IN v_proveedor_id INT,
    IN v_categoria_id INT
)
BEGIN
    UPDATE tbl_productos
    SET 
        pro_codigo = v_codigo,
        pro_descripcion = v_descripcion,
        pro_cantidad = v_cantidad,
        pro_precio = v_precio,
        tbl_proveedores_prov_id = v_proveedor_id,
        tbl_categorias_cat_id = v_categoria_id
    WHERE pro_id = v_id;
END //
DELIMITER ;

-- Seleccionar productos
DELIMITER //
CREATE PROCEDURE procSelectProduct()
BEGIN
    SELECT 
        p.pro_id, 
        p.pro_codigo, 
        p.pro_descripcion, 
        p.pro_cantidad, 
        p.pro_precio, 
        pv.prov_nombre AS proveedor, 
        c.cat_descripcion AS categoria
    FROM tbl_productos p
    INNER JOIN tbl_proveedores pv ON p.tbl_proveedores_prov_id = pv.prov_id
    INNER JOIN tbl_categorias c ON p.tbl_categorias_cat_id = c.cat_id;
END //
DELIMITER ;

-- Eliminar producto
DELIMITER //
CREATE PROCEDURE procDeleteProduct(IN v_id INT)
BEGIN
    DELETE FROM tbl_productos WHERE pro_id = v_id;
END //
DELIMITER ;




-- Usuarios
-- Insertar usuario 
DELIMITER //
CREATE PROCEDURE procInsertUser(
    IN v_correo VARCHAR(80),
    IN v_contrasena TEXT, 
    IN v_estado VARCHAR(15)
)
BEGIN
    INSERT INTO tbl_usuarios (usu_correo, usu_contrasena, usu_estado) 
    VALUES (v_correo, v_contrasena, v_estado);
END //
DELIMITER ;

-- Actualizar usuario 
DELIMITER //
CREATE PROCEDURE procUpdateUser(
    IN v_id INT,
    IN v_correo VARCHAR(80),
    IN v_contrasena TEXT, 
    IN v_estado VARCHAR(15)
)
BEGIN
    UPDATE tbl_usuarios
    SET 
        usu_correo = v_correo,
        usu_estado = v_estado,
        usu_contrasena = v_contrasena 
    WHERE usu_id = v_id;
END //
DELIMITER ;

-- Seleccionar usuarios
DELIMITER //
CREATE PROCEDURE procSelectUser()
BEGIN
    SELECT usu_id, usu_correo, usu_estado FROM tbl_usuarios; 
END //
DELIMITER ;

-- Eliminar usuario
DELIMITER //
CREATE PROCEDURE procDeleteUser(IN v_id INT)
BEGIN
    DELETE FROM tbl_usuarios WHERE usu_id = v_id;
END //
DELIMITER ;
