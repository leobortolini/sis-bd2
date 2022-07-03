#Tarefa 10 


#view (com group by)
CREATE VIEW donos_livros AS
SELECT leitor.nome dono, GROUP_CONCAT(livro.nome separator ', ') nome_livro
                    FROM leitor_livro 
                        INNER JOIN leitor ON leitor.leitor_id = leitor_livro.leitor_id
                        INNER JOIN livro ON livro.livro_id = leitor_livro.livro_id
                            GROUP BY leitor.leitor_id;
                           
SELECT * FROM donos_livros;
 

#function
DELIMITER /
CREATE FUNCTION quantidadeLivrosNaoLidos(autor_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	SET @qtd := (SELECT COUNT(*) qtd_nao_lidos FROM livro WHERE livro.livro_id NOT IN (SELECT livro_id FROM leitura) AND livro.autor_id = autor_id);
	RETURN @qtd;
END /
DELIMITER ;

SELECT quantidadeLivrosNaoLidos(1);


#procedure
ALTER TABLE autor ADD COLUMN quantidade_leitura INT DEFAULT 0;
DELIMITER //
CREATE PROCEDURE adicionaLeituraAoAutor(autor_id INT)
BEGIN
	UPDATE autor SET quantidade_leitura = quantidade_leitura  + 1 WHERE autor.autor_id = autor_id;
END//

DELIMITER ;

SELECT * FROM autor;


#trigger 
DELIMITER //
CREATE TRIGGER atualizaQuantidadeLeituraAoAutor
AFTER INSERT ON leitura FOR EACH ROW 
BEGIN 
	SET @autor := (SELECT DISTINCT a.autor_id 
									FROM autor a
										INNER JOIN livro ON a.autor_id = livro.autor_id
										INNER JOIN leitura ON livro.livro_id = NEW.livro_id);
	CALL adicionaLeituraAoAutor(@autor);
END//

DELIMITER ;


#event  
ALTER TABLE biblioteca ADD COLUMN quantidade_dias INT DEFAULT 0;

DELIMITER //
CREATE EVENT incrementaDias
	ON SCHEDULE EVERY 24 HOUR
	ON COMPLETION PRESERVE
	DO
	UPDATE biblioteca SET quantidade_dias = quantidade_dias + 1;//
DELIMITER ;



SELECT * FROM biblioteca;



