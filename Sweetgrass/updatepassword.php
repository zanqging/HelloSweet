<?php 
require("Conn.php");
require("MySQLDao.php");

$returnValue = array();

$userEmail = htmlentities($_REQUEST["userEmail"]);
$cp = htmlentities($_REQUEST["cp"]);
$np = htmlentities($_REQUEST["np"]);


// Generate secure password       
$scp = md5($cp);
$snp = md5($np);

$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();
//login
$userDetails =$dao->getUserDetailsWithPassword($userEmail, $scp);
if(empty($userDetails))
{
    $returnValue["status"]="403";
    $returnValue["message"]="Password Wrong!";
    echo json_encode($returnValue);
    return;   
}   
// update user info 
$result =$dao->updateUserpassword($userEmail, $snp);
if($result)
{
    $userDetails = $dao->getUserDetails($userEmail);
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully updated user Password";    
    $returnValue["userEmail"] = $userDetails["email"]; 
        
} else {   
    $returnValue["status"]="400";
    $returnValue["message"]="Could not update user with provided information"; 
}

$dao->closeConnection();
echo json_encode($returnValue);
?>
