<?php 

	$alert ='';
	session_start();
	if(!empty($_SESSION['active']))
	{
		header('location: main/'); 

	} else {  
		//echo ("no esta ingresado");
		if(empty($_POST['email']) || empty($_POST['clave']))
			{
				$alert='Ingrese Email y clave correctos';
			} else {
				require_once "conexion.php";
				$email = mysqli_real_escape_string ($conexion, $_POST['email']);
				$pass = mysqli_real_escape_string ($conexion, $_POST['clave']);
				$query = mysqli_query($conexion, "SELECT * FROM usuario WHERE Email = '$email' AND Contrasena='$pass'");
				mysqli_close($conexion);

				$result = mysqli_num_rows($query);
				
				if($result>0){
					$data=mysqli_fetch_array($query);
					$_SESSION['active']= true;
					$_SESSION['cedula']= $data['CC'];
					$_SESSION['nombres']=$data['nombres'];
					$_SESSION['apellidos']=$data['apellidos'];
					$_SESSION['email']=$data['Email'];
					$_SESSION['rol']=$data['rol'];
					header('location: main/');
				} else {
					$alert = 'El usuario o la clave son incorrectas';
					session_destroy();
				}
			
			}
	}
?>


<head>
	<meta charset="utf-8">
	<title>Logistics Creation</title>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>
	<div id="container">
		<form action="" method="post">
			<h3>Logistics Creation</h3>
			<h3>Iniciar Sesion</h3>
		
			<h3>Ingrese Email, Contraseña.</h3>
			<input type="text" name="email" placeholder="Email">
			<input type="password" name="clave" placeholder="Contraseña">
		
			<div class="alert"><?php echo isset($alert)? $alert : ''; ?></div>
			<input type="submit" value="INGRESAR">
			<a href="index.php">Regresar</a>
		</form>
	</div>

</body>