<?php
/**
 * Database
 */
class Database
{
	private static $conn = null;

	/**
	 * Connect
	 */
	public static function connect()
	{
		if ( self::$conn == null ) {
			try {
				$config = require_once( 'config.php' );
				self::$conn = new PDO( $config['db_driver'] . ':host=' . $config['db_server'] . ';dbname=' . $config['db_name'], $config['db_username'], $config['db_password'] );
				self::$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
			} catch( PDOException $e ) {
				error_log( '[' . date( 'Y-m-d H:i:s' ) . '] [CONNECTION ERROR] [' . $_SERVER['REMOTE_ADDR'] . '] ' . $e->getMessage() . "\n", 3, 'error.log' );
				die( 'Connection Error: ' . $e->getMessage() );
			}
		}

		return self::$conn;
	}
}
