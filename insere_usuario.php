<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title></title>
		<link rel="stylesheet" href="estilo.css"/>
	</head>
	<body>
<?php
if(!empty($_POST['cpf']))
{
	include("menu.php");
	
	include("conexao.php");
	
	$cpf = $_POST["cpf"];
	$nome = $_POST["nome"];
	$email = $_POST["email"];
	$data_nascimento = $_POST["data_nascimento"];
	$sexo = $_POST["sexo"];
	$cpf_responsavel = $_POST["cpf_responsavel"];
	$endereco = $_POST["endereco"];
	$permissao = 0;
	$senha = $_POST["senha"];
	$telefone = $_POST["telefone"];	

	
	$insercao = "INSERT INTO paciente
						VALUES ('$cpf',
								'$nome',
								'$email',
								'$data_nascimento',
								'$sexo',
								'$cpf_responsavel',
								'$endereco',								
								'$permissao',
								'$senha',
								'$telefone'
								)";
				
	mysqli_error($conexao);
	mysqli_query($conexao, $insercao);
	

		
	echo  "<script language=javascript>alert( 'Cadastro realizado com sucesso!' )</script>";
	header( "refresh:0.1;url=cadastro.php" );
}
	else("Erro no cadastro");

?>
	<body>
</html>