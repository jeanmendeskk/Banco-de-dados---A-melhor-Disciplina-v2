-- 1

CALL sp_ListarAutores();

-- 2

CALL sp_LivrosPorCategoria('Ficção Científica');

-- 3

CALL sp_ContarLivrosPorCategoria('Ciência');

-- 4

CALL sp_VerificarLivrosCategoria2('Ciência', @ver);
SELECT @ver;