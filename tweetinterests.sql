-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2018 at 09:21 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweetinterests`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'desaman.chalith@gmail.com', 'chalith@123');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `file`) VALUES
(28, 'aac1594.cs');

-- --------------------------------------------------------

--
-- Table structure for table `tweetopinion`
--

CREATE TABLE `tweetopinion` (
  `id` int(11) NOT NULL,
  `tweet_id` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `sentiment` text NOT NULL,
  `create_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweetopinion`
--

INSERT INTO `tweetopinion` (`id`, `tweet_id`, `text`, `sentiment`, `create_id`) VALUES
(691, '619342924275433472', 'Midnight tourism is the only option when your traveling for business.   I am glad most things look... https://t.co/j5I9UVksyr', '{\"negative\":[\"midnight tourism\"],\"neutral\":[\"traveling\"],\"positive\":[\"option\"]}', '602v072wjqb1yjy9'),
(692, '620999465726558208', 'Lunch break before we go to the indoor rides. (@ Comfort Inn - @niagara_hotel in Niagara Falls, ON) https://t.co/heO9C4jgjz', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(693, '618866825640701952', 'if you ever wondered what happens with ur #raincoat after being #inthemist at #niagara #falls ask poor #nature http://t.co/RUNP9wquqA', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(694, '620370181706121216', 'a crappy picture to go with a great vacation @ obx https://t.co/RteIa3u1Dt', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(695, '620020857763725312', 'The beautiful bride and I. #FinallyDeso @ Hotel at The Lafayette https://t.co/uGRLVWHhUn', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(696, '620020609750335488', 'Vanessa Williams slept here. (@ Hotel @ The Lafayette - @hotel_lafayette in Buffalo, NY) https://t.co/8ZgJIU1az8', '{\"negative\":[],\"neutral\":[\"vanessa\"],\"positive\":[]}', '602v072wjqb1yjy9'),
(697, '619197404668149760', 'I need a vacation so badly it hurts', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(698, '620821230468395009', '#niagra #niagrafalls #travel #amazing #wonders #7wonders @ Niagara Falls https://t.co/MqpSc4VVP5', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(699, '620058510420758528', 'This one. #Jordan #FinallyDeso @ Hotel at The Lafayette https://t.co/WRYfGAhGcD', '{\"negative\":[\"hotel\"],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(700, '620717008427089920', 'Caught someone mid-yawn during a gas stop before heading to the hotel. 4 min away! Kaya\'s ready to... https://t.co/AWeT5o65RT', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb1yjy9'),
(711, '587510702765649920', 'The hotel I am staying in has HBO and I just got to watch the new episode of GOT. Thank god.', '{\"negative\":[\"hotel\"],\"neutral\":[\"staying\"],\"positive\":[]}', '602v072wjqb20ys7'),
(712, '586859248849711104', 'There is a Starbucks in the lobby of my hotel...its a sign.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(713, '585998611433029632', 'You go to Florida on spring break with no parents and are in your hotel at 10 of the clock. I see something wrong with that picture.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(714, '586128113739898881', 'My Mobile Command Center at 7am. #Traveling #Rochester #Meetings #Training #NYRegion #AlwaysWorking @... https://t.co/KFgz09Xi7x', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(715, '587696723834863616', 'Saving my money for a new car when my lease is up and my mom told me to screw it and travel this summer.  hmmmm......', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(716, '587307906246164480', '3.5 hrs, that is it... Then I can go outside in nature and sketch breasts and eat sushi like I want.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(717, '587783558758019072', '\"@WORIDSTARHIPHOP: This makes me happy http://t.co/eeZqMTR1fP\" it makes you happy that nature is failing? animals do not even know instinct?', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(718, '587765758714753024', 'Nothing like sleeping in your own bed after coming home from vacation', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(719, '587929509841793024', 'Worst day of the semester when self service decides to take a vacation', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v072wjqb20ys7'),
(720, '585920766778179585', 'My Twitter and Instagram consist of pictures of people on vacation and talking about it and im in buffalo', '{\"negative\":[\"consist\"],\"neutral\":[\"twitter\"],\"positive\":[\"instagram\"]}', '602v072wjqb20ys7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweetopinion`
--
ALTER TABLE `tweetopinion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tweetopinion`
--
ALTER TABLE `tweetopinion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
