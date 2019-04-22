<?php

require_once( 'UserGateway.php' );
require_once( 'ValidationException.php' );

/**
 * User Service
 */
class UserService
{
	public $userGateway;

	public function __construct()
	{
		$this->userGateway = new UserGateway();
	}

	/**
	 * Create User
	 */
	public function createUser( $name, $email )
	{
		try {
			$this->validateUserParams( $name, $email );
			$this->userGateway->insertUser( $name, $email );
		} catch ( Exception $e ) {
			throw $e;
			$this->getErrorLog( $e );
		}
	}

	/**
	 * Update User
	 */
	public function updateUser( $id, $name, $email )
	{
		try {
			$this->validateUserParams( $name, $email, $id );
			$this->userGateway->updateUser( $id, $name, $email );
		} catch ( Exception $e ) {
			throw $e;
			$this->getErrorLog( $e );
		}
	}

	/**
	 * Delete User
	 */
	public function deleteUser( $id )
	{
		try {
			$this->userGateway->delete( 'users', 'user_id', $id );
		} catch ( Exception $e ) {
			throw $e;
			$this->getErrorLog( $e );
		}
	}

	/**
	 * Get User
	 */
	public function getUser( $id )
	{
		try {
			return $this->userGateway->selectAllById( 'users', 'user_id', $id );
		} catch ( Exception $e ) {
			throw $e;
			$this->getErrorLog( $e );
		}
	}

	/**
	 * Get Users
	 */
	public function getUsers( $orderBy, $pagination )
	{
		$sort = ( $orderBy == 'user_id' ) ? $sort = 'DESC' : $sort = 'ASC';

		try {
			return $this->userGateway->selectAll( 'users', $orderBy, $sort, $pagination );
		} catch ( Exception $e ) {
			throw $e;
			$this->getErrorLog( $e );
		}
	}

	/**
	 * Validate User Params
	 */
	public function validateUserParams( $name, $email, $id = '' )
	{
		$errors = array();

		// Check Fields
		if ( ! isset( $name )  || empty( $name ) )  $errors[] = 'Name field is required';
		if ( ! isset( $email ) || empty( $email ) ) $errors[] = 'Email field is required';

		// Email Validation
		if ( ! filter_var( $email, FILTER_VALIDATE_EMAIL ) ) {
			$errors[] = 'Email is not valid';
		} else {
			if ( ! empty( $this->userGateway->checkForExistence( 'users', 'user_email', $email, 'user_id', $id ) ) ) $errors[] = 'Email already exists';
		}

		if ( empty( $errors ) ) return;

		throw new ValidationException( $errors );
	}

	/**
	 * Pagination
	 */
	public function pagination( $perpage )
	{
		$page        = ( isset( $_GET['page'] ) && ! empty( $_GET['page'] ) ) ? $_GET['page'] : 1;
		$pages       = $this->userGateway->countTotalRows( 'users' );
		$total_pages = ceil( $pages->total / $perpage );
		$start       = $perpage * $page - $perpage;

		$result = array(
			'page'        => $page,
			'total_pages' => $total_pages,
			'start'       => $start,
			'perpage'     => $perpage,
		);

		return $result;
	}

	/**
	 * Clean Value
	 */
	public function cleanValue( $value )
	{
		$value  = trim( $value );
		$value  = stripslashes( $value );
		$value  = strip_tags( $value );
		$result = htmlspecialchars( $value );

		return $result;
	}

	/**
	 * Get Error Log
	 */
	public function getErrorLog( $e )
	{
		return error_log( '[' . date( 'Y-m-d H:i:s' ) . '] [ERROR] [' . $_SERVER['REMOTE_ADDR'] . '] ' . $e->getMessage() . "\n", 3, 'error.log' );
	}
}
