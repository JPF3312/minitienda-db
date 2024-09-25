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
create procedure procInsertProviders(IN v_nit VARCHAR (45), IN v_nombre VARCHAR(100))
begin
	INSERT INTO tbl_proveedores(prov_nit) values(v_nit, v_nombre);
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
-- Usuarios