<html>
  <body>

    <form action="selectdept.php" method="post">
      <h4> See all the staff members within a given department </h4>
    Department: <select name='form_department'>
<?php
$conn = mysqli_connect("db.luddy.indiana.edu","i308f20_team08","my+sql=i308f20_team08","i308f20_team08");
  //Check connection
  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  $results = mysqli_query($conn, "SELECT id, name FROM department");
  while ($row = mysqli_fetch_assoc($results)) {
    unset($id, $name);
    $id = $row['id'];
    $name = $row['name'];
    echo '<option value=".$id.">'.$name.'</option>';
  }
?>
</select><br>
<input type="submit" value ="Show Query1" >
</form>

<form action="q2.php" method="post">
  <h4> Find the room a patient stayed in on </h4>
    <input type='date' name='form_date'
    min="2019-01-01" max="2020-12-31">
<!-- <?php
$conn = mysqli_connect("db.luddy.indiana.edu","i308f20_team08","my+sql=i308f20_team08","i308f20_team08");
//Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}
$results = mysqli_query($conn, "SELECT id, name FROM department");
while ($row = mysqli_fetch_assoc($results)) {
unset($id, $name);
$id = $row['name'];
$name = $row['name'];
echo '<option value=".$id.">'.$name.'</option>';
}
?> -->
</select><br>
<input type="submit" value ="Show Query1" >
</form>

  </body>
</html>/
