-- 1

CALL sp_ListarAutores();

-- 2

CALL sp_LivrosPorCategoria('Ficção Científica');

-- 3

CALL sp_ContarLivrosPorCategoria('Ciência');

-- 4

CALL sp_VerificarLivrosCategoria2('Ciência', @ver);
SELECT @ver;

-- 5 

CALL sp_LivrosAteAno(2008);

-- 6

CALL sp_TitulosPorCategoria(4);

-- 7

CALL sp_AdicionarLivro(21, 'JJ E A Música do Tempo', 2, 2007, 352, 3);

-- 8 

CALL sp_AutorMaisAntigo();

-- 9

-- o exercício 9 não possui call