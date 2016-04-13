<?php
require("Conn.php");
require("MySQLDao.php");

$con=mysqli_connect("db.soic.indiana.edu","caps16_team17","my+sql=caps16_team17","caps16_team17");

$email = htmlentities($_REQUEST["userEmail"]);
$userid = $con->query("SELECT userid FROM users WHERE email ='" . $email ."'")->fetch_object()->userid;
mysqli_close($con);
$partySize = htmlentities($_REQUEST["partySize"]);
$date = htmlentities($_REQUEST["d"]);
$time = htmlentities($_REQUEST["t"]);

$returnValue = array();

if(empty($partySize) || empty($date) || empty($time))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$dbhost = "db.soic.indiana.edu";
$dbuser = "caps16_team17";
$dbpassword = "my+sql=caps16_team17";
$dbname = "caps16_team17";
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();

// Make Reservation
$result =$dao->makeReservation($userid, $partySize, $date, $time);
if($result)
{
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully made Reservation";

} else {
    $returnValue["status"]="400";
    $returnValue["message"]="Unable to make a Reservation for that date and time";
}


$dao->closeConnection();
echo json_encode($returnValue);
?>
