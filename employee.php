<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Normal Guys</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/employee.css">
    </head>

    <body>
        <header>
            <nav>
                <div class="logo">
                    <a href="about.html"><img src="img/logo.png" alt="Normal Guys"></a>
                </div>
                <div class="nav-links">
                    <ul>
                        <li><a href="index.php">Home</a></li>
                        <li><a href="employee.php">Employee</a></li>
                        <li><a href="review.php">Game Review</a></li>
                        <li><a href="product.php">Products</a></li>
                        <li><a href="about.html">About Us</a></li>
                    </ul>
                </div>
                <div class="nav-buttons" id="nav-buttons">
                    <a href="singup.html" class="sign-up" id="button">Sign up</a>
                    <a href="#" style="display:none;" id="manage-button">Manage Account</a> 
                </div>
            </nav>
        </header>

        <main>
            <h2>Employee</h2>

            <!-- Search form for Last Name -->
            <form method="GET" action="employee.php">
                <label for="last_name">Search by last name:</label>
                <input type="text" name="last_name" id="last_name">
                <input type="submit" value="Search">
            </form>

            <!-- Display search results -->
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['last_name'])) {
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
                if (mysqli_connect_errno()) {
                    die(mysqli_connect_error());
                }

                $last_name = mysqli_real_escape_string($connection, $_GET['last_name']);

                // Display selected employee details
            ?>
            <p>&nbsp;</p>
            <table class="table table-hover">
                <thead>
                    <tr class="table-success">
                        <th scope="col">Employee ID</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Total Written Invoices</th>
                    </tr>
                </thead>
                <?php
                $sql = "SELECT E.EmpId, E.ELname, E.EFname, E.Email, COUNT(*) AS TotalInvoices
                        FROM Employee E LEFT JOIN Invoices I ON E.EmpId = I.EId
                        WHERE ELname = '{$_GET['last_name']}'
                        GROUP BY E.EmpId, E.ELname, E.EFname, E.Email;";
                if ($result = mysqli_query($connection, $sql)) {
                    while ($row = mysqli_fetch_assoc($result)) {
                ?>
                <tr>
                    <td><?php echo $row['EmpId'] ?></td>
                    <td><?php echo $row['EFname'] ?></td>
                    <td><?php echo $row['ELname'] ?></td>
                    <td><?php echo $row['Email'] ?></td>
                    <td><?php echo $row['TotalInvoices'] ?></td>
                </tr>
                <?php
                    }
                    // release the memory used by the result set
                    mysqli_free_result($result);
                }
                mysqli_close($connection);
            }
                ?>
            </table>
        </main>

        <footer>
            <p>&copy; 2023 Normal Guys. All rights reserved.</p>
        </footer>
    </body>
</html>

