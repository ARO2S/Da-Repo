<?php

$con = mysqli_connect("db.luddy.indiana.edu","i308f20_andsross","my+sql=i308f20_andsross","i308f20_andsross");

// Check connection

if (mysqli_connect_errno())

   { die("Failed to connect to MySQL: " . mysqli_connect_error()); }

else

   { echo "Established Database Connection";}

//escape variables for security sql injection

$sanfname = mysqli_real_escape_string($con, $_POST['form_artistfname']);

$sanlname = mysqli_real_escape_string($con, $_POST['form_artistlname']);

//Insert query to insert form data into the artist table

$sql = "INSERT INTO artist (fname, lname) VALUES ('$sanfname','$sanlname')";

//check for error on insert

if (mysqli_query($con,$sql)) {

  echo "<br>1 record added";

  //Show Table

  $sql = "SELECT fname, lname FROM artist";
  $result = $con->query($sql);

  if ($result->num_rows > 0) {
    echo "<table border='1px black'><tr><th>First name</th><th>Last name</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "<tr><td>".$row["fname"]."</td><td>".$row["lname"]."</td></tr>";
    }
    echo "</table>";
  } else {
    echo "0 results";
  }

} else { die("SQL Error: " . mysqli_error($con)); }

mysqli_close($con);
?>
