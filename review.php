<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Normal Guys</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/review.css">
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
                <a href="signup.html" class="sign-up" id="button">Sign up</a>
                <a href="#" style="display:none;" id="manage-button">Manage Account</a>
            </div>
        </nav>
    </header>
    <main>
        <h2>Game Reviews</h2>

        <!-- Form with dropdown for selecting rating -->
        <form method="GET" action="review.php">
            <label for="rating">Select Rating:</label>
            <select name="rating" onchange='this.form.submit()'>
                <option selected>Select a rating</option>
                <option value="1">1 Star</option>
                <option value="2">2 Stars</option>
                <option value="3">3 Stars</option>
                <option value="4">4 Stars</option>
                <option value="5">5 Stars</option>
            </select>
        </form>

        <?php
        $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
        if (mysqli_connect_errno()) {
            die(mysqli_connect_error());
        }

        // Check if a rating is selected
        if (isset($_GET['rating']) && $_GET['rating'] !== "") {
            $selectedRating = mysqli_real_escape_string($connection, $_GET['rating']);

            // SQL query to retrieve reviews with the selected rating
            $sql = "SELECT G.GameName, C.CusId, R.Rating, R.Review
                    FROM Reviews R
                    JOIN Games G ON R.GameId = G.GameId
                    JOIN Customers C ON R.UserId = C.CusId
                    WHERE R.Rating = '$selectedRating'
                    ORDER BY Rating DESC;";

            if ($result = mysqli_query($connection, $sql)) {
        ?>
                <div class="jumbotron">
                    <table class="table table-hover">
                        <thead>
                            <tr class="table-success">
                                <th scope="col">Game Name</th>
                                <th scope="col">Customer ID</th>
                                <th scope="col">Rating</th>
                                <th scope="col">Review</th>
                            </tr>
                        </thead>
                        <?php
                        while ($row = mysqli_fetch_assoc($result)) {
                        ?>
                            <tr>
                                <td><?php echo $row['GameName'] ?></td>
                                <td><?php echo $row['CusId'] ?></td>
                                <td><?php echo $row['Rating'] ?></td>
                                <td><?php echo $row['Review'] == NULL ? "No comment" : $row['Review']; ?></td>
                            </tr>
                        <?php
                        }
                        // release the memory used by the result set
                        mysqli_free_result($result);
                        ?>
                    </table>
                </div>
        <?php
            }
        }
        ?>
    </main>
    <footer>
        <p>&copy; 2023 Normal Guys. All rights reserved.</p>
    </footer>
    </body>

</html>

