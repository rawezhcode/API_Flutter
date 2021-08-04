<?php
date_default_timezone_set("Asia/Baghdad");
class DatabaseClass{	

    const SERVER_NAME = "localhost";
	const USERNAME = "root";
	const PASSWORD = "";
	const DATABASE_NAME = "test";
    public $conn;

    
    // this function is called everytime this class is instantiated 
    public function __construct(){

        try{
            $dsn = 'mysql:host=' . self::SERVER_NAME . ';dbname=' . self::DATABASE_NAME;
            $this->conn = new PDO($dsn, self::USERNAME, self::PASSWORD);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
        return $this->conn;
        
    }

    
    
    // Insert a row/s in a Database Table
    public function Insert( $statement = "", $parameters = [] ){
       
        try{
            
             $this->executeStatement( $statement , $parameters );
            return $this->conn->lastInsertId();

            
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }

  

// Select fetch a row/s in a Database Table
    public function Select_fetch_table( $statement = "" , $parameters = [] ){
        try{
            
            $stmt = $this->executeStatement( $statement , $parameters );
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
       
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }

    // execute statement
    private function executeStatement( $statement = "" , $parameters = [] ){
        try{
            $stmt = $this->conn->prepare($statement);
            $stmt->execute($parameters);
            return $stmt;
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }
    
    
}

$db = new DatabaseClass();

?>