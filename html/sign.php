<?php
    include "signin.php";
?>
<!DOCTYPE html>
<html>

<head>
    <meta name="description"
        content="Welcome to our Login page! Access your account securely and conveniently. Stay connected and enjoy a seamless user experience on our platform.">
    <title>Login</title>
    <meta name="keywords" content="webpage, clickIT, technology, e-commerce, promotion">
    <meta name="author" content="Arun joshi">
    <link rel="stylesheet" href="../css/sign.css">
</head>

<body>
    <div class="login_main">
        <input type="checkbox" id="chk">

        <!-- Signup page -->
        <div class="signup">
            <form name="signupForm" onsubmit="return submitSignUpForm(event)">
                <label for="chk">Sign up</label>
                <input type="text" id="username" name="username" placeholder="User name" required="">
                <input type="email" id="email" name="email" placeholder="Email" required="">
                <input type="password" id="password" name="password" placeholder="Password" required="">
                <button type="submit" href="../html/contact.html">Sign Up</button>
            </form>
        </div>

        <!-- login page -->
        <div class="login">
            <form name="loginForm" onsubmit="return submitSignInForm(event)">
                <label for="chk">Login</label>
                <input type="email" id="email" name="email" placeholder="Email" required="">
                <input type="password" id="password" name="password" placeholder="Password" required="">
                <button type="submit" href="../html/Contact.html">Login</button>
            </form>
        </div>
    </div>

    <!-- Flash Message -->
    <div id="flashMessage" style="display: none;"></div>

    <!-- sign up -->
    <script>
        function submitSignUpForm(event) {
            event.preventDefault(); // Prevent form submission

            // Retrieve form values
            const username = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            // Validate form fields
            const errors = [];

            if (!username) {
                errors.push('Please enter a username.');
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
            } else {
                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!password.match(passwordRegex)) {
                    errors.push(
                        'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.'
                    );
                }
            }

            // Display validation errors if any
            if (errors.length > 0) {
                showFlashMessage(errors);
                return;
            }

            // Submit the form if all validations pass
            // Add your sign-up logic here
            // For example, you can make an AJAX request to a server-side endpoint to handle the sign-up process
            // Here's an example using fetch API:
            const signUpData = {
                username: username,
                email: email,
                password: password
            };

            fetch('/signup', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(signUpData)
            })
                .then(response => {
                    // Handle the response from the server
                    if (response.ok) {
                        // Sign-up successful, redirect or perform necessary actions
                        window.location.href = '/dashboard'; // Redirect to the dashboard page
                    } else {
                        // Sign-up failed, display error message
                        throw new Error('Failed to sign up. Please try again.'); // Customize error message as needed
                    }
                })
                .catch(error => {
                    // Handle any errors that occurred during sign-up
                    showFlashMessage([error.message]);
                });
        }

        function showFlashMessage(messages) {
            const flashMessage = document.getElementById('flashMessage');
            flashMessage.innerHTML = ''; // Clear previous messages

            messages.forEach(message => {
                const errorElement = document.createElement('p');
                errorElement.textContent = message;
                flashMessage.appendChild(errorElement);
            });

            flashMessage.style.display = 'block';

            setTimeout(function () {
                flashMessage.style.display = 'none';
            }, 3000); // Hide the message after 3 seconds (adjust as needed)
        }
    </script>


    <!-- sign in form -->
    <script>
        function submitSignInForm(event) {
            event.preventDefault(); // Prevent form submission

            // Retrieve form values
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            // Validate form fields
            const errors = [];

            if (!email) {
                errors.push('Please enter your email.');
            } else {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!email.match(emailRegex)) {
                    errors.push('Invalid email format.');
                }
            }

            if (!password) {
                errors.push('Please enter your password.');
            }

            // Display validation errors if any
            if (errors.length > 0) {
                showFlashMessage(errors);
                return;
            }

            // Submit the form if all validations pass
            // Add your sign-in logic here
            // For example, you can make an AJAX request to a server-side endpoint to handle the sign-in process
            // Here's an example using fetch API:
            const signInData = {
                email: email,
                password: password
            };

            fetch('/signin', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(signInData)
            })
                .then(response => {
                    // Handle the response from the server
                    if (response.ok) {
                        // Sign-in successful, redirect or perform necessary actions
                        window.location.href = '/dashboard'; // Redirect to the dashboard page
                    } else {
                        // Sign-in failed, display error message
                        throw new Error('Invalid email or password.'); // Customize error message as needed
                    }
                })
                .catch(error => {
                    // Handle any errors that occurred during sign-in
                    showFlashMessage([error.message]);
                });
        }

        function showFlashMessage(messages) {
            const flashMessage = document.getElementById('flashMessage');
            flashMessage.innerHTML = ''; // Clear previous messages

            messages.forEach(message => {
                const errorElement = document.createElement('p');
                errorElement.textContent = message;
                flashMessage.appendChild(errorElement);
            });

            flashMessage.style.display = 'block';

            setTimeout(function () {
                flashMessage.style.display = 'none';
            }, 3000); // Hide the message after 3 seconds (adjust as needed)
        }

    </script>
</body>

</html>