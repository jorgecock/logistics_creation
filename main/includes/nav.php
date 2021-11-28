		<nav>
			<ul>
				
				<!-- Menu Inicio -->
				<li class="principal">
					<a href="index.php"><i class="fas fa-home"></i> Inicio</a>
				</li>
				
				<!-- Menu usuarios -->
				<?php if($_SESSION['rol']==1){
				//Permiso para editar personas ?>
					<li class="principal">
						<a href="#"><i class="fas fa-users"></i> Usuarios</a>
						<ul>
							<li class="principal">
								<a href="lista_usuarios.php"><i class="fas fa-users"></i> Usuarios</a>
							</li>
						</ul>
					</li>
				<?php } ?>

				<!-- Menu acerca de -->
				<li class="principal">
					<a href="acercade.php"><i class="far fa-question-circle"></i> Acerca de</a>
					<ul>
						<li class="principal"><a href="acercade.php">Acerca de</a></li>
					</ul>
				</li>

			</ul>
		</nav>