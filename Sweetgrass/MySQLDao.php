<?php
class MySQLDao {
var $dbhost = null;
var $dbuser = null;
var $dbpass = null;
var $conn = null;
var $dbname = null;
var $result = null;

function __construct($dbhost, $dbuser, $dbpassword, $dbname) {
$this->dbhost = $dbhost;
$this->dbuser = $dbuser;
$this->dbpass = $dbpassword;
$this->dbname = $dbname;
}

public function openConnection() {

$this->conn = new mysqli($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
if (mysqli_connect_errno())
  echo "error!";
$this->conn->set_charset("utf8");
}

public function getConnection() {
return $this->conn;
}

public function closeConnection() {
if ($this->conn != null)
$this->conn->close();
}

public function getUserDetailsWithPassword($email, $password) {
	$returnValue = array();
	$sql = "select * from users where email='" . $email . "' and password ='" .$password . "'";
	$result = $this->conn->query($sql);
	if ($result != null && (mysqli_num_rows($result) >= 1)) {
		$row = $result->fetch_array(MYSQLI_ASSOC);
		if (!empty($row)) {
			$returnValue = $row;
		}
	}
	return $returnValue;
}

public function getmenu() {
	$returnValue = array();
	$sql = "select * from menu";
	$result = $this->conn->query($sql);
	$row = array();
	while($row = $result->fetch_array(MYSQLI_ASSOC)) {
		//$row = $result->fetch_array(MYSQLI_ASSOC);
		$returnValue[$row["name"]] = $row;
		//echo json_encode($row);		
	}
	//$returnValue[] = $row;
	echo json_encode($returnValue);
	return 1;
}

public function couponvalid($code) {
	$returnValue = array();
	$sql = "select * from coupons where code='".$code."'";
	$result = $this->conn->query($sql);
	if ($result != null && (mysqli_num_rows($result) >= 1)) {
		$row = $result->fetch_array(MYSQLI_ASSOC);
		if (!empty($row)) {
			$returnValue = $row;
		}
	}
	return $returnValue;
}
public function getUserDetails($email)
{
$returnValue = array();
$sql = "select * from users where email='" . $email . "'";
$result = $this->conn->query($sql);
if ($result != null && (mysqli_num_rows($result) >= 1)) {
$row = $result->fetch_array(MYSQLI_ASSOC);
if (!empty($row)) {
$returnValue = $row;
}
}
return $returnValue;
}

public function getUserfeedback($comment)
{
$returnValue = array();
$sql = "select * from Feedback where comment='" . $comment . "'";
$result = $this->conn->query($sql);
if ($result != null && (mysqli_num_rows($result) >= 1)) {
$row = $result->fetch_array(MYSQLI_ASSOC);
if (!empty($row)) {
$returnValue = $row;
}
}
return $returnValue;
}

public function registerUser($email, $fname, $lname, $phone, $password)
{
$sql = "insert into users set email=?, fname=?, lname=?, phone=?, password=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("sssss", $email, $fname, $lname, $phone, $password);
$returnValue = $statement->execute();

return $returnValue;
}

public function makeReservation($userid, $partySize, $date, $time)
{
$sql = "insert into reservations set userid=?, partySize=?, date=?, time=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("ssss", $userid, $partySize, $date, $time);
$returnValue = $statement->execute();

return $returnValue;
}

public function updateUserinfo($fname, $lname, $phone, $email)
{
$sql = "update users set fname=?, lname=?, phone=? where email=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("ssss", $fname, $lname, $phone, $email);
$returnValue = $statement->execute();

return $returnValue;
}

public function updateUserpassword($email, $password)
{
$sql = "update users set password=? where email=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("ss", $password, $email);
$returnValue = $statement->execute();

return $returnValue;
}

public function updateUseremail($old, $new)
{
$sql = "update users set email=? where email=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("ss", $new, $old);
$returnValue = $statement->execute();

return $returnValue;
}

public function leavefeedback($comment, $star)
{
$sql = "insert into Feedback set comment=?, star=?";
$statement = $this->conn->prepare($sql);

if (!$statement)
throw new Exception($statement->error);

$statement->bind_param("ss", $comment, $star);
$returnValue = $statement->execute();

return $returnValue;
}

public function coupon($code)
{
$sql = "select * from coupons where code =?";
$statement = $this->conn->prepare($sql);

$statement->bind_param("s", $code);
$returnValue = $statement->execute();

return $returnValue;
}



public function getCartList($userid)
{
    $returnValue = array();
    
    $sql = "select * from Cart where idUser = ".$userid;
    $result = $this->conn->query($sql);
    if ($result != null &&(mysqli_num_rows($result)>0))
    {
        foreach ($result as $key => $value)
        {
            $returnValue[$key] = $value;
        }
    }
    return $returnValue;
}

public function addOrder($userId,$menuId,$couponId,$mount,$tax)
{
    $sql = "insert into Order set idMenu=? , idUser=?, idCoupon=?, mount=?, tax=?";
    $statement = $this->conn->prepare($sql);
    
    $statement->bind_param("ss", $menuId,$userId,$couponId,$mount,$tax);
    $returnValue = $statement->execute();
    
    return $returnValue;
}


public function getOrderList($userid)
{
    $returnValue = array();

    $sql = "select * from Order where idUser = ".$userid;
    $result = $this->conn->query($sql);
    if ($result != null &&(mysqli_num_rows($result)>0))
    {
        foreach ($result as $key => $value)
        {
            $returnValue[$key] = $value;
        }
    }
    return $returnValue;
}

}
?>
