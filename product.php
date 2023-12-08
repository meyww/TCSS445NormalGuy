<!-- <?php require_once('config.php'); ?> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Normal Guys</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/game.css">
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
        <div class="jumbotron">
            <h1 class="display-4">Discover Exciting Games</h1>
            <p class="lead">Explore our diverse collection of games and find your next gaming adventure!</p>
            <hr class="my-4">
            <?php
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
            if ( mysqli_connect_errno() )
            {
                die( mysqli_connect_error() );
            }
            ?>
            <p>&nbsp;</p>
            <table class="table table-hover">
                <thead>
                    <tr class="table-success">
                        <th scope="col">Game Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Developers</th>
                        <th scope="col">Platform</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Price</th>
                        <th scope="col">Digital/Physical</th>
                        <th scope="col">Stock Quantity</th>
                        <th scope="col">Release Date</th>
                    </tr>
                </thead>
                    <?php
                    if ( mysqli_connect_errno() )
                    {
                        die( mysqli_connect_error() );
                    }

                    $sql = "SELECT G.GameName, G.Description, G.Developers, P.Pname, Gen.Gname, G.Digital_Or_Physical, G.Price, G.StkQty, G.Release_Date
                            FROM Games G JOIN Platforms P ON G.PId = P.PlatformId JOIN Genres Gen ON G.GenId = Gen.GenreId;";

                    if ($result = mysqli_query($connection, $sql))
                    {
                        while($row = mysqli_fetch_assoc($result))
                        {
                    ?>
                    <tr>
                        <td><?php echo $row['GameName'] ?></td>
                        <td><?php echo $row['Description'] ?></td>
                        <td><?php echo $row['Developers'] ?></td>
                        <td><?php echo $row['Pname'] ?></td>
                        <td><?php echo $row['Gname'] ?></td>
                        <td><?php echo '$' . $row['Price'] ?></td>
                        <td><?php
                        if ($row['Digital_Or_Physical'] == 0) {
                            $dgiphy = "Digital";
                        } else {
                            $dgiphy = "Physical";
                        }echo $dgiphy ?></td>
                        <td><?php echo $row['StkQty'] ?></td>
                        <td><?php echo $row['Release_Date'] ?></td>
                    </tr>
                    <?php
                        }
                        // release the memory used by the result set
                        mysqli_free_result($result);
                    }
                    ?>
            </table>
        </div>
    </main>

    <footer>
        <p>&copy; 2023 Normal Guys. All rights reserved.</p>
    </footer>
</body>

</html>
