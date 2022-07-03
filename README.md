# Rede social de leitores

Diagrama ER:

![image](https://user-images.githubusercontent.com/50251615/177022841-3ae9aa0d-35ef-47b9-b543-04d16791051b.png)

A ideia do projeto é modelar o banco de dados para armazenar dados sobre uma rede social de leitores. Nessa rede social existem leitores, livros, bibliotecas, leituras e autores.
Os leitores podem fazer amizade entre si, podem ter bibliotecas com N livros, podem ter N livros e podem realizar N leituras. 

Algumas telas foram implementadas para ler as informações do banco de dados:

amizades.php mostra todas amizades<br>
autor.php mostra todos autores<br>
biblioteca.php mostra todas bibliotecas<br>
donos_livros.php mostra os livros que cada leitor possui<br>
leitores.php mostra todos leitores<br>
leituras.php mostra todas leituras<br>
livros.php mostra todos livros<br>

***
Sobre os objetos criados para a tarefa 10:

VIEW (com group by), mostra o nome do leitor e os livros que ele possuí, utilizado na tela donos_livros.php

```
CREATE VIEW donos_livros AS
SELECT leitor.nome dono, GROUP_CONCAT(livro.nome separator ', ') nome_livro
                    FROM leitor_livro 
                        INNER JOIN leitor ON leitor.leitor_id = leitor_livro.leitor_id
                        INNER JOIN livro ON livro.livro_id = leitor_livro.livro_id
                            GROUP BY leitor.leitor_id;
```
Pode ser usada desta forma:
```
SELECT * FROM donos_livros;
```
***

FUNCTION, recebe o id do autor, e conta quantos livros desse autor não foram lidos
```
DELIMITER /
CREATE FUNCTION quantidadeLivrosNaoLidos(autor_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	SET @qtd := (SELECT COUNT(*) qtd_nao_lidos FROM livro WHERE livro.livro_id NOT IN (SELECT livro_id FROM leitura) AND livro.autor_id = autor_id);
	RETURN @qtd;
END /
DELIMITER ;
```
Pode ser usada desta forma:
```
SELECT quantidadeLivrosNaoLidos(1);
```
***
PROCEDURE, incrementa a coluna quantidade_leitura do autor que foi passado como parâmetro (essa coluna serve para contar quantas leituras o autor já teve, somando todos os seus livros)
```
DELIMITER //
CREATE PROCEDURE adicionaLeituraAoAutor(autor_id INT)
BEGIN
	UPDATE autor SET quantidade_leitura = quantidade_leitura  + 1 WHERE autor.autor_id = autor_id;
END//

DELIMITER ;
```
Pode ser usado desta forma:
```
CALL adicionaLeituraAoAutor(@autor);
```
***
TRIGGER, acionada após alguma leitura ser inserida. Essa trigger chama a procedure acima para incrementar a quantidade de leituras que o autor do livro já teve (no total)
```
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
```
***
EVENT, a cada 24 horas, incrementa a coluna quantidade_dias das bibliotecas, para mostrar a quantos dias cada uma existe
```
DELIMITER //
CREATE EVENT incrementaDias
	ON SCHEDULE EVERY 24 HOUR
	ON COMPLETION PRESERVE
	DO
	UPDATE biblioteca SET quantidade_dias = quantidade_dias + 1;//
DELIMITER ;
```


