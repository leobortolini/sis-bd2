<!DOCTYPE html>

<head>

</head>

<html>

<body>
    <div>
        <h1>Bibliófilo's</h1>

        <h2>Autor</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $dono = 'dono';
        $nome_livro = 'nome_livro';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql = 'SELECT leitor.nome dono, GROUP_CONCAT(livro.nome separator \', \') nome_livro
                    FROM leitor_livro 
                        INNER JOIN leitor ON leitor.leitor_id = leitor_livro.leitor_id
                        INNER JOIN livro ON livro.livro_id = leitor_livro.livro_id
                            GROUP BY leitor.leitor_id;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
        '<table style="width: 100%">' .
        '    <tr align="left">' .
            '        <th>' . $dono . '</th>' .
            '        <th>' . $nome_livro . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$dono] . '</td>' .
                    '<td>' . $registro[$nome_livro] . '</td>' ;
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