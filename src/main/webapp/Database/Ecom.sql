-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2023 at 03:08 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'Abhishek Suryawanshi', 'abhis@gmail.com', 'abhis1774'),
(3, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', 'abhis'),
(4, 'Abhishek Suryawanshi', 'abhis1@gmail.com', 'abhis');

-- --------------------------------------------------------

--
-- Table structure for table `CART_abhis080701`
--

CREATE TABLE `CART_abhis080701` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` varchar(200) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CART_abhis080701`
--

INSERT INTO `CART_abhis080701` (`id`, `pid`, `user_email`, `product_name`, `product_price`, `product_image`, `quantity`, `total_price`, `product_code`, `created_at`) VALUES
(1, 6, 'abhis080701@gmail.com', 'Redmiy3', '10000', 'mm2.jpeg', 1, '10000', 'P-00g7VQ3', '2021-10-29 15:19:34'),
(2, 2, 'abhis080701@gmail.com', 'RedmiY2', '500', 'M4.jpeg', 1, '500', 'P-00faZ92', '2021-10-29 15:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `CART_GUEST`
--

CREATE TABLE `CART_GUEST` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` varchar(200) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CART_suryawanshiabhishek177`
--

CREATE TABLE `CART_suryawanshiabhishek177` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` varchar(200) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CART_suryawanshiabhishek177`
--

INSERT INTO `CART_suryawanshiabhishek177` (`id`, `pid`, `user_email`, `product_name`, `product_price`, `product_image`, `quantity`, `total_price`, `product_code`, `created_at`) VALUES
(1, 8, 'suryawanshiabhishek177@gmail.com', 'Redmiy4', '4000', 'mm12.jpeg', 2, '8000.0', 'P-00BZ4v5', '2021-10-22 02:31:58'),
(2, 7, 'suryawanshiabhishek177@gmail.com', 'Redmiy1', '2000', 'mm7.jpeg', 2, '4000.0', 'P-00kVrN4', '2021-10-22 02:31:56'),
(3, 2, 'suryawanshiabhishek177@gmail.com', 'RedmiY2', '500', 'M4.jpeg', 1, '500', 'P-00faZ92', '2021-10-22 02:31:45'),
(4, 11, 'suryawanshiabhishek177@gmail.com', 'PEN2', '3000', 'p12.jpeg', 2, '6000.0', 'P-00l0l88', '2021-10-30 04:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(500) NOT NULL,
  `cimage` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `cname`, `cimage`, `created_at`) VALUES
(51, 'Mobile', 'M1.jpeg', '2021-10-04 06:31:42'),
(52, 'Pen', 'P2.jpeg', '2021-10-04 13:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `sid` int(200) NOT NULL,
  `pserialnum` varchar(400) NOT NULL,
  `pname` varchar(400) NOT NULL,
  `pfeature` varchar(2000) NOT NULL,
  `pimage1` varchar(400) NOT NULL,
  `pimage2` varchar(400) NOT NULL,
  `pimage3` varchar(400) NOT NULL,
  `pimage4` varchar(400) NOT NULL,
  `pimage5` varchar(400) NOT NULL,
  `pprice` varchar(400) NOT NULL,
  `psellprice` varchar(400) NOT NULL,
  `pcolor` varchar(200) NOT NULL,
  `psize` varchar(200) NOT NULL,
  `status` int(10) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `sid`, `pserialnum`, `pname`, `pfeature`, `pimage1`, `pimage2`, `pimage3`, `pimage4`, `pimage5`, `pprice`, `psellprice`, `pcolor`, `psize`, `status`, `created_at`) VALUES
(2, 15, 'P-00faZ92', 'RedmiY2', 'Excellent Product', 'M5.jpeg', 'M4.jpeg', 'M3.jpeg', 'M2.jpeg', 'M1.jpeg', '500', '3000', 'red', 'none', 1, '2021-10-17 14:23:10.477348'),
(5, 18, 'P-00d7642', 'Cello Griper', 'Excellent Product', 'P5.jpeg', 'P4.jpeg', 'P3.jpeg', 'P2.jpeg', 'P1.jpeg', '50', '60', 'Black', 'none', 1, '2021-10-18 02:24:12.099192'),
(6, 15, 'P-00g7VQ3', 'Redmiy3', 'Excellent Product', 'mm1.jpeg', 'mm2.jpeg', 'mm3.jpeg', 'mm4.jpeg', 'mm5.jpeg', '1000', '1200', 'Black', 'none', 1, '2021-11-20 11:29:24.094535'),
(7, 15, 'P-00kVrN4', 'Redmiy1', 'Excellent', 'mm6.jpeg', 'mm7.jpeg', 'mm8.jpeg', 'mm9.jpeg', 'mm10.jpeg', '10000', '10000', 'yellow', 'none', 1, '2021-11-20 11:39:02.532161'),
(8, 15, 'P-00BZ4v5', 'Redmiy4', 'Excellent', 'mm11.jpeg', 'mm12.jpeg', 'mm13.jpeg', 'mm14\'.jpeg', 'mm15.jpeg', '4000', '400', 'Red', 'none', 1, '2021-10-17 14:21:04.848901'),
(9, 15, 'P-000M5O6', 'Redmiy5', 'Excellent', 'mm10.jpeg', 'mm9.jpeg', 'mm8.jpeg', 'mm7.jpeg', 'mm6.jpeg', '5000', '3000', 'White', 'none', 1, '2021-10-17 14:21:42.667360'),
(10, 18, 'P-00aPkM7', 'PEN1', 'Excellent', 'p6.jpeg', 'p7.jpeg', 'p8.jpeg', 'p9.jpeg', 'p10.jpeg', '2000', '100', 'Black,yellow', 'none', 1, '2021-11-20 11:30:37.681784'),
(11, 18, 'P-00l0l88', 'PEN2', 'Excellent', 'p11.jpeg', 'p12.jpeg', 'p13.jpeg', 'p14.jpeg', 'p15.jpeg', '3000', '200', 'Black', 'none', 1, '2021-10-17 14:22:17.201437'),
(12, 17, 'P-00UFeA9', 'POCO1', 'Trace mobile number location, network name and other details. Find the operator i.e. network name and address of the mobile number . We also make few predictions about the owner of the number. Guess the person who made calls/miss-calls you with our help. Enter Mobile Number without 0 : +91 Trace. We Support tracing of all mobile networks be it Idea, Reliance, Vodafone, BSNL, MTNL, TATA Docomo, Airtel, Aircel, Uninor, other CDMA as well as gsm operators from any place in India', 'mm11.jpeg', 'mm10.jpeg', 'mm9.jpeg', 'mm8.jpeg', 'mm7.jpeg', '1500', '1000', 'red', 'none', 1, '2021-10-17 14:25:28.206480');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `sid` int(11) NOT NULL,
  `cid` int(200) NOT NULL,
  `sname` varchar(500) NOT NULL,
  `simage` varchar(500) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`sid`, `cid`, `sname`, `simage`, `created_at`) VALUES
(15, 51, 'Xiaomi', 'M4.jpeg', '2021-10-05 08:24:38.180704'),
(17, 51, 'POCO', 'M3.jpeg', '2021-10-05 09:35:17.469488'),
(18, 52, 'Cello', 'P4.jpeg', '2021-10-05 13:02:33.609412');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(400) NOT NULL,
  `uemail` varchar(300) NOT NULL,
  `upassword` varchar(300) NOT NULL,
  `status` int(5) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `upassword`, `status`, `created_at`) VALUES
(11, 'abhishek', 'suryawanshiabhishek177@gmail.com', 'gh', 1, '2021-11-01 04:07:02.193369'),
(19, 'abhishek', 'abhis080701@gmail.com', 'abhis@1774', 1, '2022-03-25 09:14:18.610176'),
(22, 'suraj', 'surajbhoi3751@gmail.com', 'gh', 0, '2022-01-22 04:48:27.035671');

-- --------------------------------------------------------

--
-- Table structure for table `user_cart_order`
--

CREATE TABLE `user_cart_order` (
  `orderid` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `paymentmode` varchar(400) NOT NULL,
  `productsQuantity` varchar(400) NOT NULL,
  `TotalAmount` varchar(200) NOT NULL,
  `deliverycharges` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_cart_order`
--

INSERT INTO `user_cart_order` (`orderid`, `name`, `email`, `phone`, `address`, `paymentmode`, `productsQuantity`, `TotalAmount`, `deliverycharges`, `status`, `created_at`) VALUES
(3, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'pune', 'Net Banking', 'Redmiy3(2), Redmiy1(2), Redmiy4(3), Cello Griper(1)', '124000.0', 'Free', 'Order Pending', '2021-10-25 15:15:48.040006'),
(4, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'Walchandhanagar 413114', 'Cash On Delivery', 'RedmiY2(5), Redmiy3(3), Cello Griper(8)', '160000.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(5, 'Abhishek', 'suryawanshiabhishek177@gmail.com', '7774085516', 'smasa sm as', 'Debit/Credit Card', 'Redmiy3(3), Cello Griper(1)', '40000.0', 'Free', 'Order Completed', '2021-10-25 15:05:00.870869'),
(6, 'abhi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'pune', 'Net Banking', 'Redmiy3(3), Cello Griper(1)', '40000.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(7, 'abhi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'pune', 'Net Banking', 'Redmiy3(3), Cello Griper(1)', '40000.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(8, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'Pune,413114', 'Net Banking', 'Redmiy4(3), Redmiy1(6)', '24000.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(9, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'Pune,413114', 'Net Banking', 'Redmiy4(3), Redmiy1(6)', '24000.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(10, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'Pune,41314', 'Debit/Credit Card', 'Redmiy4(2), Redmiy1(2), RedmiY2(1)', '12500.0', 'Free', 'Order Pending', '2021-10-25 04:14:36.434530'),
(11, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '9975122061', 'Pune,Baramati ', 'Cash On Delivery', 'Redmiy4(2), Redmiy1(2), RedmiY2(1)', '12500.0', 'Free', 'Order Pending', '2021-10-25 15:15:45.015668'),
(12, 'Abhishek Suryawanshi', 'suryawanshiabhishek177@gmail.com', '7774085516', 'Pune,413114', 'Net Banking', 'Redmiy4(3), Redmiy1(6)', '24000.0', 'Free', 'Order Completed', '2021-10-25 15:00:23.559213'),
(13, 'Abhis', 'abhis080701@gmail.com', '7774085516', 'Pune,413114', 'Cash On Delivery', 'Redmiy3(1), RedmiY2(1)', '10500.0', 'Free', 'Order Pending', '2021-10-30 07:19:24.530584'),
(14, 'Abhis', 'abhis080701@gmail.com', '9975122061', 'ndksndnsad', 'Cash On Delivery', 'Redmiy3(1), RedmiY2(1)', '10500.0', 'Free', 'Order Pending', '2021-11-23 11:08:04.655356');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `orderid` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `paymentmode` varchar(400) NOT NULL,
  `productsQuantity` varchar(400) NOT NULL,
  `TotalAmount` varchar(200) NOT NULL,
  `deliverycharges` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `WISH_abhis080701`
--

CREATE TABLE `WISH_abhis080701` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WISH_abhis080701`
--

INSERT INTO `WISH_abhis080701` (`id`, `pid`, `user_email`, `product_name`, `product_price`, `product_image`, `product_code`, `created_at`) VALUES
(1, 2, 'abhis080701@gmail.com', 'RedmiY2', '500', 'M4.jpeg', 'P-00faZ92', '2021-10-29 15:25:37'),
(2, 7, 'abhis080701@gmail.com', 'Redmiy1', '2000', 'mm7.jpeg', 'P-00kVrN4', '2021-10-29 15:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `WISH_GUEST`
--

CREATE TABLE `WISH_GUEST` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `WISH_suryawanshiabhishek177`
--

CREATE TABLE `WISH_suryawanshiabhishek177` (
  `id` int(11) NOT NULL,
  `pid` int(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` varchar(300) DEFAULT NULL,
  `product_image` varchar(300) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WISH_suryawanshiabhishek177`
--

INSERT INTO `WISH_suryawanshiabhishek177` (`id`, `pid`, `user_email`, `product_name`, `product_price`, `product_image`, `product_code`, `created_at`) VALUES
(1, 6, 'suryawanshiabhishek177@gmail.com', 'Redmiy3', '10000', 'mm2.jpeg', 'P-00g7VQ3', '2021-10-19 03:09:59'),
(2, 11, 'suryawanshiabhishek177@gmail.com', 'PEN2', '3000', 'p12.jpeg', 'P-00l0l88', '2021-10-20 09:52:45'),
(3, 7, 'suryawanshiabhishek177@gmail.com', 'Redmiy1', '2000', 'mm7.jpeg', 'P-00kVrN4', '2021-10-21 07:25:13'),
(5, 10, 'suryawanshiabhishek177@gmail.com', 'PEN1', '3000', 'p7.jpeg', 'P-00aPkM7', '2021-10-22 02:31:31'),
(6, 8, 'suryawanshiabhishek177@gmail.com', 'Redmiy4', '4000', 'mm12.jpeg', 'P-00BZ4v5', '2021-10-30 03:27:45'),
(7, 5, 'suryawanshiabhishek177@gmail.com', 'Cello Griper', '50', 'P4.jpeg', 'P-00d7642', '2021-10-30 04:00:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CART_abhis080701`
--
ALTER TABLE `CART_abhis080701`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `CART_GUEST`
--
ALTER TABLE `CART_GUEST`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `CART_suryawanshiabhishek177`
--
ALTER TABLE `CART_suryawanshiabhishek177`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `user_cart_order`
--
ALTER TABLE `user_cart_order`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `WISH_abhis080701`
--
ALTER TABLE `WISH_abhis080701`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `WISH_GUEST`
--
ALTER TABLE `WISH_GUEST`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `WISH_suryawanshiabhishek177`
--
ALTER TABLE `WISH_suryawanshiabhishek177`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `CART_abhis080701`
--
ALTER TABLE `CART_abhis080701`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `CART_GUEST`
--
ALTER TABLE `CART_GUEST`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `CART_suryawanshiabhishek177`
--
ALTER TABLE `CART_suryawanshiabhishek177`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_cart_order`
--
ALTER TABLE `user_cart_order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WISH_abhis080701`
--
ALTER TABLE `WISH_abhis080701`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WISH_GUEST`
--
ALTER TABLE `WISH_GUEST`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `WISH_suryawanshiabhishek177`
--
ALTER TABLE `WISH_suryawanshiabhishek177`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CART_abhis080701`
--
ALTER TABLE `CART_abhis080701`
  ADD CONSTRAINT `CART_abhis080701_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `CART_GUEST`
--
ALTER TABLE `CART_GUEST`
  ADD CONSTRAINT `CART_GUEST_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `CART_suryawanshiabhishek177`
--
ALTER TABLE `CART_suryawanshiabhishek177`
  ADD CONSTRAINT `CART_suryawanshiabhishek177_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `subcategory` (`sid`) ON DELETE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE;

--
-- Constraints for table `WISH_abhis080701`
--
ALTER TABLE `WISH_abhis080701`
  ADD CONSTRAINT `WISH_abhis080701_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `WISH_GUEST`
--
ALTER TABLE `WISH_GUEST`
  ADD CONSTRAINT `WISH_GUEST_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `WISH_suryawanshiabhishek177`
--
ALTER TABLE `WISH_suryawanshiabhishek177`
  ADD CONSTRAINT `WISH_suryawanshiabhishek177_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
