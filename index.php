<?php session_start(); ?>
<?php include("menu.php"); ?>	
		<meta charset ='utf-8'/>
		<!--<script src = "cadastrar_usuario.js"></script>-->
		<title> Login - Carteirinha de vacinação digital </title>
	</head>
	<?php 
		if(isset($_SESSION["autorizado"])){
			if($_SESSION["pagina"] == "paciente"){
				header("location: home_paciente.php");
			}
			if($_SESSION["pagina"] == "agente"){
				header("location: home_agente.php");
			}
			if($_SESSION["pagina"] == "administrador"){
				header("location: home_administrador.php");
			}
		}
	?>
	<body class='bg-info'>
		<div class='container-fluid'>
				
			<div align='center' class='container-fluid'>
				<h1> Inicializar como (escolha uma das opções abaixo) </h1>
				
				<div class='row container-fluid'>
					<a class='col-lg-4 col-sm-12' href='login_agente.php'><img src='img/agente1.png' width='300px'/></a>
					<a class='col-lg-4 col-sm-12' href='login_paciente.php'><img src='img/paciente1.png' width='300px'/></a>
					<a class='col-lg-4 col-sm-12' href='login_administrador.php'><img src='img/administrador1.png' width='300px'/></a>
				</div>
				
				<div>
					<br /><br /><br />
				</div>
			</div>
		</div>
	</body>
</html>