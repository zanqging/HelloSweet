<?php
require("con.php");
require("MySQLDao.php");

$userid = htmlentities($_REQUEST["userid"]);
$menuid = htmlentities($_REQUEST["menuid"]);
$couponid = htmlentities($_REQUEST["couponid"]);
$mount = htmlentities($_REQUEST["mount"]);
$tax = htmlentities($_REQUEST["tax"]);

$returnValue = array();

if(empty($userid)||empty($menuid))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$dao = new MySQLDAO(conn::$dbhost, conn::$dbuser, conn::$dbpass, conn::$dbname);
$dao->openConnection();
$result =$dao->addOrder($userid,$menuid,$couponid,$mount,$tax);
if(!$result)
{
    $returnValue["status"]="403";
    $returnValue["message"]="add order failed!";
    echo json_encode($returnValue);
    return;
}

$returnValue["status"]="200";

echo json_encode($returnValue);
$dao->closeConnection();


?>

