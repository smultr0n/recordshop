-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2021 at 01:22 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `artist` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`artist_id`, `artist`) VALUES
(1, 'Ovlov'),
(2, 'Aphex Twin'),
(3, 'Boards of Canada'),
(4, 'Candy Claws'),
(5, 'Weatherday'),
(6, 'Squarepusher'),
(7, 'Godspeed You! Black Emperor'),
(8, 'Patetfisk'),
(9, 'Animal Collective'),
(10, 'Oneothrix Point Never'),
(11, 'Goreshit'),
(12, 'Sweet Trip');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city`) VALUES
(1, 'SKIVARP'),
(2, 'NORRALA'),
(3, 'KVIDINGE'),
(4, 'SKÄRPLINGE'),
(5, 'sfvsdvfasdfv'),
(6, 'sfgbåpl');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` int(11) NOT NULL,
  `postcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `street`, `city`, `postcode`) VALUES
(77, 'Bea Henriksson', 'beahenriksson@armyspy.com', '0411218667', 'Käbbatorp Locketorp 11', 1, '27010'),
(78, 'Yousef Blom', 'YousefBlom@teleworm.us', '0270939467', 'Mellangården 91', 2, '82604'),
(79, 'Miranda Jonsson', 'MirandaJonsson@jourrapide.com', '0708894105', ' Klövervägen 29', 3, '26060'),
(80, 'Kristian Dahlberg', 'KristianDahlberg@jourrapide.com', '0294636879', ' Föreningsgatan 21', 4, '81065'),
(81, 'fgh', 'elias.gustafsson@yh.nackademin.se', '3485', 'pkiofef 54', 5, '12345'),
(82, 'fgh', 'elias.gustafsson@yh.nackademin.se', '2348', 'aiopjfv 31', 6, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `label_id` int(11) NOT NULL,
  `label` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`label_id`, `label`) VALUES
(1, 'Darla Records'),
(2, 'Domino Recording'),
(3, 'Warp Records'),
(4, 'Kemado Records'),
(5, 'Kitty on Fire Records'),
(6, 'Sound Records'),
(8, 'R&S Records'),
(9, 'Twosyllable Records'),
(10, 'Porcelain Music'),
(11, 'kranky'),
(12, 'Molndos'),
(13, 'Exploding In Sound Records');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cust_id`, `prod_id`, `order_date`) VALUES
(1, 77, 6, '2021-02-22 09:02:44'),
(2, 78, 5, '2021-02-22 09:02:44'),
(3, 79, 12, '2021-02-22 09:02:44'),
(4, 79, 12, '2021-02-22 09:02:44'),
(5, 80, 2, '2021-02-22 09:02:44'),
(6, 81, 5, '2021-02-22 09:02:44'),
(7, 81, 5, '2021-02-22 09:02:44'),
(8, 82, 2, '2021-02-22 09:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `price_id` int(11) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`price_id`, `price`) VALUES
(1, '150'),
(2, '200'),
(3, '250'),
(4, '300'),
(5, '350'),
(6, '400');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `artist` int(11) NOT NULL,
  `tracklist` json NOT NULL,
  `label` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `img` varchar(70) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `artist`, `tracklist`, `label`, `year`, `img`, `stock`, `price`) VALUES
(1, 'Am', 1, '{\"1\": {\"title\": \"Grapes\", \"length\": \"2:47\"}, \"2\": {\"title\": \"The Well\", \"length\": \"3:18\"}, \"3\": {\"title\": \"Nu Punk\", \"length\": \"3:39\"}, \"4\": {\"title\": \"Where\'s My Dini?\", \"length\": \"4:25\"}, \"5\": {\"title\": \"Milk\", \"length\": \"5:27\"}, \"6\": {\"title\": \"Really Bees\", \"length\": \"1:46\"}, \"7\": {\"title\": \"Moth Rock\", \"length\": \"5:10\"}, \"8\": {\"title\": \"There\'s My Dini!\", \"length\": \"3:27\"}, \"9\": {\"title\": \"Blue Baby\", \"length\": \"5:05\"}, \"10\": {\"title\": \"The Great Alligator\", \"length\": \"6:57\"}}', 13, 2013, 'Am_Ovlov.jpg', 34, 1),
(2, 'Selected Ambient Works 85-92', 2, '{\"1\": {\"title\": \"Xtal\", \"length\": \"4:54\"}, \"2\": {\"title\": \"Tha\", \"length\": \"9:07\"}, \"3\": {\"title\": \"Pulsewidth\", \"length\": \"3:48\"}, \"4\": {\"title\": \"Ageispolis\", \"length\": \"5:23\"}, \"5\": {\"title\": \"I\", \"length\": \"1:17\"}, \"6\": {\"title\": \"Green Calx\", \"length\": \"6:05\"}, \"7\": {\"title\": \"Heliosphan\", \"length\": \"4:54\"}, \"8\": {\"title\": \"We Are the Music Makers\", \"length\": \"7:44\"}, \"9\": {\"title\": \"Schottkey 7th Path\", \"length\": \"5:09\"}, \"10\": {\"title\": \"Ptolemy\", \"length\": \"7:14\"}, \"11\": {\"title\": \"Hedphelym\", \"length\": \"6:04\"}, \"12\": {\"title\": \"Delphium\", \"length\": \"5:29\"}, \"13\": {\"title\": \"Actium\", \"length\": \"7:35\"}}', 8, 1992, 'Selected_Ambient_Works_85-92_Aphex_Twin.jpg', 0, 5),
(3, 'The Campfire Headphase', 3, '{\"1\": {\"title\": \"Into The Rainbow Vein\", \"length\": \"0:44\"}, \"2\": {\"title\": \"Chromakey Dreamcoat\", \"length\": \"5:47\"}, \"3\": {\"title\": \"Satellite Anthem Icarus\", \"length\": \"6:05\"}, \"4\": {\"title\": \"Peacock Tail\", \"length\": \"5:25\"}, \"5\": {\"title\": \"Dayvan Cowboy\", \"length\": \"5:00\"}, \"6\": {\"title\": \"A Moment Of Clarity\", \"length\": \"0:52\"}, \"7\": {\"title\": \"84 Pontiac Dream\", \"length\": \"3:50\"}, \"8\": {\"title\": \"Sherbet Head\", \"length\": \"2:42\"}, \"9\": {\"title\": \"Oscar See Through Red Eye\", \"length\": \"5:09\"}, \"10\": {\"title\": \"Ataronchronon\", \"length\": \"1:14\"}, \"11\": {\"title\": \"Hey Saturday Sun\", \"length\": \"4:56\"}, \"12\": {\"title\": \"Constants Are Changing\", \"length\": \"1:42\"}, \"13\": {\"title\": \"Slow This Bird Down\", \"length\": \"6:09\"}, \"14\": {\"title\": \"Tears From The Compound Eye\", \"length\": \"4:04\"}, \"15\": {\"title\": \"Farewell Fire\", \"length\": \"8:26\"}}', 3, 2005, 'The_Campfire_Headphase_Boards_of_Canada.jpg', 50, 5),
(4, 'Ceres & Calypso in the Deep Time', 4, '{\"1\": {\"title\": \"Into the Deep Time (One Sun)\", \"length\": \"3:02\"}, \"2\": {\"title\": \"White Seal (Shell & Spine)\", \"length\": \"3:44\"}, \"3\": {\"title\": \"Fell in Love (At the Water)\", \"length\": \"4:01\"}, \"4\": {\"title\": \"Pangaea Girls (Magic Feeling)\", \"length\": \"3:11\"}, \"5\": {\"title\": \"New Forest (Five Heads of the Sun)\", \"length\": \"3:24\"}, \"6\": {\"title\": \"Transitional Bird (Clever Girl)\", \"length\": \"4:26\"}, \"7\": {\"title\": \"Charade (Fern Prairie)\", \"length\": \"3:20\"}, \"8\": {\"title\": \"Fallen Tree Bridge (Brave Rainbow Rider)\", \"length\": \"3:30\"}, \"9\": {\"title\": \"Birth of the Flower (Seagreen)\", \"length\": \"3:47\"}, \"10\": {\"title\": \"Illusion (Fern Lake)\", \"length\": \"3:35\"}, \"11\": {\"title\": \"Night Ela (Mystic Thing)\", \"length\": \"5:04\"}, \"12\": {\"title\": \"Where I Found You (One Star)\", \"length\": \"3:07\"}}', 9, 2013, 'Ceres_&_Calypso_in_the_Deep_Time_Candy_Claws.jpg', 50, 2),
(5, 'Come In', 5, '{\"1\": {\"title\": \"Come In\", \"length\": \"1:36\"}, \"2\": {\"title\": \"Older Than Before\", \"length\": \"3:43\"}, \"3\": {\"title\": \"Mio, Min Mio\", \"length\": \"4:47\"}, \"4\": {\"title\": \"Sleep in While You\'re Doing Your Best\", \"length\": \"2:21\"}, \"5\": {\"title\": \"My Sputnik Sweetheart\", \"length\": \"13:44\"}, \"6\": {\"title\": \"Cut Lips\", \"length\": \"3:26\"}, \"7\": {\"title\": \"Embarrassing Paintings\", \"length\": \"3:22\"}, \"8\": {\"title\": \"Water Dreamer the Same\", \"length\": \"6:11\"}, \"9\": {\"title\": \"Painted Girl\'s Theme\", \"length\": \"3:18\"}, \"10\": {\"title\": \"Agatka\", \"length\": \"4:27\"}, \"11\": {\"title\": \"Porcelain Hands\", \"length\": \"4:29\"}}', 10, 2019, 'Come_In_Weatherday.jpg', 43, 4),
(6, 'Go Plastic', 6, '{\"1\": {\"title\": \"My Red Hot Car\", \"length\": \"4:42\"}, \"2\": {\"title\": \"Boneville Occident\", \"length\": \"4:51\"}, \"3\": {\"title\": \"Go! Spastic\", \"length\": \"6:21\"}, \"4\": {\"title\": \"Metteng Excuske v1.2\", \"length\": \"1:08\"}, \"5\": {\"title\": \"The Exploding Psycology\", \"length\": \"6:44\"}, \"6\": {\"title\": \"I Wish You Could Talk\", \"length\": \"4:54\"}, \"7\": {\"title\": \"Greenways Trajectory\", \"length\": \"7:11\"}, \"8\": {\"title\": \"Tommib\", \"length\": \"1:19\"}, \"9\": {\"title\": \"My Fucking Sound\", \"length\": \"7:05\"}, \"10\": {\"title\": \"Plaistow Flex Out\", \"length\": \"4:29\"}}', 3, 2001, 'Go_Plastic_Squarepusher.jpg', 49, 4),
(7, 'Lift Your Skinny Fists Like Antennas to Heaven', 7, '{\"1\": {\"title\": \"Storm\", \"length\": \"22:32\"}, \"2\": {\"title\": \"Static\", \"length\": \"22:36\"}, \"3\": {\"title\": \"Sleep\", \"length\": \"23:18\"}, \"4\": {\"title\": \"Like Antennas to Heaven...\", \"length\": \"18:58\"}}', 11, 2000, 'Lift_Your_Skinny_Fists_Godspeed_You!_Black_Emperor.jpg', 50, 3),
(8, 'Töcken, dunkel och liknande skildringar', 8, '{\"1\": {\"title\": \"Gläsnylle\", \"length\": \"0:22\"}, \"2\": {\"title\": \"Störd i Hjördis\", \"length\": \"2:25\"}, \"3\": {\"title\": \"Ryck upp dig äckel!\", \"length\": \"3:12\"}, \"4\": {\"title\": \"Det regnar shit\", \"length\": \"5:44\"}, \"5\": {\"title\": \"Amöbarn\", \"length\": \"2:25\"}, \"6\": {\"title\": \"Försöker du väcka en döv nation?\", \"length\": \"7:08\"}, \"7\": {\"title\": \"Pappersbiljett\", \"length\": \"4:12\"}, \"8\": {\"title\": \"Smällt mig ned\", \"length\": \"5:21\"}, \"9\": {\"title\": \"Gerald på tub\", \"length\": \"4:12\"}}', 12, 2020, 'Töcken,_dunkel_och_liknande_skildringar_Patetfisk.jpg', 50, 6),
(9, 'Prospect Hummer', 9, '{\"1\": {\"title\": \"It\'s You\", \"length\": \"3:40\"}, \"2\": {\"title\": \"Prospect Hummer\", \"length\": \"4:40\"}, \"3\": {\"title\": \"Baleen Sample\", \"length\": \"5:06\"}, \"4\": {\"title\": \"I Remember Learning How to Drive\", \"length\": \"2:18\"}}', 2, 2005, 'Prospect_Hummer_Animal_Collective.jpg', 48, 2),
(10, 'Richard D. James Album', 2, '{\"1\": {\"title\": \"4\", \"length\": \"3:37\"}, \"2\": {\"title\": \"Cornish Acid\", \"length\": \"2:15\"}, \"3\": {\"title\": \"Peek 82454201\", \"length\": \"3:05\"}, \"4\": {\"title\": \"Fingerbib\", \"length\": \"3:49\"}, \"5\": {\"title\": \"Carn Marth\", \"length\": \"2:33\"}, \"6\": {\"title\": \"To Cure A Weakling Child\", \"length\": \"4:04\"}, \"7\": {\"title\": \"Goon Gumpas\", \"length\": \"2:02\"}, \"8\": {\"title\": \"Yellow Calx\", \"length\": \"3:05\"}, \"9\": {\"title\": \"Girl/Boy Song\", \"length\": \"4:53\"}, \"10\": {\"title\": \"Logan Rock Witch\", \"length\": \"3:34\"}}', 3, 1996, 'Richard_D_James_Album_Aphex_Twin.jpg', 50, 6),
(11, 'Replica', 10, '{\"1\": {\"title\": \"Andro\", \"length\": \"3:54\"}, \"2\": {\"title\": \"Power of Persuasion\", \"length\": \"3:28\"}, \"3\": {\"title\": \"Sleep Dealer\", \"length\": \"3:10\"}, \"4\": {\"title\": \"Remember\", \"length\": \"3:24\"}, \"5\": {\"title\": \"Replica\", \"length\": \"4:36\"}, \"6\": {\"title\": \"Nassau\", \"length\": \"4:43\"}, \"7\": {\"title\": \"Submersible\", \"length\": \"3:51\"}, \"8\": {\"title\": \"Up\", \"length\": \"3:57\"}, \"9\": {\"title\": \"Child Soldier\", \"length\": \"3:14\"}, \"10\": {\"title\": \"Explain\", \"length\": \"6:44\"}}', 4, 2011, 'Replica_Oneothrix_Point_Never.jpg', 50, 5),
(12, 'R Plus Seven', 10, '{\"1\": {\"title\": \"Boring Angel\", \"length\": \"4:16\"}, \"2\": {\"title\": \"Americans\", \"length\": \"5:18\"}, \"3\": {\"title\": \"He She\", \"length\": \"1:33\"}, \"4\": {\"title\": \"Inside World\", \"length\": \"3:53\"}, \"5\": {\"title\": \"Zebra\", \"length\": \"6:45\"}, \"6\": {\"title\": \"Along\", \"length\": \"5:24\"}, \"7\": {\"title\": \"Problem Areas\", \"length\": \"3:06\"}, \"8\": {\"title\": \"Cryo\", \"length\": \"2:47\"}, \"9\": {\"title\": \"Still Life\", \"length\": \"4:54\"}, \"10\": {\"title\": \"Chrome Country\", \"length\": \"5:05\"}}', 3, 2013, 'R_Plus_Seven_Oneothrix_Point_Never.jpg', 48, 3),
(13, 'Semantic Compositions on Death and Its Meaning', 11, '{\"1\": {\"title\": \"The Nature of Dying\", \"length\": \"6:00\"}, \"2\": {\"title\": \"O\'er the Flood\", \"length\": \"6:23\"}, \"3\": {\"title\": \"Looming Shadow of a Tree Long Gone\", \"length\": \"5:29\"}}', 5, 2011, 'Semantic_Compositions_on_Death_and_Its_Meaning_Goreshit.jpg', 50, 1),
(14, 'Strawberry Jam', 9, '{\"1\": {\"title\": \"Peacebone\", \"length\": \"5:13\"}, \"2\": {\"title\": \"Unsolved Mysteries\", \"length\": \"4:25\"}, \"3\": {\"title\": \"Chores\", \"length\": \"4:30\"}, \"4\": {\"title\": \"For Reverend Green\", \"length\": \"6:35\"}, \"5\": {\"title\": \"Fireworks\", \"length\": \"6:51\"}, \"6\": {\"title\": \"#1\", \"length\": \"4:33\"}, \"7\": {\"title\": \"Winter Wonderland\", \"length\": \"2:45\"}, \"8\": {\"title\": \"Cuckoo Cuckoo\", \"length\": \"5:42\"}, \"9\": {\"title\": \"Derek\", \"length\": \"3:01\"}, \"10\": {\"title\": \"Safer\", \"length\": \"9:15\"}}', 2, 2007, 'Strawberry_Jam_Animal_Collective.jpg', 50, 4),
(15, 'Velocity: Design: Comfort.', 12, '{\"1\": {\"title\": \"Tekka\", \"length\": \"3:09\"}, \"2\": {\"title\": \"Dsco\", \"length\": \"3:11\"}, \"3\": {\"title\": \"Velocity\", \"length\": \"8:35\"}, \"4\": {\"title\": \"Fruitcake and Cookies\", \"length\": \"7:59\"}, \"5\": {\"title\": \"Sept\", \"length\": \"8:26\"}, \"6\": {\"title\": \"Pro: Lov: Ad\", \"length\": \"5:46\"}, \"7\": {\"title\": \"Design: I\", \"length\": \"5:32\"}, \"8\": {\"title\": \"International\", \"length\": \"10:23\"}, \"9\": {\"title\": \"Dedicated\", \"length\": \"5:51\"}, \"10\": {\"title\": \"Chocolate Matter\", \"length\": \"4:04\"}, \"11\": {\"title\": \"To All the Dancers of the World, A Round Form of Fantasy\", \"length\": \"6:19\"}, \"12\": {\"title\": \"Design: 2: 3\", \"length\": \"6:18\"}}', 1, 2003, 'Velocity_Design_Comfort_Sweet_Trip.jpg', 50, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`,`artist`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`,`city`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`label_id`,`label`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product` (`prod_id`),
  ADD KEY `customer` (`cust_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`price_id`,`price`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist` (`artist`),
  ADD KEY `label` (`label`),
  ADD KEY `price` (`price`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `label_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `city` FOREIGN KEY (`city`) REFERENCES `cities` (`city_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customer` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `artist` FOREIGN KEY (`artist`) REFERENCES `artists` (`artist_id`),
  ADD CONSTRAINT `label` FOREIGN KEY (`label`) REFERENCES `labels` (`label_id`),
  ADD CONSTRAINT `price` FOREIGN KEY (`price`) REFERENCES `prices` (`price_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
