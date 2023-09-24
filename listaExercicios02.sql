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

-- 4 

DELIMITER //
CREATE PROCEDURE sp_VerificarLivrosCategoria2(IN categoria_valor varchar(100), OUT tf_livros varchar(30))
BEGIN
	DECLARE verificar INT;
	WITH Selet_ID as (
		SELECT (select Categoria_ID from categoria where nome = Categoria_valor) as cate_valor
    )
	
    
    SELECT COUNT(*) INTO verificar FROM livro INNER JOIN Selet_ID on cate_valor = Categoria_ID;
    IF verificar > 0 THEN
        SET tf_livros = 'Possui Livros';
    ELSE
        SET tf_livros = 'Não Possui Livros';
    END IF;
END;
//
DELIMITER ;

-- 5

DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN ano_esco INT)
BEGIN
	SELECT Titulo, Ano_Publicacao
    FROM livro
    where Ano_Publicacao <= ano_esco;
END;
//
DELIMITER ;

-- 6

DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria(IN Cate_esco INT)
BEGIN
	SELECT Categoria_ID, Titulo
    FROM livro
    where Categoria_ID = Cate_esco;
END;
//
DELIMITER ;

-- 7

DELIMITER //
CREATE PROCEDURE sp_AdicionarLivro(
    IN N_Livro_ID INT,
    IN N_Titulo VARCHAR(255),
    IN N_Editora_ID INT,
    IN N_Ano_Publicacao INT,
    IN N_Numero_Paginas INT,
    IN N_Categoria_ID INT
)
BEGIN
    DECLARE livro_existente INT;
    
    SELECT COUNT(*) INTO livro_existente FROM Livro WHERE Titulo = n_titulo;
    
    IF livro_existente = 0 THEN
        INSERT INTO Livro (Livro_ID, Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (N_Livro_ID, N_Titulo, N_Editora_ID, N_Ano_Publicacao, N_Numero_Paginas, N_Categoria_ID);
    END IF;
    
END;
//
DELIMITER ;

-- 8

DELIMITER //
CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
	SELECT Nome, Data_Nascimento
    from Autor
    order by data_nascimento asc
    limit 1;
END;
//
DELIMITER ;

-- 9

-- irei explicar o exercicio 1, que é o mais fácil

DELIMITER // -- o delimiter serve para limitar o espaço das procedures, evitando erros no resto do código e deixando ele mais legível
CREATE PROCEDURE sp_ListarAutores() -- como em qualquer outra parte do sql, o create serve pra criar algo, e nesse caso, para criar a procedure, após o nome da procedure se deve colocar um paranteses, onde você pode ou não inserir algum paramêtro para ser usado somente dentro da procedure
BEGIN -- begin serve para marcar o começo de uma procedure, colocado na linha abaixo do create
	SELECT Nome, Sobrenome -- essa linha serve para eu selecionar a informação que eu quero exibir quando eu chamar a procedure
    FROM Autor; -- essa linha serve para selecionar a tabela onde as informações que eu quero exibir estão presentes
END; -- o end é aliado ao begin, e serve para marcar o fim de uma procedure, e é colocado após o fim do código
// -- as duas barras são parte da função do delimiter que serve para limitar a procedure
DELIMITER ; -- o delimiter com ponto e virgula no final serve para colocar um fim a procedure, após ele o código deve ser executado para a procedure ser executada

-- 10 

DELIMITER //
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor.Autor_ID = Autor_Livro.Autor_ID;
END;
//
DELIMITER ;