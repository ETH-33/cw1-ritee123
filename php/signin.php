<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "ritee";

// Create connection
$conn = mysqli_connect("localhost","root","","ritee");
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Retrieve form data
  $username = $_POST['username'];
  $email = $_POST['email'];
  $password = $_POST['password'];
 

  //Hashed Password
  $hashedPassword = md5($password);

  // Prepare the SQL statement
  $sql = "INSERT INTO Cred (username, Email, Password) VALUES (?, ?, ?, ?)";
  
  // Create a prepared statement
  $stmt = mysqli_prepare($conn, $sql);

  // Bind the parameters to the statement
  mysqli_stmt_bind_param($stmt, "ssss", $username, $email, $hashedPassword);

  // Execute the statement
  if (mysqli_stmt_execute($stmt)) {
    header("Location: ../Html/Login.php");
  } else {
      echo "Error: " . mysqli_stmt_error($stmt);
  }

  // Close the statement
  mysqli_stmt_close($stmt);

  // Close the database connection
  mysqli_close($conn);
}

?>