<?php
require("con.php");
require("MySQLDao.php");

$email = htmlentities($_REQUEST["userEmail"]);
$password = md5(htmlentities($_REQUEST["userPassword"]));

$returnValue = array();

if(empty($email) || empty($password))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$userEmail = htmlentities($_REQUEST["userEmail"]);
$userPassword = md5(htmlentities($_REQUEST["userPassword"]));
$dao = new MySQLDAO(conn::$dbhost, conn::$dbuser, conn::$dbpass, conn::$dbname);
$dao->openConnection();
$userDetails =$dao->getUserDetailsWithPassword($userEmail, $userPassword);
if(empty($userDetails))
{
    $returnValue["status"]="403";
    $returnValue["message"]="User/Password Wrong!";
    echo json_encode($returnValue);
    return;   
}
$secure_password = $userDetails["password"];

if($secure_password === $userPassword)
{
    $returnValue["status"]="200";
    $returnValue["fname"] = $userDetails["fname"];
    $returnValue["lname"] = $userDetails["lname"];
    $returnValue["email"] = $userDetails["email"];
    $returnValue["phone"] = $userDetails["phone"];
echo json_encode($returnValue);
} else {
    $returnValue["status"]="403";
    $returnValue["message"]="User not found";
    echo json_encode($returnValue);
}

$dao->closeConnection();

?>

