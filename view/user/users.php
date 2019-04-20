<?php include( '/view/template/header.php' ); ?>

	<section class="card mt-3 mb-3">
		<header class="card-header">
			<h1 class="mb-0"><?= htmlentities( $title ); ?></h1>
		</header>

		<div class="card-body">
			<div class="mb-3">
				<a href="?user=create" class="btn btn-primary">Create User</a>
			</div>

			<table class="table table-striped mb-0">
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
				<?php foreach ( $users as $user ) : ?>
					<tr>
						<td><a href="?user=read&id=<?= $user->user_id; ?>"><?= $user->user_name; ?></a></td>
						<td><?= $user->user_email; ?></td>
						<td>
							<a href="?user=update&id=<?= $user->user_id; ?>" class="btn btn-success btn-sm">Update</a>
							<a href="?user=delete&id=<?= $user->user_id; ?>" class="btn btn-danger btn-sm" onclick="return confirm( 'Are you sure you want to delete?' );">Delete</a>
						</td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</section>

<?php include( '/view/template/footer.php' ); ?>
