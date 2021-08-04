<?php 
	include "config/db.php";
    $db = new DatabaseClass();
	// REGISTER USER
	

    try {

	  
	 
	    $query = $db->Select_fetch_table("select * from `students`");

	   echo json_encode($query);
	   
    } catch (Exception $e) {
        echo json_encode($e->getMessage());  
    }
	  

?>
