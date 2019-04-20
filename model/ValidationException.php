<?php
/**
 * Validation Exception
 */
class ValidationException extends Exception
{
	public $errors;

	public function __construct( $errors )
	{
		parent::__construct( 'Validation error!' );
		$this->errors = $errors; 
	}

	public function getErrors()
	{
		return $this->errors;
	}
}
