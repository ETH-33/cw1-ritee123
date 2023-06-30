<?php
    include "signup.php";
?>
<!DOCTYPE html>
<html>

<head>
	<meta name="description"
		content="Welcome to our Login page! Access your account securely and conveniently. Stay connected and enjoy a seamless user experience on our platform.">
	<title>Login</title>
	<meta name="keywords" content="webpage, clickIT, technology, e-commerce, promotion">
    <meta name="author" content="Ritee Adhikari">
	<link rel="stylesheet" href="/css/register.css">
	<script src="/js/validation.js" defer></script>

</head>

<body>
	<div class="login_main">
		<input type="checkbox" id="chk">

		<!-- Signup page -->
		<div class="signup">
			<form id="signupForm" name="signupForm">
				<label for="chk">Sign up</label>
				<input type="text" id="name" name="name" placeholder="Username" required="">
				<input type="email" id="email" name="email" placeholder="Email" required="">
				<input type="password" id="password" name="password" placeholder="Password" required="">
				<button type="submit"  onclick="window.location.href='../index.html'">Sign Up</button>
			</form>
		</div>

		<!-- Login page -->
		<div class="login">
			<form name="loginForm" onsubmit="return validateLoginForm()">
				<label for="chk">Login</label>
				<input type="email" name="email" placeholder="Email" required="">
				<input type="password" name="password" placeholder="Password" required="">
				<button type="submit"  onclick="window.location.href='../index.html'">Login</button>
			</form>
		</div>
	</div>

	<script>
// Function to validate the signup form
  function submitForm(event) {
  event.preventDefault(); // Prevent form submission

  // Retrieve form values
  const username = document.getElementById('username').value;
  const email = document.getElementById('email').value;
  const password = document.getElementById('password').value;
  const confirmPassword = document.getElementById('confirmPassword').value;

  // Validate form fields
  const errors = [];

  if (Username) {
    errors.push('Please enter your username.');
  }

  if (!email) {
    errors.push('Please enter your email.');
  } else {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.match(emailRegex)) {
      errors.push('Invalid email format.');
    }
  }

  if (!password) {
    errors.push('Please enter a password.');
  }

  if (!confirmPassword) {
    errors.push('Please confirm your password.');
  }

  if (password !== confirmPassword) {
    errors.push('Passwords do not match.');
  }

  // Display validation errors if any
  if (errors.length > 0) {
    showFlashMessage(errors);
    return;
  }

  // Submit the form if all validations pass
  document.getElementById('signupForm').submit();
}

function showFlashMessage(messages) {
  const flashMessage = document.getElementById('flashMessage');
  flashMessage.innerHTML = ''; // Clear previous messages

  messages.forEach((message) => {
    const errorElement = document.createElement('p');
    errorElement.textContent = message;
    flashMessage.appendChild(errorElement);
  });

  flashMessage.style.display = 'block';

  setTimeout(function() {
    flashMessage.style.display = 'none';
  }, 3000); // Hide the message after 3 seconds (adjust as needed)
}

		// Function to validate the login form
		function validateLoginForm() {
			var email = document.forms["loginForm"]["email"].value;
			var password = document.forms["loginForm"]["password"].value;

			if (email === "" || password === "") {
				alert("Please fill in all fields");
				return false;
			}

			//  logic if validation successfull

			alert("Logged in Successfully!");
		}
	</script>

</body>

</html>