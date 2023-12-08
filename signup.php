<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Status Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 50px;
            }
            .success {
                color: green;
            }
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <a href="index.html">Back to HomePage</a>

        <?php
        // Replace this condition with your actual logic
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get user input from the form
        $firstname = $_POST["firstname"];
        $middlename = $_POST["middlename"];
        $lastname = $_POST["lastname"];
        $email = $_POST["email"];

        $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
        if (mysqli_connect_errno()) {
            die(mysqli_connect_error());
        }

            // Prepare and execute SQL query to insert data into the Customers table
            $sql = "INSERT INTO Customers (CFname, CMname, CLname, CEmail) VALUES ('$firstname', '$middlename', '$lastname', '$email')";

            if ($result = mysqli_query($connection, $sql)) {
                echo "Registration successful! Welcome, $firstname!";
            } else {
                echo "Email address is already registered. Please use a different email.";
            }
            mysqli_free_result($result);
            mysqli_close($connection);
        }
        ?>


    </body>
</html>