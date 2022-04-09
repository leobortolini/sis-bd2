<!DOCTYPE html>

<head>
</head>

<html>

<body>
    <div>
        <h1>Bibliófilo's</h1>

        <h2>Amizades</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $nome_1 = 'nome_1';
        $nome_2 = 'nome_2';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql = 'SELECT leitor1.nome nome_1, leitor2.nome nome_2
        FROM amizade 
            INNER JOIN leitor leitor1 ON amizade.leitor1  = leitor1.leitor_id  
            INNER JOIN leitor leitor2 ON amizade.leitor2 = leitor2.leitor_id;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
        '<table style="width: 100%">' .
        '    <tr align="left">' .
            '        <th>' . $nome_1 . '</th>' .
            '        <th>' . $nome_2 . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$nome_1] . '</td>' .
                    '<td>' . $registro[$nome_2] . '</td>' ;
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