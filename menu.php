<!DOCTYPE html>
<html lang ='pt-BR'>
	<head>
		<meta charset ='utf-8'/>
		<script src = "jquery-3.4.1.min.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="estilo.css"/>
		    

		
		
		
	
	
		<?php 
			if(isset($_SESSION["autorizado"])){
		?>
			
		<div class='row container-fluid'>			
			
			<?php //checar a página que o usuário fez login
					if(isset($_SESSION["autorizado"]) and $_SESSION["pagina"] == "paciente"){
					
					include ("menu1.php");
							
					}
					
					if(isset($_SESSION["autorizado"]) and $_SESSION["permissao"] == 1 and $_SESSION["pagina"] == "agente"){
						
							include ("menu2.php");
					}
					
					if(isset($_SESSION["autorizado"]) and $_SESSION["permissao"] == 2 and $_SESSION["pagina"] == "administrador"){
						
							include ("menu3.php");
					}
			}
			?>
		</div>
