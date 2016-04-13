<?php 
require("Conn.php");
require("MySQLDao.php");

$returnValue = array();
if(empty($_REQUEST["userEmail"]) 
        || empty($_REQUEST["userFirstName"])
        || empty($_REQUEST["userLastName"]))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}
$userEmail = htmlentities($_REQUEST["userEmail"]);
$userPassword = htmlentities($_REQUEST["userPassword"]);
$userFirstName = htmlentities($_REQUEST["userFirstName"]);
$userLastName = htmlentities($_REQUEST["userLastName"]);
$userPhone = htmlentities($_REQUEST["userPhone"]);

// Generate secure password       
$secured_password = md5($userPassword);

$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();


// update user info 
$result =$dao->updateUserinfo( $userFirstName, $userLastName, $userPhone, $userEmail);
if($result)
{
    $userDetails = $dao->getUserDetails($userEmail);
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully updated user";    
    $returnValue["userFirstName"] = $userDetails["fname"];
    $returnValue["userLastName"] = $userDetails["lname"];
    $returnValue["userEmail"] = $userDetails["email"]; 
        
} else {   
    $returnValue["status"]="400";
    $returnValue["message"]="Could not update user with provided information"; 
}
$dao->closeConnection();
echo json_encode($returnValue);
?>
