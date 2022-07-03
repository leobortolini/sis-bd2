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

        $nome = 'nome';
        $nascimento = 'nascimento';
        $quantidade_leitura = 'quantidade_leitura';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql = 'SELECT nome, nascimento, quantidade_leitura FROM autor;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
        '<table style="width: 100%">' .
        '    <tr align="left">' .
            '        <th>' . $nome . '</th>' .
            '        <th>' . $nascimento . '</th>' .
            '        <th>' . $quantidade_leitura . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$nascimento] . '</td>' .
                    '<td>' . $registro[$quantidade_leitura] . '</td>' ;
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