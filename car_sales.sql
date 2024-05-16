-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 16 2024 г., 10:22
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_sales`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'BMW', '2024-05-15 07:31:45', '2024-05-15 07:31:45'),
(2, 'Volkswagen', '2024-05-15 07:31:51', '2024-05-15 07:31:51'),
(3, 'Alfa Romeo', '2024-05-15 07:31:56', '2024-05-15 07:31:56'),
(5, 'AC', '2024-05-15 11:48:37', '2024-05-15 11:48:37'),
(6, 'Acura', '2024-05-15 11:51:43', '2024-05-15 11:51:43'),
(7, 'Alpine', '2024-05-15 19:30:05', '2024-05-15 19:30:05'),
(8, 'Ariel', '2024-05-15 19:32:01', '2024-05-15 19:32:01'),
(9, 'Aro', '2024-05-15 19:33:30', '2024-05-15 19:33:30'),
(10, 'Artega', '2024-05-15 19:34:20', '2024-05-15 19:34:20'),
(11, 'Aston Martin', '2024-05-15 19:35:20', '2024-05-15 19:35:20');

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `bodyType` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `mileage` int(11) DEFAULT NULL,
  `drivetrain` varchar(40) NOT NULL,
  `fuel` varchar(30) NOT NULL,
  `transmission` varchar(40) NOT NULL,
  `engine` varchar(40) NOT NULL,
  `power` varchar(30) NOT NULL,
  `color` varchar(40) NOT NULL,
  `number` varchar(15) NOT NULL,
  `price` float NOT NULL,
  `owner` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `bodyType`, `year`, `mileage`, `drivetrain`, `fuel`, `transmission`, `engine`, `power`, `color`, `number`, `price`, `owner`, `description`, `image`, `city_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, 'Sedan', 2007, 500000, 'Rear-wheel drive', 'Diesel', 'Manual', '3.0', '170', 'Gray', '005 DEN', 5000, 1, 'Very good car xdxdxdxdxdxdxdxd', '2165ada0-1490-4c18-a878-b5124f2c7b0a.jpeg', 1, '2024-05-15 07:35:39', '2024-05-15 07:35:39'),
(2, 2, 1, 'Hatchback', 2007, 310000, 'Front-wheel drive', 'Diesel', 'Manual', '1.9', '77', 'Black', '553 BLN', 1500, 1, 'Trash', 'cf50ea35-2cf1-4630-b236-71630491e728.jpeg', 1, '2024-05-15 07:48:26', '2024-05-15 07:48:26');

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Kohtla-Järve', '2024-05-15 07:34:22', '2024-05-15 07:34:22'),
(2, 'Tallinn', '2024-05-15 07:56:42', '2024-05-15 07:56:42'),
(3, 'Tartu', '2024-05-15 07:56:43', '2024-05-15 07:56:43'),
(4, 'Narva', '2024-05-15 07:56:49', '2024-05-15 07:56:49'),
(5, 'Pärnu', '2024-05-15 07:57:53', '2024-05-15 07:57:53'),
(6, 'Viljandi', '2024-05-15 07:58:02', '2024-05-15 07:58:02'),
(7, 'Maardu', '2024-05-15 07:58:07', '2024-05-15 07:58:07'),
(8, 'Rakvere', '2024-05-15 07:58:11', '2024-05-15 07:58:11'),
(9, 'Kuressaare', '2024-05-15 07:58:24', '2024-05-15 07:58:24'),
(10, 'Sillamäe', '2024-05-15 07:58:28', '2024-05-15 07:58:28'),
(11, 'Valga', '2024-05-15 07:58:34', '2024-05-15 07:58:34'),
(12, 'Võru', '2024-05-15 07:58:39', '2024-05-15 07:58:39'),
(13, 'Keila', '2024-05-15 07:58:43', '2024-05-15 07:58:43'),
(14, 'Jõhvi', '2024-05-15 07:58:49', '2024-05-15 07:58:49'),
(15, 'Haapsalu', '2024-05-15 07:59:12', '2024-05-15 07:59:12'),
(16, 'Paide', '2024-05-15 07:59:16', '2024-05-15 07:59:16'),
(17, 'Saue', '2024-05-15 07:59:20', '2024-05-15 07:59:20'),
(18, 'Elva', '2024-05-15 07:59:37', '2024-05-15 07:59:37'),
(19, 'Põlva', '2024-05-15 07:59:43', '2024-05-15 07:59:43'),
(20, 'Tapa', '2024-05-15 07:59:47', '2024-05-15 07:59:47'),
(21, 'Väike-Maarja', '2024-05-15 07:59:51', '2024-05-15 07:59:51'),
(22, 'Rapla', '2024-05-15 08:00:00', '2024-05-15 08:00:00'),
(23, 'Jõgeva', '2024-05-15 08:00:04', '2024-05-15 08:00:04'),
(24, 'Türi', '2024-05-15 08:00:08', '2024-05-15 08:00:08'),
(25, 'Kiviõli', '2024-05-15 08:00:13', '2024-05-15 08:00:13'),
(26, 'Põltsamaa', '2024-05-15 08:00:18', '2024-05-15 08:00:18'),
(27, 'Paldiski', '2024-05-15 08:00:22', '2024-05-15 08:00:22'),
(28, 'Sindi', '2024-05-15 08:00:27', '2024-05-15 08:00:27'),
(29, 'Kunda', '2024-05-15 08:00:31', '2024-05-15 08:00:31'),
(30, 'Kärdla', '2024-05-15 08:00:36', '2024-05-15 08:00:36'),
(31, 'Järveküla', '2024-05-15 08:00:40', '2024-05-15 08:00:40'),
(32, 'Kehra', '2024-05-15 08:00:45', '2024-05-15 08:00:45'),
(33, 'Tõrva', '2024-05-15 08:00:50', '2024-05-15 08:00:50'),
(34, 'Narva-Jõesuu', '2024-05-15 08:00:55', '2024-05-15 08:00:55'),
(35, 'Tamsalu', '2024-05-15 08:01:01', '2024-05-15 08:01:01'),
(36, 'Paikuse', '2024-05-15 08:01:05', '2024-05-15 08:01:05'),
(37, 'Vändra', '2024-05-15 08:01:09', '2024-05-15 08:01:09'),
(38, 'Räpina', '2024-05-15 08:01:13', '2024-05-15 08:01:13'),
(39, 'Otepää', '2024-05-15 08:01:19', '2024-05-15 08:01:19');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `models`
--

INSERT INTO `models` (`id`, `name`, `brand_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Golf', 2, '2024-05-15 07:32:20', '2024-05-15 07:32:20'),
(2, '330', 1, '2024-05-15 07:32:28', '2024-05-15 07:32:28'),
(3, '530', 1, '2024-05-15 07:32:33', '2024-05-15 07:32:33'),
(4, 'Passat', 2, '2024-05-15 07:32:38', '2024-05-15 07:32:38'),
(12, 'Ace', 5, '2024-05-15 11:48:41', '2024-05-15 11:48:41'),
(13, 'Cobra', 5, '2024-05-15 11:50:03', '2024-05-15 11:50:03'),
(14, 'Frua', 5, '2024-05-15 11:51:19', '2024-05-15 11:51:19'),
(15, 'MDX', 6, '2024-05-15 11:52:06', '2024-05-15 11:52:06'),
(16, 'RDX', 6, '2024-05-15 11:52:15', '2024-05-15 11:52:15'),
(17, 'TLX', 6, '2024-05-15 11:52:19', '2024-05-15 11:52:19'),
(18, 'ILX', 6, '2024-05-15 11:52:22', '2024-05-15 11:52:22'),
(19, 'RLX', 6, '2024-05-15 11:52:27', '2024-05-15 11:52:27'),
(20, 'ZDX', 6, '2024-05-15 11:52:30', '2024-05-15 11:52:30'),
(21, 'NSX', 6, '2024-05-15 11:52:34', '2024-05-15 11:52:34'),
(22, 'Integra', 6, '2024-05-15 11:52:51', '2024-05-15 11:52:51'),
(23, 'CL', 6, '2024-05-15 11:53:02', '2024-05-15 11:53:02'),
(24, 'CSX', 6, '2024-05-15 11:53:07', '2024-05-15 11:53:07'),
(25, 'EL', 6, '2024-05-15 11:53:10', '2024-05-15 11:53:10'),
(26, 'Legend', 6, '2024-05-15 11:53:17', '2024-05-15 11:53:17'),
(27, 'RL', 6, '2024-05-15 11:53:21', '2024-05-15 11:53:21'),
(28, 'RSX', 6, '2024-05-15 11:53:54', '2024-05-15 11:53:54'),
(29, 'RSX TYPE-S', 6, '2024-05-15 11:54:05', '2024-05-15 11:54:05'),
(30, 'SLX', 6, '2024-05-15 11:54:11', '2024-05-15 11:54:11'),
(31, 'TL', 6, '2024-05-15 11:54:15', '2024-05-15 11:54:15'),
(32, 'TSX', 6, '2024-05-15 11:54:18', '2024-05-15 11:54:18'),
(36, '4C', 3, '2024-05-15 11:56:51', '2024-05-15 11:56:51'),
(37, '4C Spider', 3, '2024-05-15 11:56:58', '2024-05-15 11:56:58'),
(38, 'Giulia', 3, '2024-05-15 11:57:03', '2024-05-15 11:57:03'),
(39, 'Giulia GTA', 3, '2024-05-15 11:57:08', '2024-05-15 11:57:08'),
(40, 'Giulia Quadrifoglio', 3, '2024-05-15 11:57:40', '2024-05-15 11:57:40'),
(41, 'Giulia Veloce', 3, '2024-05-15 11:57:44', '2024-05-15 11:57:44'),
(42, 'Giulia Giulietta', 3, '2024-05-15 11:57:51', '2024-05-15 11:57:51'),
(43, 'Junior', 3, '2024-05-15 11:58:10', '2024-05-15 11:58:10'),
(44, 'Stelvio', 3, '2024-05-15 11:58:18', '2024-05-15 11:58:18'),
(45, 'Stelvio Quadrifoglio', 3, '2024-05-15 11:58:28', '2024-05-15 11:58:28'),
(46, 'Tonale', 3, '2024-05-15 11:58:35', '2024-05-15 11:58:35'),
(47, '145', 3, '2024-05-15 11:58:44', '2024-05-15 11:58:44'),
(48, '146', 3, '2024-05-15 11:58:50', '2024-05-15 11:58:50'),
(49, '147', 3, '2024-05-15 11:58:57', '2024-05-15 11:58:57'),
(50, '155', 3, '2024-05-15 11:59:07', '2024-05-15 11:59:07'),
(51, '156', 3, '2024-05-15 11:59:12', '2024-05-15 11:59:12'),
(52, '156 Sportwagon', 3, '2024-05-15 11:59:19', '2024-05-15 11:59:19'),
(54, '159', 3, '2024-05-15 11:59:41', '2024-05-15 11:59:41'),
(55, '159 Sportwagon', 3, '2024-05-15 11:59:51', '2024-05-15 11:59:51'),
(56, '164', 3, '2024-05-15 12:00:01', '2024-05-15 12:00:01'),
(57, '166', 3, '2024-05-15 12:00:12', '2024-05-15 12:00:12'),
(58, '1900', 3, '2024-05-15 12:00:21', '2024-05-15 12:00:21'),
(59, '2000', 3, '2024-05-15 12:00:37', '2024-05-15 12:00:37'),
(60, '24 HP', 3, '2024-05-15 12:01:12', '2024-05-15 12:01:12'),
(61, '2600', 3, '2024-05-15 12:01:21', '2024-05-15 12:01:21'),
(62, '33', 3, '2024-05-15 12:01:28', '2024-05-15 12:01:28'),
(63, '33 Sport Wagon', 3, '2024-05-15 12:01:40', '2024-05-15 12:01:40'),
(64, '6', 3, '2024-05-15 12:01:48', '2024-05-15 12:01:48'),
(65, '75', 3, '2024-05-15 12:01:59', '2024-05-15 12:01:59'),
(66, '6C', 3, '2024-05-15 12:02:20', '2024-05-15 12:02:20'),
(67, '8C', 3, '2024-05-15 12:02:24', '2024-05-15 12:02:24'),
(68, 'Alfasud', 3, '2024-05-15 12:02:30', '2024-05-15 12:02:30'),
(69, 'Alfasud Giardinetta', 3, '2024-05-15 12:02:37', '2024-05-15 12:02:37'),
(70, 'Alfasud Sprint', 3, '2024-05-15 12:02:44', '2024-05-15 12:02:44'),
(71, 'Alfasud Ti', 3, '2024-05-15 12:02:50', '2024-05-15 12:02:50'),
(72, 'Alfetta', 3, '2024-05-15 12:02:56', '2024-05-15 12:04:09'),
(73, 'Arna', 3, '2024-05-15 12:03:19', '2024-05-15 12:03:19'),
(74, 'Brera', 3, '2024-05-15 12:03:19', '2024-05-15 12:03:42'),
(75, 'Crosswagon Q4', 3, '2024-05-15 12:04:22', '2024-05-15 12:04:22'),
(76, 'Giulietta Quadrifoglio Verde', 3, '2024-05-15 19:24:40', '2024-05-15 19:24:40'),
(77, 'GT', 3, '2024-05-15 19:24:52', '2024-05-15 19:24:52'),
(78, 'GTV', 3, '2024-05-15 19:25:01', '2024-05-15 19:25:01'),
(79, 'MiTo', 3, '2024-05-15 19:25:08', '2024-05-15 19:25:08'),
(80, 'MiTo Quadrifoglio Verde', 3, '2024-05-15 19:25:16', '2024-05-15 19:25:16'),
(81, 'MiTo Veloce', 3, '2024-05-15 19:25:24', '2024-05-15 19:25:24'),
(82, 'Montreal', 3, '2024-05-15 19:25:33', '2024-05-15 19:25:33'),
(83, 'RL', 3, '2024-05-15 19:25:41', '2024-05-15 19:25:41'),
(84, 'RM', 3, '2024-05-15 19:25:48', '2024-05-15 19:25:48'),
(85, 'Spider', 3, '2024-05-15 19:25:54', '2024-05-15 19:25:54'),
(86, 'Sprint', 3, '2024-05-15 19:26:04', '2024-05-15 19:26:04'),
(87, 'Tipo 33', 3, '2024-05-15 19:26:16', '2024-05-15 19:26:16'),
(88, 'Torpedo 20/30 HP', 3, '2024-05-15 19:26:45', '2024-05-15 19:26:45'),
(89, 'A110', 7, '2024-05-15 19:31:17', '2024-05-15 19:31:17'),
(90, 'A110S', 7, '2024-05-15 19:31:25', '2024-05-15 19:31:25'),
(91, 'A106', 7, '2024-05-15 19:31:30', '2024-05-15 19:31:30'),
(92, 'A108', 7, '2024-05-15 19:31:36', '2024-05-15 19:31:36'),
(93, 'Atom', 8, '2024-05-15 19:32:11', '2024-05-15 19:32:11'),
(94, 'Nomad', 8, '2024-05-15 19:32:17', '2024-05-15 19:32:17'),
(95, '10 Series', 9, '2024-05-15 19:33:38', '2024-05-15 19:33:38'),
(96, '24 Series', 9, '2024-05-15 19:33:46', '2024-05-15 19:33:46'),
(97, 'IMS Series', 9, '2024-05-15 19:33:55', '2024-05-15 19:33:55'),
(98, 'M Series', 9, '2024-05-15 19:34:02', '2024-05-15 19:34:02'),
(99, 'Scalo', 10, '2024-05-15 19:34:30', '2024-05-15 19:34:30'),
(100, 'GT', 10, '2024-05-15 19:34:38', '2024-05-15 19:34:38'),
(101, 'DB11', 11, '2024-05-15 19:35:30', '2024-05-15 19:35:30'),
(102, 'DB11 Volante', 11, '2024-05-15 19:35:36', '2024-05-15 19:35:36'),
(103, 'DB12', 11, '2024-05-15 19:35:40', '2024-05-15 19:35:40'),
(104, 'DB12 Volante', 11, '2024-05-15 19:35:45', '2024-05-15 19:35:45'),
(105, 'DBS', 11, '2024-05-15 19:35:47', '2024-05-15 19:35:47'),
(106, 'DBX', 11, '2024-05-15 19:35:51', '2024-05-15 19:35:51'),
(107, 'Rapide AMR', 11, '2024-05-15 19:36:00', '2024-05-15 19:36:00'),
(108, 'Rapide E', 11, '2024-05-15 19:36:04', '2024-05-15 19:36:04'),
(109, 'V8 Vantage', 11, '2024-05-15 19:36:14', '2024-05-15 19:36:14'),
(110, 'V8 Vantage S', 11, '2024-05-15 19:36:17', '2024-05-15 19:36:17'),
(111, 'V8 Vantage S Roadster', 11, '2024-05-15 19:36:20', '2024-05-15 19:36:20'),
(112, 'V12 Speedster', 11, '2024-05-15 19:36:29', '2024-05-15 19:36:29'),
(113, 'V12 Vantage', 11, '2024-05-15 19:36:35', '2024-05-15 19:36:35'),
(114, 'V12 Vantage S Roadster', 11, '2024-05-15 19:36:41', '2024-05-15 19:36:41'),
(115, 'V12 Zagato', 11, '2024-05-15 19:36:49', '2024-05-15 19:36:49'),
(116, 'Valhalla', 11, '2024-05-15 19:36:56', '2024-05-15 19:36:56'),
(117, 'Vantage GT8', 11, '2024-05-15 19:37:04', '2024-05-15 19:37:04'),
(118, 'Vantage Roadster', 11, '2024-05-15 19:37:11', '2024-05-15 19:37:11'),
(119, 'Cygnet', 11, '2024-05-15 19:37:22', '2024-05-15 19:37:22'),
(120, 'DB AR1', 11, '2024-05-15 19:37:29', '2024-05-15 19:37:29'),
(121, 'DB Mark III', 11, '2024-05-15 19:37:36', '2024-05-15 19:37:36'),
(122, 'DB2', 11, '2024-05-15 19:37:41', '2024-05-15 19:37:41'),
(123, 'DB4', 11, '2024-05-15 19:37:43', '2024-05-15 19:37:43'),
(124, 'DB5', 11, '2024-05-15 19:37:47', '2024-05-15 19:37:47'),
(125, 'DB6', 11, '2024-05-15 19:37:49', '2024-05-15 19:37:49'),
(126, 'DB6 Volante', 11, '2024-05-15 19:37:56', '2024-05-15 19:37:56'),
(127, 'DB7', 11, '2024-05-15 19:38:01', '2024-05-15 19:38:01'),
(128, 'DB7 Volante', 11, '2024-05-15 19:38:06', '2024-05-15 19:38:06'),
(129, 'DB9', 11, '2024-05-15 19:38:13', '2024-05-15 19:38:13'),
(130, 'DB9 Volante', 11, '2024-05-15 19:38:19', '2024-05-15 19:38:19'),
(131, 'DBS Volante', 11, '2024-05-15 19:38:27', '2024-05-15 19:38:27'),
(132, 'Lagonda', 11, '2024-05-15 19:38:37', '2024-05-15 19:38:37'),
(133, 'One-77', 11, '2024-05-15 19:38:43', '2024-05-15 19:38:43'),
(134, 'Rapide', 11, '2024-05-15 19:38:49', '2024-05-15 19:38:49'),
(135, 'Rapide S', 11, '2024-05-15 19:38:52', '2024-05-15 19:38:52'),
(136, 'V12 Vantage AMR', 11, '2024-05-15 19:39:01', '2024-05-15 19:39:01'),
(137, 'V8 Volante', 11, '2024-05-15 19:39:19', '2024-05-15 19:39:19'),
(138, 'Vanquish', 11, '2024-05-15 19:39:26', '2024-05-15 19:39:26'),
(139, 'Vanquish S', 11, '2024-05-15 19:39:28', '2024-05-15 19:39:28'),
(140, 'Vanquish Volante', 11, '2024-05-15 19:39:32', '2024-05-15 19:39:32'),
(141, 'Vantage GT12', 11, '2024-05-15 19:39:43', '2024-05-15 19:39:43'),
(142, 'Virage', 11, '2024-05-15 19:39:55', '2024-05-15 19:39:55'),
(143, 'Virage Volante', 11, '2024-05-15 19:40:00', '2024-05-15 19:40:00'),
(144, 'Virage Vulcan', 11, '2024-05-15 19:40:04', '2024-05-15 19:40:04');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Aleksei', 'bananyvanaly@gmail.com', '+37253322480', '$2a$08$0FuEb46VpjsiBLeK7IEdsOKz5iLJIdfetSbKT4mpkJdFgp.GAtBpC', '2024-05-15 07:30:44', '2024-05-15 07:30:44');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `model` (`model`),
  ADD KEY `owner` (`owner`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`model`) REFERENCES `models` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`owner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
