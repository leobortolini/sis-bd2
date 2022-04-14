<!DOCTYPE html>

<head>
</head>

<html>

<body>
    <div>
        <h1>Bibliófilo's</h1>

        <h2>Leituras</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $leitor_nome = 'leitor_nome';
        $livro_nome = 'livro_nome';
        $inicio_leitura = 'inicio_leitura';
        $fim_leitura = 'fim_leitura';
        $classificacao = 'classificacao';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql = 'SELECT leitor.nome leitor_nome, livro.nome livro_nome, inicio_leitura, fim_leitura, classificacao 
        FROM leitura 
            INNER JOIN leitor ON leitor.leitor_id  = leitura.leitor_id
            INNER JOIN livro ON livro.livro_id = leitura.livro_id;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
            '<table style="width: 100%">' .
            '    <tr align="left">' .
            '        <th>' . $leitor_nome . '</th>' .
            '        <th>' . $livro_nome . '</th>' .
            '        <th>' . $inicio_leitura . '</th>' .
            '        <th>' . $fim_leitura . '</th>' .
            '        <th>' . $classificacao . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$leitor_nome] . '</td>' .
                    '<td>' . $registro[$livro_nome] . '</td>' .
                    '<td>' . $registro[$inicio_leitura] . '</td>' .
                    '<td>' . $registro[$fim_leitura] . '</td>' .
                    '<td>' . $registro[$classificacao] . '</td>' ;
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