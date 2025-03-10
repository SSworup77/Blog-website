--admin pass 123

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Sworup', 'A', 'admin', '$2y$10$kggeKkIs6rEWf.p/6muJCOepa8zY4DcDU3CBZua8iNc9SBM3MMGym');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Science'),
(2, 'Technology'),
(4, 'Biology'),
(5, 'Poems'),
(6, 'Fiction'),
(7, 'Fantasy'),
(8, 'Programming'),
(9, 'Artificial intelligence');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `crated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment`, `user_id`, `post_id`, `crated_at`) VALUES
(21, 'good', 4, 14, '2023-07-21 19:04:30'),
(22, 'thanks', 4, 12, '2023-07-21 19:04:46'),
(23, 'new comment', 2, 14, '2023-07-21 19:05:16'),
(24, 'Nice', 2, 14, '2023-07-21 19:05:20'),
(25, 'thanks', 2, 12, '2023-07-21 19:05:56'),
(26, 'thanks', 2, 15, '2023-07-21 19:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(127) NOT NULL,
  `post_text` text NOT NULL,
  `category` int(11) NOT NULL,
  `publish` int(2) NOT NULL DEFAULT 1,
  `cover_url` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `crated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--
-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE `post_like` (
  `like_id` int(11) NOT NULL,
  `liked_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`like_id`, `liked_by`, `post_id`, `liked_at`) VALUES
(61, 4, 14, '2023-07-21 19:04:18'),
(62, 4, 13, '2023-07-21 19:04:22'),
(63, 4, 12, '2023-07-21 19:04:24'),
(64, 2, 14, '2023-07-21 19:05:10'),
(66, 2, 12, '2023-07-21 19:05:47'),
(68, 2, 15, '2023-07-21 19:11:30'),
(69, 6, 15, '2023-07-21 19:17:00'),
(70, 6, 14, '2023-07-21 19:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `username`, `password`) VALUES
(2, 'Jhon Doe', 'john', '$2y$10$5KdCaBOhNE6HZOmn39jO4OOyKUI1xC1St51KH8DhtXGX8drct98/q'),
(3, 'Khalid Jemal', 'khalid', '$2y$10$LoZNyJVQpBu/M7BEQdUmlOVVXaV65TxZwLAFejNBdD5a/JxjJAEwG'),
(4, 'Oliver Jr', 'oliver', '$2y$10$BUU6wlANM91k7CiQUV2GveWMx1nKj0HnoNUv5bRp1.vslrI/.tumu'),
(5, 'James Jr ', 'james', '$2y$10$MmbFLq6Qqeb4PnPHF9JK4OSqzBt8.GG3SicdpIYiKo/Xo.6OVu9QO'),
(6, 'John Jr', 'jr_john', '$2y$10$KpVvp9ixSCn/9FMR3k0tn.0Oul5lf2jGaCGPOgKyyxQTdyMk8xtlG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
