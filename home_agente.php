<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title>  HOME AGENTE </title>
		<link rel="stylesheet" type="text/css" href="estilo.css" />
		<?php
			include ("menu.php");
			include("verificacao_agente.php");
			if(isset($_SESSION["autorizado"]) and $_SESSION["permissao"] == 1){			
		?>	
	</head>
	<body class='body_agente'>
		<br/>
		<div class='form-group container-fluid' align='center'>
			<h2>Área Restrita</h2>
		</div>
	</body>
</html>
		<?php
			}else{
				header("location: index.php");
			}
		?>