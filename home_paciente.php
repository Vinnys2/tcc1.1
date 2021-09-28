<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title> SAV - HOME</title>
		<?php
			include("verificacao_paciente.php");	
			include ("menu.php");
			if(isset($_SESSION["autorizado"]) and $_SESSION["pagina"] == "paciente"){			
		?>
	</head>
	<body class='bg-info'>
	<div>
		<div align='center'>
			<h1> Bem vindo a carteirinha do paciente!!</h1>
	</div>
	
	</body>
</html>
		<?php
			}else{
				header("location: index.php");
			}
		?>