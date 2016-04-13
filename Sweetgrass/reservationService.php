<?php

//Create connection
$con=mysqli_connect("db.soic.indiana.edu","caps16_team17","my+sql=caps16_team17","caps16_team17");

//Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

//This SQL statement selects ALL from the table 'reservations'
$sql = "SELECT * FROM reservations";

if ($result = mysqli_query($con, $sql))
{
	$resultArray = array();
	$tempArray = array();

	while($row = $result->fetch_object())
	{
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}

	echo json_encode($resultArray);
}

mysqli_close($con);
?>
