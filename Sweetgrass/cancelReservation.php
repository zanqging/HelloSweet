<?php
require("Conn.php");
require("MySQLDao.php");

$con=mysqli_connect("db.soic.indiana.edu","caps16_team17","my+sql=caps16_team17","caps16_t")

$email = htmlentities($_REQUEST["userEmail"]);
$userid = $con->query("SELECT userid FROM users WHERE email ='" . $email ."'")->fetch_obje$
mysqli_close($con);
$date = htmlentities($_REQUEST["d"]);
$time = htmlentities($_REQUEST["t"]);

$returnValue = array();

if(empty($partySize) || empty($date) || empty($time))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;

    $dbhost = "db.soic.indiana.edu";
    $dbuser = "caps16_team17";
    $dbpassword = "my+sql=caps16_team17";
    $dbname = "caps16_team17";
    $dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
    $dao->openConnection();

    // Cancel Reservation
    $result =$dao->cancelReservation($userid, $date, $time);
    if($result)
    {
    $returnValue["status"]="200";
    $returnValue["message"]="Successfully made Reservation";
} else {
    $returnValue["status"]="400";
    $returnValue["message"]="Unable to cancel that Reservation";
}

    $dao->closeConnection();
    echo json_encode($returnValue);
?>

