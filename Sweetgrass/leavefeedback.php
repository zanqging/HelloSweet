<?php 
require("Conn.php");
require("MySQLDao.php");

$returnValue = array();
if(empty($_REQUEST["comment"]) 
        || empty($_REQUEST["rating"])
       )
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$comment = htmlentities($_REQUEST["comment"]);
$star = htmlentities($_REQUEST["rating"]);





$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();

// leave feedback 
$result =$dao->leavefeedback($comment, $star);
if($result)
{
    $userDetails = $dao->getUserfeedback($comment);
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully left feedback";    
    $returnValue["comment"] = $userDetails["comment"]; 
        
} else {   
    $returnValue["status"]="400";
    $returnValue["message"]="Could not leave feedback"; 
}

$dao->closeConnection();
echo json_encode($returnValue);
?>
