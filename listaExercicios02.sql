USE BibliotecaPessoal;

-- 1

DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT Nome, Sobrenome
    FROM Autor;
END;
//
DELIMITER ;

-- 2

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN CategoriaE varchar(100))
BEGIN
	WITH Selet_id AS (
		select (select Categoria_ID from categoria where nome = CategoriaE) as id_selecionado
    )
    
    Select Titulo, CategoriaE
    from livro
    inner join Selet_id on id_selecionado = Categoria_ID;
END;
//
DELIMITER ;

-- 3

DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN CategoriaE varchar(100))
BEGIN
	WITH Selet_id AS (
		select (select Categoria_ID from categoria where nome = CategoriaE) as id_selecionado
    )
    
    Select Categoria_ID, COUNT(Categoria_ID) as qtd_livros
    FROM livro
    INNER JOIN Selet_id  on id_selecionado = categoria_id
    GROUP BY Categoria_ID;
END;
//
DELIMITER ;