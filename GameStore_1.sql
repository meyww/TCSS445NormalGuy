SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `GameStore`;
CREATE DATABASE IF NOT EXISTS `GameStore`;
USE `GameStore`;

--
-- Database: `GameStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CusId` int(11) NOT NULL,
  `CFname` varchar(100) NOT NULL,
  `CMname` varchar(100) DEFAULT NULL,
  `CLname` varchar(100) NOT NULL,
  `CEmail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CusId`, `CFname`, `CMname`, `CLname`, `CEmail`) VALUES
(501, 'John', 'A', 'Doe', 'john.doe@email.com'),
(502, 'Jane', 'B', 'Smith', 'jane.smith@email.com'),
(503, 'Robert', 'C', 'Johnson', 'robert.johnson@email.com'),
(504, 'Emily', NULL, 'Davis', 'emily.davis@email.com'),
(505, 'Michael', 'D', 'Taylor', 'michael.taylor@email.com'),
(506, 'Jessica', 'E', 'Brown', 'jessica.brown@email.com'),
(507, 'David', NULL, 'Jones', 'david.jones@email.com'),
(508, 'Sara', 'F', 'Miller', 'sara.miller@email.com'),
(509, 'William', 'G', 'Garcia', 'william.garcia@email.com'),
(510, 'Karen', NULL, 'Wilson', 'karen.wilson@email.com'),
(514, 'S', 'H', 'L', 'soel2@uw.edu');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmpId` int(11) NOT NULL,
  `EFname` varchar(100) NOT NULL,
  `ELname` varchar(100) NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EmpId`, `EFname`, `ELname`, `Email`) VALUES
(401, 'Jack', 'All', 'jack.all@email.com'),
(402, 'Jene', 'Gen', 'jene.gen@email.com'),
(403, 'Ron', 'John', 'robert.john@email.com'),
(404, 'Emie', 'Dave', 'emie.dave@email.com'),
(405, 'Mich', 'Tor', 'mich.tor@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE `Games` (
  `GameId` int(11) NOT NULL,
  `GameName` varchar(200) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Developers` varchar(1000) DEFAULT NULL,
  `Release_Date` date NOT NULL,
  `StkQty` int(11) DEFAULT 0,
  `PId` int(11) DEFAULT NULL,
  `GenId` int(11) DEFAULT NULL,
  `Digital_Or_Physical` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`GameId`, `GameName`, `Description`, `Developers`, `Release_Date`, `StkQty`, `PId`, `GenId`, `Digital_Or_Physical`, `Price`) VALUES
(301, 'Counter-Strike 2', 'For over two decades, Counter-Strike has offered an elite competitive experience, one shaped by millions of players from across the globe.', 'Valve', '2012-08-21', 100, 103, 201, 0, 59.99),
(302, 'Baldurs Gate 3', 'Baldurs Gate 3 is a story-rich, party-based RPG set in the universe of Dungeons & Dragons, where your choices shape a tale of fellowship and betrayal, survival and sacrifice, and the lure of absolute power.', 'Larian Studios', '2023-08-03', 150, 101, 203, 1, 49.99),
(303, 'Marvels Spider-Man Remastered', 'In Marvels Spider-Man Remastered, the worlds of Peter Parker and Spider-Man collide in an original action-packed story.', 'Insomniac Games', '2022-08-12', 50, 102, 201, 1, 39.99),
(304, 'Marvels Spider-Man: Miles Morales', 'After the events of Marvels Spider-Man Remastered, teenage Miles Morales is adjusting to his new home while following in the footsteps of his mentor, Peter Parker, as a new Spider-Man.', 'Insomniac Games', '2022-08-12', 100, 101, 202, 0, 59.99),
(305, 'Epic Battle', 'A thrilling action-packed game', 'GameStudios', '2022-10-01', 120, 101, 201, 1, 59.99),
(306, 'Mystery Mansion', 'An immersive adventure in a haunted mansion', 'SpookyGames', '2023-01-15', 70, 102, 202, 0, 39.99),
(307, 'Kingdom Quest', 'Role-playing game set in a mystical land', 'FantasyDev', '2023-02-20', 150, 103, 203, 1, 49.99),
(308, 'City Builder', 'Construct and manage your own city', 'SimTech', '2023-03-10', 100, 103, 204, 0, 29.99),
(309, 'Empire Wars', 'Strategize and conquer rival empires', 'StratSoft', '2023-04-01', 70, 104, 205, 1, 59.99),
(310, 'Soccer Champions', 'A realistic soccer playing experience', 'SportyGames', '2023-06-15', 130, 101, 206, 0, 49.99),
(311, 'Speed Racers', 'Experience the thrill of high-speed racing', 'RaceZone', '2023-07-20', 80, 102, 207, 1, 29.99),
(312, 'Deep Darkness', 'Survival horror in an underground world', 'DarkSideGames', '2023-08-25', 120, 103, 208, 0, 59.99);

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `GenreId` int(11) NOT NULL,
  `Gname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`GenreId`, `Gname`) VALUES
(201, 'Action'),
(202, 'Adventure'),
(203, 'Role-playing'),
(204, 'Simulation'),
(205, 'Strategy'),
(206, 'Sports'),
(207, 'Racing'),
(208, 'Horror'),
(209, 'Puzzle'),
(210, 'Fighting');

-- --------------------------------------------------------

--
-- Table structure for table `Invoices`
--

CREATE TABLE `Invoices` (
  `InvoiceId` int(11) NOT NULL,
  `EId` int(11) DEFAULT NULL,
  `CId` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `Tax` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Invoices`
--

INSERT INTO `Invoices` (`InvoiceId`, `EId`, `CId`, `Subtotal`, `Tax`) VALUES
(601, 401, 501, 119.98, 11.99),
(602, 402, 502, 49.99, 49.90),
(603, 403, 503, 349.95, 34.90),
(604, 404, 504, 119.97, 11.99),
(605, 405, 505, 239.96, 23.99),
(606, 402, 506, 59.99, 5.99),
(607, 403, 507, 299.94, 29.99),
(608, 404, 508, 109.98, 10.99),
(609, 402, 509, 174.93, 17.49),
(610, 405, 510, 49.99, 4.99);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `InvId` int(11) NOT NULL,
  `GId` int(11) NOT NULL,
  `Qty` int(11) DEFAULT 0,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`InvId`, `GId`, `Qty`, `Total`) VALUES
(601, 301, 2, 119.98),
(602, 302, 1, 49.99),
(603, 303, 5, 349.95),
(604, 304, 3, 119.97),
(605, 305, 4, 239.96),
(606, 302, 1, 59.99),
(607, 303, 6, 299.94),
(608, 304, 2, 109.98),
(609, 302, 7, 174.93),
(610, 305, 1, 49.99);

-- --------------------------------------------------------

--
-- Table structure for table `Platforms`
--

CREATE TABLE `Platforms` (
  `PlatformId` int(11) NOT NULL,
  `Pname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Platforms`
--

INSERT INTO `Platforms` (`PlatformId`, `Pname`) VALUES
(101, 'XBOX'),
(102, 'PLAYSTATION'),
(103, 'PC'),
(104, 'SWITCH');

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `ReviewId` int(11) NOT NULL,
  `GameId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `Rating` int(11) NOT NULL,
  `Review` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`ReviewId`, `GameId`, `UserId`, `Rating`, `Review`) VALUES
(701, 301, 501, 4, 'Enjoyed the intense action!'),
(702, 302, 502, 5, 'Fantastic storytelling and characters.'),
(703, 303, 503, 3, 'Liked the graphics but expected more content.'),
(704, 304, 504, 4, 'Great addition to the Spider-Man series.'),
(705, 305, 505, 5, 'Epic battles and amazing graphics.'),
(706, 302, 506, 5, NULL),
(707, 303, 507, 2, NULL),
(708, 304, 508, 5, NULL),
(709, 302, 509, 5, NULL),
(710, 305, 510, 1, 'I do not like it');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CusId`),
  ADD UNIQUE KEY `CEmail` (`CEmail`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmpId`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`GameId`),
  ADD KEY `PId` (`PId`),
  ADD KEY `GenId` (`GenId`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`GenreId`);

--
-- Indexes for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`InvoiceId`),
  ADD KEY `EId` (`EId`),
  ADD KEY `CId` (`CId`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`InvId`,`GId`),
  ADD KEY `GId` (`GId`);

--
-- Indexes for table `Platforms`
--
ALTER TABLE `Platforms`
  ADD PRIMARY KEY (`PlatformId`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`ReviewId`),
  ADD KEY `GameId` (`GameId`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=515;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`PId`) REFERENCES `Platforms` (`PlatformId`) ON DELETE SET NULL,
  ADD CONSTRAINT `Games_ibfk_2` FOREIGN KEY (`GenId`) REFERENCES `Genres` (`GenreId`) ON DELETE SET NULL;

--
-- Constraints for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD CONSTRAINT `Invoices_ibfk_1` FOREIGN KEY (`EId`) REFERENCES `Employee` (`EmpId`) ON DELETE SET NULL,
  ADD CONSTRAINT `Invoices_ibfk_2` FOREIGN KEY (`CId`) REFERENCES `Customers` (`CusId`) ON DELETE SET NULL;

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `Items_ibfk_1` FOREIGN KEY (`InvId`) REFERENCES `Invoices` (`InvoiceId`) ON DELETE CASCADE,
  ADD CONSTRAINT `Items_ibfk_2` FOREIGN KEY (`GId`) REFERENCES `Games` (`GameId`) ON DELETE CASCADE;

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`GameId`) REFERENCES `Games` (`GameId`) ON DELETE CASCADE,
  ADD CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `Customers` (`CusId`) ON DELETE SET NULL;
COMMIT;

