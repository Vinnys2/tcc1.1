<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title> HOME ADM </title>
	
	<?php
		include ("menu.php");
		include("verificacao_administrador.php");
		if(isset($_SESSION["autorizado"]) and $_SESSION["permissao"] == 2){		
	?>
	</head>
	<br/>
	<br/>
	<br/>
	<body class='body_administrador'>
		<div class='form-group container-fluid' align='center'>
			<div align='center' class='container-fluid'>
				<h2>Área Restrita</h2>
			</div>
		</div>
	</body>
</html>
		<?php
			}else{
				echo"Você não realizou o devido login e/ou não tem acesso a essa página!";
				header("location: index.php");
			}
		?>