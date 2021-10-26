<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title>HOME-PACIENTE</title>
		<?php
			include("verificacao_paciente.php");	
			include ("menu.php");
			if(isset($_SESSION["autorizado"]) and $_SESSION["pagina"] == "paciente"){			
		?>
	</head>
	<body class='bg-info'>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<div>
		<div align='center'>
			<h1> Bem vindo a sua carteirinha.</h1>
	</div>
	
	</body>
</html>
		<?php
			}else{
				header("location: index.php");
			}
		?>