-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2019 at 03:32 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_username`, `password`, `email`, `fname`, `lname`, `address`, `phone`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@yahoo.com', 'first', '', 'dallu', '4289135'),
('ajjj', 'd41d8cd98f00b204e9800998ecf8427e', 'sd@c.m', 'ak', 'alkl', 'ds', '787'),
('oioi', '81dc9bdb52d04dc20036dbd8313ed055', 'meetmedixya@ymail.com', 'klk', 'klksskal', 'jhas', '8767'),
('poppo', '0e8bf94985c6c60c7b595de3590ba01d', 'meetmedixya@ymail.com', 'kjkj', 'lk', 'kjkjk', '90988'),
('sdd', 'd41d8cd98f00b204e9800998ecf8427e', '', 'dix', '', '', ''),
('sds', 'd41d8cd98f00b204e9800998ecf8427e', '', 'hdsjd', '', '', ''),
('tara', 'd41d8cd98f00b204e9800998ecf8427e', 'hxcg@jbcb.com', 'tara', 'mndr', 'cj', '7778');

-- --------------------------------------------------------

--
-- Table structure for table `admin1`
--

CREATE TABLE `admin1` (
  `id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `associatedproduct`
--

CREATE TABLE `associatedproduct` (
  `aproduct_id` int(11) NOT NULL DEFAULT '0',
  `aproduct_name` varchar(255) NOT NULL,
  `aproduct_price` varchar(255) NOT NULL,
  `aproduct_qty` varchar(255) NOT NULL,
  `aproduct_brand` varchar(255) NOT NULL,
  `shopno` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `aproduct_image` varchar(255) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_name` varchar(255) NOT NULL,
  `brand_image` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_name`, `brand_image`, `category`) VALUES
('Acer', '26085_7.png', ''),
('Apple', '5921_apple-macbook-air-notebook-400x400-imadwdzsg63whet6.jpeg', 'ELECTRONICS'),
('Asus', '17940_asus-notebook-400x400-imadrk99pfgfrykr.jpeg', 'ELECTRONICS'),
('Canon', '9067_9.png', ''),
('Dell', '16719_4.png', ''),
('Digi Flow', '7869_digiflip-pro-xt811-nxtonek.jpeg', 'ELECTRONICS'),
('DMG FULL', '12262_4-dmg-full-360-rotating-stand-cover-case-for-apple-ipad-2-3-4-with-matte-screen-stylus-wristband-400x400-imadq226hchj5enm.jpeg', 'ELECTRONICS'),
('Fujifilm', '20808_images.jpg', ''),
('Hitachi', '24805_Hitachi-Logo.gif', ''),
('HP', '4316_5.png', ''),
('HTC', '14266_images.jpg', 'ELECTRONICS'),
('Kodak', '7781_large_article_im4590_kodak_logo.jpg', ''),
('Leica', '26426_leica-camera-logo.jpg', ''),
('Lenovo', '16756_1.png', ''),
('LG', '4776_images (5).jpg', ''),
('Motorola', '27792_motorola-xt1022-400x400-imadvvfkshrfjcfj.jpeg', 'ELECTRONICS'),
('nike', '28181_970829_747018281999138_1599051657_n.png', ''),
('Nikon', '23388_images (1).jpg', ''),
('Nokia', '24264_11.png', ''),
('Onida', '15758_onida-leo24hbb-400x400-imadywy22kzn2gqc.jpeg', 'ELECTRONICS'),
('Pentax', '20459_Pentax-Company-Logo.jpg', ''),
('Real', '18825_images.jpg', 'FOODS & BEVERAGES'),
('Samsung', '28590_6.png', ''),
('Skull Candy', '29860_skullcandy-2xl-shakedown-100x100-imadb8gjvjgptzgh.jpeg', 'ELECTRONICS'),
('Sony', '22714_8.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cust_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `order_time` time NOT NULL,
  `order_date` date NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_desc` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `cat_image` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_desc`, `status`, `cat_image`, `parent`) VALUES
(7, 'ELECTRONICS', '<p>&nbsp;This is the description of tye electronics category.&nbsp;This is the description of tye electronics category.&nbsp;This is the description of tye electronics category.&nbsp;This is the description of tye electronics category.&nbsp;This is the de', 1, '18419_4.jpg', 0),
(9, 'ACCESSORIES', '', 1, '', 0),
(10, 'FOODS & BEVERAGES', '', 1, '', 0),
(11, 'ART &GIFT', '', 1, '31284_Array', 0),
(12, 'TOYS', '<p>&nbsp;This is toy.</p>', 1, '23730_Array', 0),
(13, 'FOOD', '<p>THis is food</p>', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `childpages`
--

CREATE TABLE `childpages` (
  `cpage_id` int(11) NOT NULL,
  `cpage_title` varchar(255) NOT NULL,
  `cpage_slug` varchar(25) NOT NULL,
  `cpage_desc` varchar(255) NOT NULL,
  `cpage_image` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `comment` text NOT NULL,
  `id_post` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `id_post`, `date`) VALUES
(2, 'k', 'k@k.com', 'jjjjjjjjjjjjjjjjjjjjjj', 41, '2014-09-17 18:00:10'),
(3, 'lll', 'm', 'n', 41, '2014-09-17 18:55:18'),
(4, 'kll', 'm', 'mmmm', 41, '2014-09-17 19:05:49'),
(5, 'mm', 'm', 'm', 41, '2014-09-17 19:08:13'),
(6, 'mi', 'll', 'nn', 41, '2014-09-17 19:08:42'),
(7, 'gg', 'g', '', 41, '2014-09-17 19:10:41'),
(8, 'mmmm', '', '', 41, '2014-09-17 19:13:58'),
(9, 'n', '', '', 41, '2014-09-17 19:14:42'),
(10, 'j', 'k', 'jj', 48, '2014-09-18 02:09:04'),
(11, 'hh', 'mmm', 'nnn', 44, '2014-09-20 19:50:57'),
(12, 'iii', 'mm', 'nnn', 44, '2014-09-20 19:51:12'),
(13, 'ff', '', 'bbb', 44, '2014-09-20 19:53:52'),
(14, 'jj', 'b', 'jj', 44, '2014-09-20 19:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `fname`, `lname`, `email`, `msg`, `created_at`) VALUES
(1, 'jj', 'g', 'gg', 'gg', '2014-09-21 09:07:58'),
(2, 'jj', 'g', 'gg', 'gg', '2014-09-21 09:08:45'),
(3, 'Anita Shrestha', 'hh', 'GG', 'nn', '2014-09-21 09:09:00'),
(4, 'Anish Shrestha', 'k', 'a', 'kk', '2014-09-21 09:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(255) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `cctype` varchar(255) NOT NULL,
  `ccnumber` int(11) NOT NULL,
  `ccexpiry` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `cust_id`, `fname`, `lname`, `email`, `password`, `phone`, `country`, `address`, `gender`, `postal`, `cctype`, `ccnumber`, `ccexpiry`, `type`, `created_at`, `image`) VALUES
('ddixya', 0, 'ddixya', '', '', '8277e0910d750195b448797616e091ad', '', '', '', '', '', '', 0, '0000-00-00', '', '0000-00-00', ''),
('dixyaa', 0, 'dixyaa', '', '', '8277e0910d750195b448797616e091ad', '', '', '', 'female', '', '', 0, '0000-00-00', '', '0000-00-00', ''),
('DixyaLam', 0, '', '', '', '8277e0910d750195b448797616e091ad', '', '', '', 'female', '', '', 0, '0000-00-00', '', '0000-00-00', ''),
('RasnaMndhr', 0, '', '', '', '4b43b0aee35624cd95b910189b3dc231', '', '', '', 'female', '', '', 0, '0000-00-00', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `confirmation` varchar(30) NOT NULL,
  `total` varchar(100) NOT NULL,
  `note` varchar(500) NOT NULL,
  `username` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `shopno` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `qty`, `confirmation`, `total`, `note`, `username`, `order_date`, `order_time`, `product_name`, `shopno`, `status`) VALUES
(100, 759, '', '1518', 'jk', 'name', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(101, 759, '<br />\r\n<b>Notice</b>:  Undefi', '759', 'k', 'name', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(102, 759, '<br />\r\n<b>Notice</b>:  Undefi', '1518', 'l', 'name', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(103, 759, '<br />\r\n<b>Notice</b>:  Undefi', '     759.00 ', '', 'name', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(110, 5, '20557', '10000', 'bbn', 'name', '0000-00-00', '00:00:00', 'Dell', '0', 0),
(133, 1, '31312', '1000', '', '', '0000-00-00', '00:00:00', 'ddf', '0', 2),
(134, 4, '12743', '200000', '', '', '0000-00-00', '00:00:00', 'Apple', '0', 1),
(135, 1, '12743', '50000', '', '', '0000-00-00', '00:00:00', 'Apple', '2', 2),
(136, 1, '12743', '759', '', 'd', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 1),
(137, 4, '12743', '3036', '', 'd', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(138, 4, '12743', '8000', '', 'd', '0000-00-00', '00:00:00', 'Ipod', '0', 0),
(139, 1, '26595', '759', '', 'd', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 1),
(140, 2, '<br />\r\n<b>Notice</b>:  Undefi', '1518', '', 'd', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(141, 2, '32146', '100000', '', 'r', '0000-00-00', '00:00:00', 'Apple', '5', 0),
(142, 5, '32146', '25000', '', 'r', '0000-00-00', '00:00:00', 'Sony', '5', 0),
(143, 2, '16828', '1518', '', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(144, 3, '16828', '270000', '', 'RasnaMndhr', '0000-00-00', '00:00:00', 'LG', '0', 0),
(145, 2, '6186', '1518', 'hjh', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(146, 2, '21916', '4000', 'fdd', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Motorola', '0', 0),
(147, 3, '21916', '15000', 'ds', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Onida Tv', '0', 0),
(148, 4, '28033', '200000', 'jhjh', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Apple', '0', 0),
(149, 4, '17336', '320000', 'kjk', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Blackberry', '0', 0),
(151, 2, '1533', '1518', 'khkk', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(152, 2, '11173', '1518', 'dsfdf', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(153, 2, '21278', '1518', 'dsas', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(154, 2, '28583', '1518', 'jhj', 'RasnaMndhr', '0000-00-00', '00:00:00', 'Lenovo Y40', '0', 0),
(155, 3, '10248', '7500', 'hjh', 'RasnaMndhr', '0000-00-00', '00:00:00', 'DMG', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_desc` varchar(255) NOT NULL,
  `page_image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `page_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_title`, `page_desc`, `page_image`, `status`, `page_slug`) VALUES
(1, 'Home', '<p>&nbsp;This is a homepage</p>', '14185_Excellent Resume Format 1.png', 1, 'home'),
(2, 'Products', '<p>&nbsp;this is home child page</p>', '14140_Panda-wallpaper-10156222.jpg', 1, 'product'),
(3, 'SERVICES', '<p>&nbsp;thnbj</p>', '1541_Hope-wallpaper-9344033.jpg', 0, 'services'),
(4, 'Register', '<p>&nbsp;nhbhhyyhtgttttttttttttt</p>', '32425_images.jpg', 1, 'signup'),
(5, 'Login', '<p>&nbsp;JJJJJ</p>', '18010_vlcsnap-2013-09-23-17h18m30s191.png', 1, 'login'),
(7, 'Contact Us', '<p>&nbsp;jhfhgf</p>', '13741_1.jpg', 1, 'contact'),
(8, 'Help', '<p>This is a help page.</p>', '6895_vgjhjpg.jpg', 1, 'help'),
(9, 'inquiry', 'jhh', '12199_', 0, 'visitus'),
(11, 'Help', '<p>&nbsp;This is ncvnhelp page,,,</p>', '', 0, 'help');

-- --------------------------------------------------------

--
-- Table structure for table `paymentm`
--

CREATE TABLE `paymentm` (
  `id` int(11) NOT NULL,
  `dmethodid` varchar(30) NOT NULL,
  `methodname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentm`
--

INSERT INTO `paymentm` (`id`, `dmethodid`, `methodname`) VALUES
(1, '1', 'Cash On Delivery'),
(2, '2', 'BDO'),
(3, '2', 'Metro Bank'),
(4, '2', 'Smart Padala'),
(5, '3', 'BDO'),
(6, '3', 'Metro Bank'),
(7, '3', 'Smart Padala');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picsource` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `cat_id`, `price`, `created_at`, `updated_at`, `picsource`) VALUES
(5, 'apple', 'red', 0, '20', '0000-00-00 00:00:00', '2019-07-27 03:37:51', '11.png'),
(14, 'grapes', 'green', 0, '18', '2019-07-27 04:01:36', '2019-07-27 04:01:36', 'satut.jpg'),
(28, 'orange', 'juicy', 47, '30', '2019-08-03 18:08:37', '2019-08-03 18:08:37', '32.png'),
(29, 'non veg', 'frozen non veg', 50, '200', '2019-08-03 20:58:47', '2019-08-03 20:58:47', '40.png'),
(30, 'grapes', 'green', 50, '30', '2019-08-04 00:49:13', '2019-08-04 00:49:13', 'fruits1.jpg'),
(31, 'grapes', 'black grapes', 50, '35', '2019-08-04 00:50:00', '2019-08-04 00:50:00', 'satut.jpg'),
(32, 'tomato', 'red tomato', 50, '15', '2019-08-04 00:51:02', '2019-08-04 00:51:02', 'tomato.jpg'),
(33, 'pomigranate', 'red', 50, '50', '2019-08-04 00:51:40', '2019-08-04 00:51:40', 'pmogranate.jpg'),
(35, 'mango', 'yellow', 56, '45', '2019-08-11 20:58:39', '2019-08-11 20:58:39', '10.png'),
(36, 'black grapes', 'blaCK', 56, '34', '2019-08-11 21:02:10', '2019-08-11 21:02:10', 'satut.jpg'),
(37, 'PINE APPLE', 'yellow', 56, '100', '2019-08-11 21:02:58', '2019-08-11 21:02:58', 'pineapple.jpg'),
(38, ' mix juice', 'tropicana', 66, '100', '2019-08-16 01:47:36', '2019-08-16 01:47:36', '13.png'),
(39, 'brocoli', 'geen brocoli', 41, '150', '2019-08-16 01:48:28', '2019-08-16 01:48:28', '12.png'),
(40, 'vim bar', 'for utensil cleaning', 54, '50', '2019-08-16 01:50:13', '2019-08-16 01:50:13', '18.png'),
(41, 'sprite', 'sprite h clear h', 68, '100', '2019-08-16 01:51:47', '2019-08-16 01:51:47', '16.png'),
(42, 'cococola', 'cococola can', 68, '50', '2019-08-16 01:52:40', '2019-08-16 01:52:40', '15.png'),
(43, 'mirinda', 'orange mirinda can', 68, '100', '2019-08-16 01:54:15', '2019-08-16 01:54:15', '49.png'),
(44, 'ceres orange juice', 'small ceres orange juice', 66, '80', '2019-08-16 01:55:55', '2019-08-16 01:55:55', '52.png'),
(45, 'pepsi', '2 litre bottle ', 68, '100', '2019-08-16 01:56:50', '2019-08-16 01:56:50', '2.png'),
(46, 'mango juice', 'half litre bottle', 66, '50', '2019-08-16 01:57:40', '2019-08-16 01:57:40', '14.png'),
(47, 'odonil', 'room freshner', 54, '100', '2019-08-16 01:58:52', '2019-08-16 01:58:52', '19.png'),
(48, 'peas', 'fresh peas', 41, '34', '2019-08-16 02:00:03', '2019-08-16 02:00:03', '65.png'),
(49, 'garlic', 'white garlic', 41, '5', '2019-08-19 01:41:47', '2019-08-19 01:41:47', '20.jpg'),
(50, 'cauliflower', 'one white flower', 41, '10', '2019-08-19 01:43:43', '2019-08-19 01:43:43', '30.png'),
(51, 'apple', 'red', 41, '10', '2019-08-19 01:44:38', '2019-08-19 01:44:38', '29.png'),
(52, 'mask melon', 'sweet', 56, '15', '2019-08-19 01:45:29', '2019-08-19 01:45:29', '34.png'),
(53, 'mushroom', 'healthy', 41, '10', '2019-08-19 01:47:36', '2019-08-19 01:47:36', '35.png'),
(54, 'paratha', 'yummy paratha', 63, '50', '2019-08-19 01:49:13', '2019-08-19 01:49:13', '64.png'),
(55, 'dabbu', 'blaCK small', 55, '50', '2019-08-19 01:50:33', '2019-08-19 01:50:33', '23.png'),
(56, 'lunch box', 'blak round', 55, '20', '2019-08-19 01:51:19', '2019-08-19 01:51:19', '24.png'),
(57, 'cup cake', 'chocolate cake', 63, '10', '2019-08-19 01:52:20', '2019-08-19 01:52:20', '42.png'),
(58, 'brinjal', 'big brinjal', 41, '10', '2019-08-19 01:53:02', '2019-08-19 01:53:02', '31.png'),
(59, 'avocado', 'nutritive', 41, '50', '2019-08-19 01:54:09', '2019-08-19 01:54:09', 'avocado.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_catagory`
--

CREATE TABLE `table_catagory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `picsource` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_catagory`
--

INSERT INTO `table_catagory` (`id`, `name`, `description`, `cat_id`, `created_at`, `updated_at`, `picsource`) VALUES
(41, 'vegetables', 'different vegetable', 0, '2019-08-03 19:04:49', '0000-00-00 00:00:00', 'vegetables1.jpg'),
(50, 'frozen food', 'frozen snaks ', 0, '2019-08-03 20:53:09', '0000-00-00 00:00:00', '42.png'),
(53, 'kitchen product', 'boxes', 0, '2019-08-04 00:55:16', '0000-00-00 00:00:00', '22.png'),
(54, 'cleanning items', 'toylet cleaner', 0, '2019-08-04 00:56:33', '0000-00-00 00:00:00', '20.png'),
(55, 'utensils', 'plastic', 0, '2019-08-16 02:09:49', '0000-00-00 00:00:00', '17.png'),
(56, 'fruits', 'stroberry', 0, '2019-08-04 00:58:26', '0000-00-00 00:00:00', '36.png'),
(57, 'vegetables', 'spinach', 0, '2019-08-04 00:59:29', '0000-00-00 00:00:00', 'spinach.jpg'),
(60, 'pet food', 'pedigree', 0, '2019-08-11 03:54:10', '0000-00-00 00:00:00', '26.png'),
(61, 'oil', 'sunflower', 0, '2019-08-11 03:54:37', '0000-00-00 00:00:00', '1.png'),
(63, 'bread', 'fresh brown bread', 0, '2019-08-11 03:57:47', '0000-00-00 00:00:00', '41.png'),
(65, '', '', 0, '2019-08-16 01:43:44', '0000-00-00 00:00:00', ''),
(66, 'juice', 'all fruits juice', 0, '2019-08-16 01:46:29', '0000-00-00 00:00:00', '13.png'),
(67, '', '', 0, '2019-08-16 01:50:19', '0000-00-00 00:00:00', ''),
(68, 'beverage', 'different beverage', 0, '2019-08-16 01:50:59', '0000-00-00 00:00:00', '2.png');

-- --------------------------------------------------------

--
-- Table structure for table `table_item`
--

CREATE TABLE `table_item` (
  `catg` varchar(40) NOT NULL,
  `subcatg` varchar(40) NOT NULL,
  `img` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `info` varchar(500) NOT NULL,
  `dat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_subcat`
--

CREATE TABLE `table_subcat` (
  `id` int(11) NOT NULL,
  `subcat_name` varchar(100) NOT NULL,
  `subcat_desc` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_subcat`
--

INSERT INTO `table_subcat` (`id`, `subcat_name`, `subcat_desc`, `created_at`, `updated_at`) VALUES
(1, '', '', '2019-07-16 02:51:10', '0000-00-00 00:00:00'),
(2, 'vegetables', 'black', '2019-07-16 18:35:57', '0000-00-00 00:00:00'),
(3, 'vegetables', 'ladyfinger', '2019-07-20 20:09:06', '0000-00-00 00:00:00'),
(4, 'vegetables', 'ladyfinger', '2019-07-20 20:09:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role` tinyint(4) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id`, `name`, `username`, `role`, `password`, `created_at`, `created_update`) VALUES
(1, 'admin', 'leenapawar21@gmail.com', 1, 'e10adc3949ba59abbe56e057f20f883e', '2019-06-23 20:06:42', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_username`);

--
-- Indexes for table `admin1`
--
ALTER TABLE `admin1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `associatedproduct`
--
ALTER TABLE `associatedproduct`
  ADD PRIMARY KEY (`aproduct_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`order_time`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`),
  ADD KEY `product_id_3` (`product_id`),
  ADD KEY `cust_id_2` (`cust_id`),
  ADD KEY `cust_id_3` (`cust_id`),
  ADD KEY `cust_id_4` (`cust_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `childpages`
--
ALTER TABLE `childpages`
  ADD PRIMARY KEY (`cpage_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`username`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `paymentm`
--
ALTER TABLE `paymentm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_catagory`
--
ALTER TABLE `table_catagory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `table_subcat`
--
ALTER TABLE `table_subcat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin1`
--
ALTER TABLE `admin1`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `childpages`
--
ALTER TABLE `childpages`
  MODIFY `cpage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `paymentm`
--
ALTER TABLE `paymentm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_catagory`
--
ALTER TABLE `table_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `table_subcat`
--
ALTER TABLE `table_subcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
