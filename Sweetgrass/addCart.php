<?php
require("con.php");
require("MySQLDao.php");

$userid = htmlentities($_REQUEST["userid"]);
$menuid = htmlentities($_REQUEST["menuid"]);

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
$result =$dao->addCart($userid,$menuid);
if(!$result)
{
    $returnValue["status"]="403";
    $returnValue["message"]="add cart failed!";
    echo json_encode($returnValue);
    return;
}

$returnValue["status"]="200";

echo json_encode($returnValue);
$dao->closeConnection();


?>

