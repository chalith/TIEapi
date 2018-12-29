-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2018 at 08:37 PM
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
(331, '825862031010099200', 'Falling Water @ Niagara Falls, Ontario, Canada', '{\"negative\":[\"falling\"],\"neutral\":[\"niagara\"],\"positive\":[]}', '602v0hlbjq9uvoss'),
(332, '826149113506959361', 'Ohh these Orchids are .', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uvoss'),
(333, '825563638115078144', 'Eating a beaver tail before I get back to the hotel and eat some \"beaver tail\" .', '{\"negative\":[\"eating\"],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uvoss'),
(334, '826421992752439297', 'First drop of the day. .', '{\"negative\":[\"drop\"],\"neutral\":[],\"positive\":[\"day\"]}', '602v0hlbjq9uvoss'),
(335, '826027738008018944', 'I am at Hyatt Regency Buffalo / Hotel and Conference Center in Buffalo, NY', '{\"negative\":[],\"neutral\":[\"hyatt\"],\"positive\":[]}', '602v0hlbjq9uvoss'),
(336, '826077384004640768', 'Make Monday matter.', '{\"negative\":[],\"neutral\":[\"make\"],\"positive\":[]}', '602v0hlbjq9uvoss'),
(337, '826843707265556481', '.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uvoss'),
(338, '825129732341690369', 'Just posted a photo @ Seneca Casino and Hotel , NiagraFalls Ny', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uvoss'),
(339, '826829794914492417', 'Blend with nature @ Niagara Falls', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uvoss'),
(340, '825548224937201664', 'Mmm, liquor. (@ Hyatt Regency Buffalo / Hotel and Conference Center in Buffalo, NY)', '{\"negative\":[\"mmm regency\"],\"neutral\":[\"liquor\"],\"positive\":[\"hyatt\"]}', '602v0hlbjq9uvoss'),
(351, '824855013084139522', 'between adventures, we adult. and we adult, so we can adventure. @.', '{\"negative\":[],\"neutral\":[\"adult\"],\"positive\":[]}', '602v0hlbjq9uygq2'),
(352, '825607505359360000', 'it is always a danger and an adventure. @ TheGypsyParlor', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(353, '979301273215348736', '.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(354, '977553673772466176', 'think I almost only died five times holy hell that was killer after vacation .', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(355, '978054485988720640', 'Canadian hiking. @ Woodend.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(356, '978273972973461504', '/ - Of course we stopped at Niagara Falls! .', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(357, '978360410645630976', 'Beautiful morning for a walk around Buffalo\'s botanical gardens. via.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(358, '978265407273472000', '/ - Our hotel at Niagara Falls had a voucher for breakfast at the IHOP! I got strawberry.', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(359, '977993789464895490', 'Having a blast at hotelatthelafayette [?] @ Hotel at The Lafayette', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2'),
(360, '978050808225976320', 'Ok who is up for team building!?!bnigoldenhorseshoe .', '{\"negative\":[],\"neutral\":[],\"positive\":[]}', '602v0hlbjq9uygq2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
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
-- AUTO_INCREMENT for table `tweetopinion`
--
ALTER TABLE `tweetopinion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
