<?php
	session_start(); 
	if($_SESSION['rol']!=1){
		header("location: ./");
	}
?>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<?php  include "includes/scripts.php"; ?>
	<title>Turmp</title>
</head>
<body>
	<?php  include "includes/header.php"; ?>

	<section id="container">
		<h1><i class="fas fa-users"></i> Usuarios</h1>
		<a href="registro_usuario.php" class="btn_new"><i class="fas fa-user-plus"></i> Crear usuario</a>
		
		<form action="buscar_usuario.php" method="get" class="form_search">
			<input type="text" name="busqueda" id="busqueda">
			<button type="submit" class="btn_search"><i class="fas fa-search fa-lg"></i></button>
		</form>

		<table>
			<tr>
				<th>Cédula</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Dirección</th>
				<th>Telefono</th>
				<th>Email</th>
				<th>Fecha de ingreso</th>
				<th>Rol</th>
				<th>Estado</th>
				<th>Acciones</th>
			</tr>

			<?php
				//paginador
				include "../conexion.php";
				$sql_register=mysqli_query($conexion,"
					SELECT COUNT(*) as total_registro 
					FROM usuario");
				include "calculonumpaginas.php";
				
				//Crear lista
				$query = mysqli_query($conexion,"
					SELECT u.CC, u.Nombres, u.Apellidos, u.Direccion, u.Telefono, u.Email, u.Fecha_Ingreso, r.rol, s.Tipo_de_Estado
					FROM usuario u 
					INNER JOIN rol r ON u.rol = r.idrol 
					INNER JOIN tipo_de_estado s ON u.Id_Estado = s.Id_Estado
					ORDER BY u.CC ASC 
					LIMIT $desde,$por_pagina");
				mysqli_close($conexion);
				$result = mysqli_num_rows($query);
				
				echo ("   cualquier cosa     ");
				echo $result;

				if($result>0){
					
					
					while ($data=mysqli_fetch_array($query)) {
						?>
							<tr>
								<td><?php echo $data['CC']; ?></td>
								<td><?php echo $data['Nombres']; ?></td>
								<td><?php echo $data['Apellidos']; ?></td>
								<td><?php echo $data['Direccion']; ?></td>
								<td><?php echo $data['Telefono']; ?></td>
								<td><?php echo $data['Email']; ?></td>
								<td><?php echo $data['Fecha_Ingreso']; ?></td>
								<td><?php echo $data['rol']; ?></td>
								<td><?php echo $data['Tipo_de_Estado']; ?></td>
								
								<td>
									<a class="link_edit" href="editar_usuario.php?id=<?php echo $data['CC']; ?>"><i class="fas fa-edit"></i> Editar</a>
									
									<?php // if($data['CC']!=1){ ?>
										|  <a class="link_delete" href="eliminar_confirmar_usuario.php?id=<?php echo $data['CC']; ?>"><i class="fas fa-trash-alt"></i> Eliminar</a>
										<?php
										//} 
									?>
								</td>
							</tr>
						<?php
					}
				}
			?>
		</table>
		<?php include "paginador.php"; ?>
	</section>
	<?php  include "includes/footer.php"; ?>
</body>
</html>