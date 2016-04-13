<?php 
require("con.php");
require("MySQLDao.php");

$returnValue = array();
if(empty($_REQUEST["userEmail"]) || empty($_REQUEST["userPassword"]) 
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
$dao = new MySQLDAO(conn::$dbhost, conn::$dbuser, conn::$dbpass, conn::$dbname);
$dao->openConnection();

// Check if user with provided username is available
$userDetails = $dao->getUserDetails($userEmail);
if(!empty($userDetails))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Please choose a different email address"; 
    echo json_encode($returnValue);
    return;
}
// Register new user
$result =$dao->registerUser($userEmail, $userFirstName, $userLastName, $userPhone, $secured_password);
if($result)
{
    $userDetails = $dao->getUserDetails($userEmail);
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully registered new user";    
    $returnValue["userFirstName"] = $userDetails["fname"];
    $returnValue["userLastName"] = $userDetails["lname"];
    $returnValue["userEmail"] = $userDetails["email"]; 
        
} else {   
    $returnValue["status"]="400";
    $returnValue["message"]="Could not register user with provided information"; 
}
$dao->closeConnection();
echo json_encode($returnValue);
?>
