<?php
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = mysqli_connect("localhost","root","","data");
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
  $confirmPassword = $_POST['confirmPassword'];

  // Perform any necessary data validation here...
  if ($password !== $confirmPassword) {
    die("Password and Confirm Password do not match!");
  }
  // Prepare the SQL statement
  $sql = "INSERT INTO signup (Username, Email, Password) VALUES (?, ?, ?, ?)";
  
  // Create a prepared statement
  $stmt = mysqli_prepare($conn, $sql);
  
  // Bind the parameters to the statement
  mysqli_stmt_bind_param($stmt, "ssss", $username, $email, $password);

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


// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "data";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form values
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Prepare and execute SQL query
    $sql = "SELECT * FROM cred WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $sql);

    // Check if a matching record is found
    if (mysqli_num_rows($result) == 1) {
        // Redirect to a new page upon successful login
        header("Location: ../Html/Home.html");
        exit();
    } else {
        $errorMessage = "Invalid email or password. Please try again.";
    }
}
?>