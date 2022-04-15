<!DOCTYPE html>

<head>
</head>

<html>

<body>
    <div>
        <h1>Bibliófilo's</h1>

        <h2>Biblioteca</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $nome = 'nome';
        $descricao = 'descricao';
        $dono = 'dono';
        $livros = 'livros';


        $sql = 'SELECT biblioteca.nome, biblioteca.descricao, leitor.nome dono, GROUP_CONCAT(livro.nome separator \', \') livros 
                    FROM biblioteca_livro
                        INNER JOIN biblioteca ON biblioteca.biblioteca_id = biblioteca_livro.biblioteca_id
                        INNER JOIN livro ON livro.livro_id = biblioteca_livro.livro_id
                        INNER JOIN leitor ON leitor.leitor_id = biblioteca.leitor_id
                            GROUP BY biblioteca.nome, biblioteca.descricao, leitor.leitor_id;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
            '<table style="width: 100%">' .
            '    <tr align="left">' .
            '        <th>' . $nome . '</th>' .
            '        <th>' . $descricao . '</th>' .
            '        <th>' . $dono . '</th>' .
            '        <th>' . $livros . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$descricao] . '</td>' .
                    '<td>' . $registro[$dono] . '</td>' .
                    '<td>' . $registro[$livros] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>