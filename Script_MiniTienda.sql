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

DELIMITER ;

-- Proveedores
-- Productos
-- Usuarios