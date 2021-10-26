<?php include("conexao.php");
session_start();?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title> LOTES </title>
		<?php
			include ("menu.php");
			include("verificacao_agente.php");
			if(isset($_SESSION["autorizado"]) and $_SESSION["permissao"] == 1){			
		?>	
	</head>
	<body class='body_agente'>
		<div class='container-fluid' align='center'>
			<!-- CADASTRO -->
			<h1>Inserir novo lote.</h1>
			<form method = "post" action = "insere_lote.php"><div class='form-group'>
				<label align='left'>Número do Lote:
					<input required='required' class='form-control' type='text' name='id' placeholder="Lote">
				</label>
				<label align='left'>Vacina do Lote:
					<select class='form-control' name = 'tipo_vacina'>					
						<option value="" disabled selected>:: Vacina </option>	
							<?php
								$consulta_vacina = "SELECT * FROM vacina";
								$resultado_vacina = mysqli_query($conexao,$consulta_vacina) or die ("ERRO");
								
								while($linha=mysqli_fetch_assoc($resultado_vacina)){
									echo '<option value = "'. $linha["id_vacina"] .'">'.$linha["tipo"] .'</option>';
								}
							?>
					</select>
				</label><br />
				<label align='left'>Fabricante:
					<input required='required' class='form-control' type='text' name='fabricante' placeholder="Fabricante">
				</label><br />
				<label align='left'>País de Origem:
					<input required='required' class='form-control' type='text' name='origem' placeholder="Origem">
				</label>
				<label align='left'>País de Destino:
					<input required='required' class='form-control' type='text' name='destino' placeholder="Destino">
				</label><br />
				<label align='left'>Data de Fabricação:
					<input required='required' class='form-control' type='date' name='data_fabricacao' placeholder="Data de fabricacao">
				</label>
				<label align='left'>Data de Validade:
					<input required='required' class='form-control' type='date' name='data_validade' placeholder="Data de validade">
				</label><br />
				
				<button id='btn' class='btn btn-info'>CADASTRAR</button><br/>
			</div></form>
		</div>
		
		<div class='form-group container-fluid' align='center'>
			
			<h1>Consultar lote</h1>
			
				<form action="<?php echo $_SERVER['PHP_SELF'];?>">
					<input type='number' class=' form-control' name='parametro' placeholder='Consultar Lote pelo número'/>
					<input class='btn btn-info' type='submit' value='Buscar'/>
				</form><br /><br />
				
				<?php include("listar_lote.php");?>
				
		</div>
	</body>
</html>
		<?php
			}else{
				header("location: index.php");
			}
		?>