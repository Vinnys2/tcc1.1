<?php

echo  '<html>
<head>
	<meta charset="utf-8">
	<title>Responsive Menu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<nav>
		<input type="checkbox" id="check">
		<label for="check" class="checkbtn">
			<i class="fas fa-bars"></i>
		</label>
		
			<label class="logo">
			<img src="img/logo.png" width="85px"/> Carteirinha online de vacinação</label>
	
		<ul>		
			
		
			
							<li><a href="home_paciente.php">| Home |</a></li>
			<li><a href="carteirinha.php"> Carteirinha |</a></li>
			<li><a href="curiosidades.php"> Curiosidades |</a></li>
			<li><a href="logout.php"> Logout |</a></li>
		</ul>
	</nav>

</body>
</html>';

?>