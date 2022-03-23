-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10 فبراير 2022 الساعة 07:31
-- إصدار الخادم: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibraryshop`
--

-- --------------------------------------------------------

--
-- بنية الجدول `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(11) NOT NULL,
  `ab_name` varchar(45) NOT NULL,
  `vision` text NOT NULL,
  `goals` text NOT NULL,
  `user_id` int(10) NOT NULL,
  `auth_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `ads`
--

CREATE TABLE `ads` (
  `ads_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `authors`
--

CREATE TABLE `authors` (
  `id_auth` int(10) NOT NULL,
  `au_email` varchar(45) NOT NULL,
  `auth_password` varchar(45) NOT NULL,
  `auth_image` varchar(255) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `offers_id` int(11) NOT NULL,
  `roles_id` int(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creat_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `books`
--

CREATE TABLE `books` (
  `id_book` int(10) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantities` int(11) NOT NULL,
  `kind` varchar(45) NOT NULL,
  `imges` varchar(45) NOT NULL,
  `id_pub` int(11) NOT NULL,
  `id_auth` int(10) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_offer` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `book_id` int(10) NOT NULL,
  `quantities` int(11) NOT NULL,
  `price` double NOT NULL,
  `book_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(45) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `dir_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `contact_us`
--

CREATE TABLE `contact_us` (
  `cont_id` int(11) NOT NULL,
  `massge` text NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `countries`
--

CREATE TABLE `countries` (
  `id_country` int(11) NOT NULL,
  `cou_name` varchar(45) NOT NULL,
  `flag` varchar(45) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `u_id` int(11) NOT NULL,
  `auth_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `directorate`
--

CREATE TABLE `directorate` (
  `id_dir` int(11) NOT NULL,
  `dir_name` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `favorite`
--

CREATE TABLE `favorite` (
  `id_fav` int(11) NOT NULL,
  `id_book` int(10) NOT NULL,
  `book_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `isolation`
--

CREATE TABLE `isolation` (
  `iso_id` int(11) NOT NULL,
  `iso_name` int(10) NOT NULL,
  `dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL,
  `kind_offer` enum('discount','take_one free','gift') NOT NULL,
  `id_book` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `pay_kind` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `id_book` int(10) NOT NULL,
  `price` double NOT NULL,
  `quantities` int(11) NOT NULL,
  `name_book` varchar(45) NOT NULL,
  `id_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `phone`
--

CREATE TABLE `phone` (
  `id_phone` int(11) NOT NULL,
  `phone_name` varchar(45) NOT NULL,
  `coun_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `auth_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `publisher_house`
--

CREATE TABLE `publisher_house` (
  `id_pub` int(11) NOT NULL,
  `pub_name` int(11) NOT NULL,
  `id_address` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `phone_id` int(10) NOT NULL,
  `dir_id` int(11) NOT NULL,
  `isol_id` int(11) NOT NULL,
  `book_id` int(10) NOT NULL,
  `create_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  `author_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `sliders`
--

CREATE TABLE `sliders` (
  `slider_id` int(11) NOT NULL,
  `imges` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_email` varchar(45) NOT NULL,
  `u_password` varchar(45) NOT NULL,
  `u_first_name` varchar(255) NOT NULL,
  `u_second_name` varchar(45) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `favorite_id` int(11) NOT NULL,
  `comment_id` int(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  `isolation_id` int(11) NOT NULL,
  `book_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `offer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_auth`),
  ADD KEY `Authors_cart_id_Cart_id_cart` (`cart_id`),
  ADD KEY `Authors_order_id_Orders_order_id` (`order_id`),
  ADD KEY `Authors_offers_id_Offers_offer_id` (`offers_id`),
  ADD KEY `Authors_user_id_Users_u_id` (`user_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `id_pub` (`id_pub`),
  ADD KEY `books_ibfk_1` (`id_auth`),
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_cat` (`id_cat`),
  ADD KEY `id_cart` (`id_cart`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name` (`cat_name`),
  ADD KEY `cat_name_3` (`cat_name`),
  ADD KEY `users_id` (`users_id`);
ALTER TABLE `categories` ADD FULLTEXT KEY `cat_name_2` (`cat_name`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`cont_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_country`);

--
-- Indexes for table `directorate`
--
ALTER TABLE `directorate`
  ADD PRIMARY KEY (`id_dir`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id_fav`);

--
-- Indexes for table `isolation`
--
ALTER TABLE `isolation`
  ADD PRIMARY KEY (`iso_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id_phone`);

--
-- Indexes for table `publisher_house`
--
ALTER TABLE `publisher_house`
  ADD PRIMARY KEY (`id_pub`),
  ADD KEY `publisher_house_city_id_City_id_city` (`city_id`),
  ADD KEY `publisher_house_country_id_Countries_id_country` (`country_id`),
  ADD KEY `publisher_house_dir_id_Directorate_id_dir` (`dir_id`),
  ADD KEY `publisher_house_isol_id_Isolation_iso_id` (`isol_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `Users_phone_id_Phone_id_phone` (`phone_id`),
  ADD KEY `Users_favorite_id_Favorite_id_fav` (`favorite_id`),
  ADD KEY `Users_country_id_Countries_id_country` (`country_id`),
  ADD KEY `Users_city_id_City_id_city` (`city_id`),
  ADD KEY `Users_director_id_Directorate_id_dir` (`director_id`),
  ADD KEY `Users_isolation_id_Isolation_iso_id` (`isolation_id`),
  ADD KEY `Users_order_id_Orders_order_id` (`order_id`),
  ADD KEY `Users_cart_id_Cart_id_cart` (`cart_id`),
  ADD KEY `Users_offer_id_Offers_offer_id` (`offer_id`);

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `Authors_cart_id_Cart_id_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id_cart`),
  ADD CONSTRAINT `Authors_offers_id_Offers_offer_id` FOREIGN KEY (`offers_id`) REFERENCES `offers` (`offer_id`),
  ADD CONSTRAINT `Authors_order_id_Orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `Authors_user_id_Users_u_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`u_id`);

--
-- القيود للجدول `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `books` (`id_book`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `books` (`id_book`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`id_cat`) REFERENCES `books` (`id_book`),
  ADD CONSTRAINT `books_ibfk_4` FOREIGN KEY (`id_cart`) REFERENCES `books` (`id_book`);

--
-- القيود للجدول `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `categories` (`cat_id`);

--
-- القيود للجدول `publisher_house`
--
ALTER TABLE `publisher_house`
  ADD CONSTRAINT `publisher_house_city_id_City_id_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `publisher_house_country_id_Countries_id_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id_country`),
  ADD CONSTRAINT `publisher_house_dir_id_Directorate_id_dir` FOREIGN KEY (`dir_id`) REFERENCES `directorate` (`id_dir`),
  ADD CONSTRAINT `publisher_house_isol_id_Isolation_iso_id` FOREIGN KEY (`isol_id`) REFERENCES `isolation` (`iso_id`);

--
-- القيود للجدول `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Users_cart_id_Cart_id_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id_cart`),
  ADD CONSTRAINT `Users_city_id_City_id_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `Users_country_id_Countries_id_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id_country`),
  ADD CONSTRAINT `Users_director_id_Directorate_id_dir` FOREIGN KEY (`director_id`) REFERENCES `directorate` (`id_dir`),
  ADD CONSTRAINT `Users_favorite_id_Favorite_id_fav` FOREIGN KEY (`favorite_id`) REFERENCES `favorite` (`id_fav`),
  ADD CONSTRAINT `Users_isolation_id_Isolation_iso_id` FOREIGN KEY (`isolation_id`) REFERENCES `isolation` (`iso_id`),
  ADD CONSTRAINT `Users_offer_id_Offers_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`offer_id`),
  ADD CONSTRAINT `Users_order_id_Orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `Users_phone_id_Phone_id_phone` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id_phone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
