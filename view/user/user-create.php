<?php include( 'view/template/header.php' ); ?>

<section class="card mt-3 mb-3">
	<header class="card-header">
		<h1 class="mb-0"><?= htmlentities( $title ); ?></h1>
	</header>

	<div class="card-body">
		<?php if ( $errors ) : ?>
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<?php foreach ( $errors as $field => $error ) echo $error . '<br>'; ?>
			</div>
		<?php endif; ?>

		<form action="" method="POST">
			<div class="form-group">
				<label for="name">Name <span style="color:#f00">*</span></label>
				<input type="text" name="name" id="name" class="form-control" placeholder="John Doe" required>
			</div>
			<div class="form-group">
				<label for="email">Email <span style="color:#f00">*</span></label>
				<input type="email" name="email" id="email" class="form-control" placeholder="hi@john.doe" required>
			</div>
			<div class="form-group">
				<label for="country">Country <span style="color: #f00;">*</span></label>
				<select name="country" id="country" class="form-control" required>
					<?php foreach ( $countries as $country ) : ?>
						<option value="<?= $country->country_id; ?>"><?= $country->country_name; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
			<button type="submit" name="create" class="btn btn-primary">Create</button>
			<a href="index.php" class="btn btn-light">Cancel</a>
		</form>
	</div>
</section>

<?php include( 'view/template/footer.php' ); ?>
