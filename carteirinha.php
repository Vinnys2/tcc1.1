<?php session_start();
	include ("menu.php");
	include("verificacao_paciente.php");	
	if(isset($_SESSION["autorizado"]) and $_SESSION["pagina"] == "paciente"){
		

?>

	</head>
	<body class='bg-info'>
	<div >
		<div class='container-fluid'>
			<h2><b> Seus vacinas e agendamentos </b></h2>
					<div><!-- a div se manterá oculta até clicar no nome do dono da carteirinha -->
					<?php include("proximas_vacinas.php"); ?>
						
					</div>

				
			<h2><b> Seus Dependentes </b></h2>			
				
						<div><!-- a div se manterá oculta até clicar no nome do dono da carteirinha -->
						<?php include("proximas_vacinas_dep.php"); ?>
						
					
		</div>
	</div>
	</body>
</html>
		<?php
			}else{
				header("location: index.php");
			}
		?>