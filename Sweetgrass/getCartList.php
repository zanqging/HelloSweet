<?php
require("con.php");
require("MySQLDao.php");

$userid = htmlentities($_REQUEST["userid"]);

$returnValue = array();

if(empty($userid))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$dao = new MySQLDAO(conn::$dbhost, conn::$dbuser, conn::$dbpass, conn::$dbname);
$dao->openConnection();
$result =$dao->getCartList($userid);
if(empty($result))
{
    $returnValue["status"]="403";
    $returnValue["message"]="There is no cart list";
    echo json_encode($returnValue);
    return;   
}

$returnValue["status"]="200";
$returnValue["data"] = $result;

echo json_encode($returnValue);
$dao->closeConnection();

?>

