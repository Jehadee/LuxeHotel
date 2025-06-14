-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 08:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dpw`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `type` enum('Deluxe Room','Deluxe Balcony Room','Family Suite','Gallery Suite','Hillside Studio','Premier Balcony Suite','Premier Room','Premier Suite') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','occupied') NOT NULL DEFAULT 'available',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `type`, `price`, `status`, `image`, `created_at`, `updated_at`) VALUES
(4, '202', 'Deluxe Room', 150.00, 'available', 'room_6814f11a3bcbf.jpg', '2025-05-02 14:47:56', '2025-05-02 17:27:35'),
(5, '301', 'Family Suite', 250.00, 'available', 'room_681500973fa59.jpg', '2025-05-02 14:47:56', '2025-05-02 17:27:51'),
(10, '2021', 'Premier Balcony Suite', 120000.00, 'available', 'room_6814fa0aefae7.jpg', '2025-05-02 16:59:55', '2025-05-02 16:59:55'),
(11, '3012', 'Deluxe Balcony Room', 1200.00, 'available', 'room_6815007de6b7b.jpg', '2025-05-02 17:27:26', '2025-05-02 17:27:26'),
(12, '111', 'Premier Room', 12000.00, 'available', 'room_6815020c8ee22.jpg', '2025-05-02 17:34:04', '2025-05-02 17:34:04'),
(14, '2022', 'Premier Suite', 12222.00, 'available', 'room_681506c052c61.jpg', '2025-05-02 17:54:08', '2025-05-02 17:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `t_booking`
--

CREATE TABLE `t_booking` (
  `id_booking` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `check_in` int(11) NOT NULL,
  `check_out` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `pajak` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `jumlah_malam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_booking`
--

INSERT INTO `t_booking` (`id_booking`, `id_customer`, `id_kamar`, `id_pembayaran`, `tanggal`, `check_in`, `check_out`, `harga_kamar`, `pajak`, `service`, `total_harga`, `jumlah_malam`) VALUES
(1, 1, 1, 1, '2023-06-21 11:44:52', 1687322617, 1687409017, 2800000, 294000, 140000, 3234000, 1),
(3, 1, 3, 1, '2023-06-21 12:31:23', 1687371780, 1687630980, 6100000, 1921500, 915000, 21136500, 3),
(4, 2, 1, 1, '2023-06-21 17:27:37', 1687343189, 1687429589, 2800000, 294000, 140000, 3234000, 1),
(5, 1, 2, 1, '2023-06-22 10:15:00', 1687458180, 1687630980, 2900000, 609000, 290000, 6699000, 2),
(6, 4, 2, 1, '2023-06-22 14:54:41', 1687458180, 1687630980, 2900000, 609000, 290000, 6699000, 2),
(8, 1, 1, 1, '2023-06-22 17:30:37', 1688667780, 1688840580, 2800000, 588000, 280000, 6468000, 2),
(17, 5, 4, 1, '2025-06-13 23:47:44', 1749829644, 1749916044, 150, 16, 8, 174, 1),
(18, 5, 5, 1, '2025-06-14 13:18:15', 1749878283, 1749964683, 250, 27, 13, 290, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_display_testimonial`
--

CREATE TABLE `t_display_testimonial` (
  `id_display` int(11) NOT NULL,
  `id_testimonial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_display_testimonial`
--

INSERT INTO `t_display_testimonial` (`id_display`, `id_testimonial`) VALUES
(3, 1),
(4, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_kamar`
--

CREATE TABLE `t_jenis_kamar` (
  `id_jenis_kamar` int(11) NOT NULL,
  `jenis_kamar` varchar(50) NOT NULL DEFAULT '',
  `kapasitas_kamar` int(11) NOT NULL,
  `ukuran_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `jenis_ranjang` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `detail_1` varchar(255) NOT NULL,
  `detail_2` varchar(255) NOT NULL,
  `detail_3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jenis_kamar`
--

INSERT INTO `t_jenis_kamar` (`id_jenis_kamar`, `jenis_kamar`, `kapasitas_kamar`, `ukuran_kamar`, `harga_kamar`, `jenis_ranjang`, `gambar`, `detail_1`, `detail_2`, `detail_3`) VALUES
(1, 'Deluxe Room', 3, 28, 2800000, 1, 'room-b1.jpg', 'deluxe-room.jpg', 'deluxe-king.jpg', 'deluxe-twin.jpg'),
(2, 'Deluxe Balcony Room', 3, 28, 2900000, 2, 'room-b5.jpg', 'deluxe-balcony-king.jpg', 'deluxe-balcony-king2.jpg', 'deluxe-balcony-twin.jpg'),
(3, 'Family Suite', 4, 62, 6100000, 1, 'room-b2.jpg', 'family-suite.jpg', 'family-suite-livingroom-view.jpg', 'family-suite-masterbed.jpg'),
(4, 'Gallery Suite', 3, 56, 5100000, 1, 'room-b3.jpg', 'gallery-suite.jpg', 'gallery-suite-bathroom.jpg', 'gallery-suite-masterbed.jpg'),
(5, 'Hillside Studio', 3, 36, 4600000, 1, 'room-b6.jpg', 'hillside-studio.jpg', 'hillside-studio-bathtub.jpg', ''),
(6, 'Premier Balcony Suite', 3, 34, 3900000, 1, 'room-b7.jpg', 'premier-balcony-king.jpg', 'premier-balcony-king2.jpg', ''),
(7, 'Premier Room', 3, 34, 3800000, 1, 'room-b8.jpg', 'premier-room.jpg', 'premier-room-bathroom.jpg', 'premier-room-bathroom2.jpg'),
(8, 'Premier Suite', 3, 62, 5900000, 1, 'room-b4.jpg', 'premier-suite.jpg', 'premier-suite-bathroom.jpg', 'premier-suite-living-room.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_ranjang`
--

CREATE TABLE `t_jenis_ranjang` (
  `id_jenis_ranjang` int(11) NOT NULL,
  `jenis_ranjang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jenis_ranjang`
--

INSERT INTO `t_jenis_ranjang` (`id_jenis_ranjang`, `jenis_ranjang`) VALUES
(1, 'King Size Bed'),
(2, 'Twin Single Bed');

-- --------------------------------------------------------

--
-- Table structure for table `t_kamar`
--

CREATE TABLE `t_kamar` (
  `id_kamar` int(11) NOT NULL,
  `jenis_kamar` int(11) NOT NULL,
  `jenis_ranjang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_kamar`
--

INSERT INTO `t_kamar` (`id_kamar`, `jenis_kamar`, `jenis_ranjang`) VALUES
(101, 1, 1),
(102, 2, 2),
(103, 3, 1),
(104, 4, 1),
(201, 5, 1),
(202, 6, 1),
(203, 7, 1),
(204, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_testimonial`
--

CREATE TABLE `t_testimonial` (
  `id_testimonial` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `testimonial` text NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_testimonial`
--

INSERT INTO `t_testimonial` (`id_testimonial`, `id_customer`, `testimonial`, `tanggal`) VALUES
(1, 1, 'My stay at Luxe Hotel was nothing short of extraordinary. The hotel\'s attention to detail, from the personalized welcome amenities to the exquisite linens, truly made me feel pampered. The staff\'s genuine hospitality and willingness to go above and beyond exceeded my expectations. The hotel\'s central location was an added bonus, as it allowed me to explore the city\'s attractions with ease. If you\'re looking for a luxurious retreat with impeccable service, Luxe Hotel is the perfect choice.', '2023-06-22 10:12:04'),
(2, 1, 'It\'s one of the best hotel there is', '2023-06-22 11:51:41'),
(3, 4, 'I don\'t want to leave', '2023-06-22 14:55:44'),
(4, 5, 'its good', '2025-04-25 17:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `title` varchar(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `title`, `name`, `phone`, `image`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'admin@gmail.com', '$2a$12$23MBLtSUNwUYWSvHFZwl/.RJZcC8KefR6lfsc6tiXuboRGGP9S9b6', 'Dr.', 'admin', '123', 'default.jpg', 1, 1, 1745422135),
(5, 'shi@gmail.com', '$2a$12$UNonbjOfrZgyYQBTCtlELOHgU.rTG2nHhyefD4dRmAAOUQG7DsO7i', 'Dr.', 'Shi', '1234567900', '0021947189b896ed7dd922da2b01f876.jpg', 2, 1, 1745422135),
(8, 'michael@gmail.com', '', 'Ms.', 'Michael Jackson', '122222', 'default.jpg', 0, 0, 1745588438);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `t_booking`
--
ALTER TABLE `t_booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `t_display_testimonial`
--
ALTER TABLE `t_display_testimonial`
  ADD PRIMARY KEY (`id_display`);

--
-- Indexes for table `t_jenis_kamar`
--
ALTER TABLE `t_jenis_kamar`
  ADD PRIMARY KEY (`id_jenis_kamar`);

--
-- Indexes for table `t_jenis_ranjang`
--
ALTER TABLE `t_jenis_ranjang`
  ADD PRIMARY KEY (`id_jenis_ranjang`);

--
-- Indexes for table `t_kamar`
--
ALTER TABLE `t_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `t_testimonial`
--
ALTER TABLE `t_testimonial`
  ADD PRIMARY KEY (`id_testimonial`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_booking`
--
ALTER TABLE `t_booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_display_testimonial`
--
ALTER TABLE `t_display_testimonial`
  MODIFY `id_display` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_jenis_kamar`
--
ALTER TABLE `t_jenis_kamar`
  MODIFY `id_jenis_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_jenis_ranjang`
--
ALTER TABLE `t_jenis_ranjang`
  MODIFY `id_jenis_ranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_kamar`
--
ALTER TABLE `t_kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `t_testimonial`
--
ALTER TABLE `t_testimonial`
  MODIFY `id_testimonial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
