	<?php
		//session_start();
		if(empty($_SESSION['active']))
		{
			header('location: ../'); 
		}
	?>

	<header>
		<div class="header">
			<h1>Logistics Creation</h1>
			<div class="optionsBar">
				<p>Colombia, <?php echo fechaC(); ?> </p>
				<span>|</span>
				<span class="user"><?php echo $_SESSION['nombres']; ?></span>
				<a href="salir.php"><img class="close" src="img/salir.png" alt="Salir del sistema" title="Salir"></a>
			</div>
		</div>
		<?php  include "nav.php" ?>
	</header>

	
	<div class="modal">
		<div class="bodyModal"></div>
	</div> 