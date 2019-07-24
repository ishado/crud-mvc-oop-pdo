<?php include( 'view/template/header.php' ); ?>

	<section class="card mt-3 mb-3">
		<div class="card-body">
			<h1 class="card-title"><?= $user->user_name; ?></h1>
			<p class="card-text"><a href="mailto:<?= $user->user_email; ?>" class="card-link"><?= $user->user_email; ?></a></p>
		</div>

		<footer class="card-footer">
			<a href="index.php" class="btn btn-light btn-sm">Return</a>
			<a href="?user=update&id=<?= $user->user_id; ?>" class="btn btn-success btn-sm">Update</a>
			<a href="?user=delete&id=<?= $user->user_id; ?>" class="btn btn-danger btn-sm" onclick="return confirm( 'Are you sure you want to delete?' );">Delete</a>
		</footer>
	</section>

<?php include( 'view/template/footer.php' ); ?>
