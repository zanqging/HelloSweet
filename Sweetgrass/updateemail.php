<?php 
require("Conn.php");
require("MySQLDao.php");

$returnValue = array();
if(empty($_REQUEST["new"]) 
        || empty($_REQUEST["old"])
       )
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$new = htmlentities($_REQUEST["new"]);
$old = htmlentities($_REQUEST["old"]);





$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();

// update user info 
$result =$dao->updateUseremail($old, $new);
if($result)
{
    $userDetails = $dao->getUserDetails($new);
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully updated user email";    
    $returnValue["new"] = $userDetails["email"]; 
        
} else {   
    $returnValue["status"]="400";
    $returnValue["message"]="Could not update user with provided information"; 
}

$dao->closeConnection();
echo json_encode($returnValue);
?>
