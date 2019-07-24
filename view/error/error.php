<?php include( 'view/template/header.php' ); ?>

<div class="card mt-3 mb-3">
	<div class="card-body">
		<h1 class="card-title"><?= htmlentities( $title ); ?></h1>
		<p class="card-text"><?= $message; ?></p>
	</div>
</div>

<?php include( 'view/template/footer.php' ); ?>
