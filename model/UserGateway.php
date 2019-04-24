<?php

require_once( 'Database.php' );

/**
 * User Gateway
 */
class UserGateway
{
	public $conn;

	public function __construct()
	{
		$this->conn = Database::connect();
	}

	/**
	 * Insert
	 */
	public function insertUser( $name, $email, $country )
	{
		$sql = 'INSERT INTO users ( user_name, user_email, user_country ) VALUES ( :name, :email, :country )';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindParam( ':name',    $name );
		$stmt->bindParam( ':email',   $email );
		$stmt->bindParam( ':country', $country );
		$stmt->execute();
	}

	/**
	 * Update
	 */
	public function updateUser( $id, $name, $email, $country )
	{
		$sql = 'UPDATE users SET user_name = :name, user_email = :email, user_country = :country
		WHERE user_id = :id';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindParam( ':id',      $id );
		$stmt->bindParam( ':name',    $name );
		$stmt->bindParam( ':email',   $email );
		$stmt->bindParam( ':country', $country );
		$stmt->execute();
	}

	/**
	 * Select All Users
	 */
	public function selectAllUsers( $orderBy, $sort, $pagination )
	{
		$sql = 'SELECT * FROM users
		INNER JOIN countries ON users.user_country = countries.country_id
		ORDER BY ' . $orderBy . ' ' . $sort . ' LIMIT ' . $pagination['start'] . ', ' . $pagination['perpage'];

		$stmt = $this->conn->prepare( $sql );
		$stmt->execute();

		$result = array();

		while ( $obj = $stmt->fetch( PDO::FETCH_OBJ ) ) $result[] = $obj;

		return $result;
	}

	/**
	 * Delete
	 */
	public function delete( $table, $_id, $id )
	{
		$sql = 'DELETE FROM ' . $table . ' WHERE ' . $_id . ' = :id';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindParam( ':id', $id );
		$stmt->execute();
	}

	/*
	 * Select All
	 */
	public function selectAll( $table )
	{
		$sql = 'SELECT * FROM ' . $table;

		$stmt = $this->conn->prepare( $sql );
		$stmt->execute();

		$result = array();

		while ( $obj = $stmt->fetch( PDO::FETCH_OBJ ) ) $result[] = $obj;

		return $result;
	}

	/**
	 * Select By Id
	 */
	public function selectAllById( $table, $_id, $id )
	{
		$sql = 'SELECT * FROM ' . $table . ' WHERE ' . $_id . ' = :id';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindValue( ':id', $id );
		$stmt->execute();

		return $stmt->fetch( PDO::FETCH_OBJ );
	}

	/**
	 * Check For Existence
	 */
	public function checkForExistence( $table, $column, $value, $_id, $id = '' )
	{
		$sql = 'SELECT ' . $column . ' FROM ' . $table . ' WHERE ' . $column . ' = :value AND ' . $_id . ' != :id';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindValue( ':value', $value );
		$stmt->bindValue( ':id',    $id );
		$stmt->execute();

		return $stmt->fetch( PDO::FETCH_OBJ );
	}

	/**
	 * Count Total Rows
	 */
	public function countTotalRows( $table )
	{
		$sql = 'SELECT COUNT(*) AS total FROM ' . $table;

		$stmt = $this->conn->prepare( $sql );
		$stmt->execute();

		return $stmt->fetch( PDO::FETCH_OBJ );
	}
}
