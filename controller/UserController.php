<?php

require_once( '/model/UserService.php' );

/**
 * User Controller
 */
class UserController
{
	public $userService;

	public function __construct()
	{
		$this->userService = new UserService();
	}

	/**
	 * Create User
	 */
	public function createUser()
	{
		$title  = 'Create User';
		$name   = '';
		$email  = '';
		$errors = array();

		if ( isset( $_POST['create'] ) ) {
			$name  = isset( $_POST['name'] )  ? $this->userService->cleanValue( $_POST['name'] )  : null;
			$email = isset( $_POST['email'] ) ? $this->userService->cleanValue( $_POST['email'] ) : null;

			try {
				$this->userService->createUser( $name, $email );
				$this->redirect( 'index.php' );
			} catch ( ValidationException $e ) {
				$errors = $e->getErrors();
			}
		}

		include( '/view/user/user-create.php' );
	}

	/**
	 * Update User
	 */
	public function updateUser()
	{
		$title  = "Update User";
		$id     = isset( $_GET['id'] ) ? $_GET['id'] : null;
		$name   = '';
		$email  = '';
		$user   = $this->userService->getUser( $id );
		$errors = array();

		if ( ! $id ) throw new Exception( 'Internal error' );

		if ( isset( $_POST['update'] ) ) {
			$name  = isset( $_POST['name'] )  ? $this->userService->cleanValue( $_POST['name'] )  : null;
			$email = isset( $_POST['email'] ) ? $this->userService->cleanValue( $_POST['email'] ) : null;

			try {
				$this->userService->updateUser( $id, $name, $email );
				$this->redirect( 'index.php' );
			} catch ( ValidationException $e ) {
				$errors = $e->getErrors();
			}
		}

		include( '/view/user/user-update.php' );
	}

	/**
	 * Delete User
	 */
	public function deleteUser()
	{
		$id = isset( $_GET['id'] ) ? $_GET['id'] : null;

		if ( $id == null ) throw new Exception( 'Internal error' );

		try {
			$this->userService->deleteUser( $id );
			$this->redirect( 'index.php' );
		} catch ( ValidationException $e ) {
			$errors = $e->getErrors();
		}
	}

	/**
	 * Show User
	 */
	public function showUser()
	{
		$id = isset( $_GET['id'] ) ? $_GET['id'] : null;

		if ( $id == null ) throw new Exception( 'Internal error' );

		$user  = $this->userService->getUser( $id );
		$title = $user->user_name;

		include( '/view/user/user-single.php' );
	}

	/**
	 * Show Users
	 */
	public function showUsers()
	{
		$title = 'Users';
		$users = $this->userService->getUsers();

		include( '/view/user/users.php' );
	}

	/**
	 * Redirect
	 */
	public function redirect( $location )
	{
		header( 'Location: ' . $location );
	}

	/**
	 * Handle Request
	 */
	public function handleRequest()
	{
		$operation = isset( $_GET['user'] ) ? $_GET['user'] : null;

		try {
			if ( $operation == null ) {
				$this->showUsers();
			} elseif ( $operation == 'create' ) {
				$this->createUser();
			} elseif ( $operation == 'read' ) {
				$this->showUser();
			} elseif ( $operation == 'update' ) {
				$this->updateUser();
			} elseif ( $operation == 'delete' ) {
				$this->deleteUser();
			} else {
				$this->showError( 'Page not found', 'Page for operation <strong>&#34;' . $operation . '&#34;</strong> was not found!' );
			}
		} catch ( Exception $e ) {
			$this->userService->getErrorLog( $e );
			$this->showError( 'Application error', $e->getMessage() );
		}
	}

	/**
	 * Show Error
	 */
	public function showError( $title, $message )
	{
		include( '/view/error/error.php' );
	}
}
