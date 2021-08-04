<?php 
	include "config/db.php";
    $db = new DatabaseClass();
	// REGISTER USER
	

    try {
//  echo json_encode($_POST['name']);

        $name = $_POST['name'];
	    $email = $_POST['email'];
	    $mobile = $_POST['mobile'];
	  
	 
	    $query = $db->Insert("INSERT INTO `students` (`username`, `mobile` , `email` , `department_id`)VALUES('$name','$mobile', '$email',1)");
	    $results = $query;
	    if($results>0)
	    {
	        echo "user added successfully";
	    }
	    echo json_encode("insert");
    } catch (Exception $e) {
        echo json_encode($e->getMessage());  
    }
	  

?>
