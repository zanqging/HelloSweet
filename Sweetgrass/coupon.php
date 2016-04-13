<?php 
require("Conn.php");
require("MySQLDao.php");

$returnValue = array();


$code = htmlentities($_REQUEST["code"]);






$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();


// Check coupon
$userDetails =$dao->couponvalid($code);
//echo json_encode($userDetails);
if(empty($userDetails))
{
    $returnValue["status"]="403";
    $returnValue["message"]="No coupon found";
    //echo json_encode($returnValue);
    //return;   
} else {

    $returnValue["message"]="Coupon applied";    
    $returnValue["discount"] = $userDetails["discount"];
}

$dao->closeConnection();
echo json_encode($returnValue);
?>
