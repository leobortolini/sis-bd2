<!DOCTYPE html>

<head>
</head>

<html>

<body>
    <div>
        <h1>Bibliófilo's</h1>

        <h2>Livros</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $nome = 'nome';
        $autor = 'autor';
        $autor_alias = 'nome';
        $data_primeira_publicação = 'data_primeira_publicação';
        $categoria = 'categoria';
        $classificacao = 'classificacao';
        $tipo_de_capa = 'tipo_de_capa';
        $quantidade_paginas = 'quantidade_paginas';
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT livro.' . $nome .
            '     , ' . $data_primeira_publicação .
            '     , ' . $categoria .
            '     , autor.' . $autor_alias . ' as autor' .
            '     , ' . $tipo_de_capa .
            '     , ' . $quantidade_paginas .
            /*TODO-2: Adicione cada variavel a consulta abaixo */
            '  FROM livro INNER JOIN autor ON autor.autor_id = livro.autor_id;';
       


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        $cabecalho =
        '<table style="width: 100%">' .
        '    <tr align="left">' .
            '        <th>' . $nome . '</th>' .
            '        <th>' . $data_primeira_publicação . '</th>' .
            '        <th>' . $categoria . '</th>' .
            '        <th>' . $autor . '</th>' .
            '        <th>' . $tipo_de_capa . '</th>' .
            '        <th>' . $quantidade_paginas . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$data_primeira_publicação] . '</td>' .
                    '<td>' . $registro[$categoria] . '</td>' .
                    '<td>' . $registro[$autor] . '</td>' .
                    '<td>' . $registro[$tipo_de_capa] . '</td>' .
                    '<td>' . $registro[$quantidade_paginas] . '</td>';
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