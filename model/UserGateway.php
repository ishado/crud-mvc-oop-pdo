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
	public function insertUser( $name, $email )
	{
		$sql = 'INSERT INTO users ( user_name, user_email ) VALUES ( :name, :email )';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindParam( ':name',  $name );
		$stmt->bindParam( ':email', $email );
		$stmt->execute();
	}

	/**
	 * Update
	 */
	public function updateUser( $id, $name, $email )
	{
		$sql = 'UPDATE users SET user_name = :name, user_email = :email WHERE user_id = :id';

		$stmt = $this->conn->prepare( $sql );
		$stmt->bindParam( ':id',    $id );
		$stmt->bindParam( ':name',  $name );
		$stmt->bindParam( ':email', $email );
		$stmt->execute();
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
	 * Select All
	 */
	public function selectAll( $table, $orderBy, $sort, $pagination )
	{
		$sql = 'SELECT * FROM ' . $table . ' ORDER BY ' . $orderBy . ' ' . $sort . ' LIMIT ' . $pagination['start'] . ', ' . $pagination['perpage'];

		$stmt = $this->conn->prepare( $sql );
		$stmt->execute();

		$result = array();

		while ( $obj = $stmt->fetch( PDO::FETCH_OBJ ) ) $result[] = $obj;

		return $result;
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
