<?php
require("con.php");
require("MySQLDao.php");

$returnValue = array();

$dao = new MySQLDAO(conn::$dbhost, conn::$dbuser, conn::$dbpass, conn::$dbname);
$dao->openConnection();
$menuDetails =$dao->getmenu();

//echo json_encode($menuDetails);

$dao->closeConnection();

?>

