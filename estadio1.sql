-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 03-06-2025 a las 06:19:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estadio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_31_192007_create_task_table', 2),
(7, '2025_05_31_195838_create__asientos_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IklavZrWDXRpRATwb8lRZUZ2YJjZRLrH5mwKKSY5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFZSaWZmWVRzVHEweUtGZEFCeDVWRVozZjdhS0prUVJGM3pqOGREZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9DZW50cmFsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748922058);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('pendiente','en progreso','Completada') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(100) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Name`, `Email`, `apellido`, `cedula`) VALUES
(10, 'alvaro', 'alvaroaa@gmail.com', 'aaaa', 12222222222222),
(11, 'Juan', 'zcfs@faklsdfksl.com', 'jose', 120009),
(12, 'daniel', 'ddd@gmail.com', 'puentes', 1111),
(13, 'daniel', 'aaa@gmail.com', 'puentes', 1111),
(14, 'daniel', 'ddd@gmail.com', 'puentes', 111222),
(15, 'daniel', 'ddd@gmail.com', 'puentes', 111222),
(16, 'daniel', 'ddd@gmail.com', 'puentes', 111222),
(17, 'dana', 'aaa@gmai.com', 'alveira', 4444),
(18, 'daniel', 'dani@gmail.com', 'puentes', 111222),
(19, 'daniel', 'ddd@gmail.com', 'puentes', 1111),
(20, 'uuuu', 'ddd@gmail.com', 'puentes', 1111),
(21, 'prueba', 'prueba@gmaill.com', 'test', 11444),
(22, 'alvaro', 'aaaa@gmail.com', 'aaa', 555),
(23, 'Alvaro', 'aa@gmaiharhl.c', 'Murcia', 111111),
(24, 'gdwew', 'aaa@ffafa', 'gdwgfwqegf', 1111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `idasiento` int(10) UNSIGNED NOT NULL,
  `Dia` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `usuario_id`, `idasiento`, `Dia`) VALUES
(1, 10, 64, 2),
(2, 10, 69, 2),
(3, 10, 70, 2),
(4, 10, 71, 2),
(5, 10, 65, 2),
(6, 10, 66, 2),
(7, 10, 72, 2),
(8, 10, 68, 1),
(9, 10, 75, 1),
(10, 11, 136, 1),
(11, 11, 137, 1),
(12, 19, 204, 1),
(13, 19, 205, 1),
(14, 19, 223, 1),
(15, 19, 224, 1),
(16, 20, 234, 2),
(17, 20, 235, 2),
(18, 20, 236, 2),
(19, 20, 237, 2),
(20, 20, 245, 2),
(21, 20, 253, 2),
(22, 20, 254, 2),
(23, 20, 255, 2),
(24, 22, 258, 1),
(25, 22, 259, 1),
(26, 22, 260, 1),
(27, 23, 274, 1),
(28, 23, 275, 1),
(29, 23, 276, 1),
(30, 23, 277, 1),
(31, 23, 278, 1),
(32, 23, 279, 1),
(33, 23, 280, 1),
(34, 23, 281, 1),
(35, 23, 283, 1),
(36, 23, 284, 1),
(37, 23, 289, 1),
(38, 23, 290, 1),
(39, 23, 293, 1),
(40, 23, 294, 1),
(41, 23, 295, 1),
(42, 23, 296, 1),
(43, 21, 206, 2),
(44, 21, 207, 2),
(45, 21, 221, 2),
(46, 21, 222, 2),
(47, 21, 225, 2),
(48, 21, 226, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_asientos`
--

CREATE TABLE `_asientos` (
  `id` int(100) UNSIGNED NOT NULL,
  `Silla` varchar(255) NOT NULL,
  `Precio` decimal(8,2) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('VIP','GENERAl') NOT NULL,
  `tipo` enum('Disponible','ocupada') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `funcion` varchar(50) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `_asientos`
--

INSERT INTO `_asientos` (`id`, `Silla`, `Precio`, `due_date`, `status`, `tipo`, `created_at`, `updated_at`, `funcion`, `descuento`) VALUES
(64, 'A1', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:07:02', 'lilo', 20.00),
(65, 'A2', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:15:56', 'lilo', 20.00),
(66, 'A3', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:15:56', 'lilo', 20.00),
(67, 'B1', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:05:52', '2025-06-01 23:05:52', 'lilo', 20.00),
(68, 'B2', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-01 23:05:52', '2025-06-02 02:01:25', 'lilo', 20.00),
(69, 'B3', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:07:02', 'lilo', 20.00),
(70, 'C1', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:07:02', 'lilo', 20.00),
(71, 'C2', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:07:02', 'lilo', 20.00),
(72, 'C3', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-01 23:05:52', '2025-06-01 23:15:56', 'lilo', 20.00),
(73, 'D1', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:05:52', '2025-06-01 23:05:52', 'lilo', 20.00),
(74, 'D2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:05:52', '2025-06-01 23:05:52', 'lilo', 20.00),
(75, 'D3', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-01 23:05:52', '2025-06-02 02:01:25', 'lilo', 20.00),
(76, 'A1', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(77, 'A2', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(78, 'A3', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(79, 'A4', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(80, 'A5', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(81, 'A6', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(82, 'A7', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(83, 'A8', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(84, 'A9', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(85, 'A10', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(86, 'A11', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(87, 'A20', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(88, 'B2', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(89, 'B3', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(90, 'B4', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(91, 'B5', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(92, 'B6', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(93, 'B7', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(94, 'B8', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(95, 'B9', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(96, 'B12', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(97, 'B13', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(98, 'B14', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(99, 'B15', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(100, 'B16', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(101, 'B17', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(102, 'B18', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(103, 'B19', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(104, 'C1', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(105, 'C2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(106, 'C3', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(107, 'C4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(108, 'C5', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(109, 'C6', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(110, 'C7', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(111, 'C8', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(112, 'C9', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(113, 'C10', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(114, 'C11', 21000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(115, 'C13', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(116, 'C14', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(117, 'C15', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(118, 'C16', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(119, 'C17', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(120, 'C18', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(121, 'C20', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(122, 'D2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(123, 'D9', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(124, 'D11', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(125, 'D12', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(126, 'D13', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(127, 'D14', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(128, 'D15', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(129, 'D16', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(130, 'D17', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(131, 'D18', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(132, 'D19', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(133, 'D20', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-01 23:26:08', '2025-06-01 23:26:08', 'mohana', 20.00),
(134, 'A1', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:02:05', '2025-06-02 02:02:05', 'rapidos y furiosos', 20.00),
(135, 'A2', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:02:05', '2025-06-02 02:02:05', 'rapidos y furiosos', 20.00),
(136, 'A13', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-02 02:02:05', '2025-06-02 02:02:37', 'rapidos y furiosos', 20.00),
(137, 'C4', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 02:02:05', '2025-06-02 02:02:37', 'rapidos y furiosos', 20.00),
(138, 'A1', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(139, 'A2', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(140, 'A3', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(141, 'A4', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(142, 'A5', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(143, 'A6', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(144, 'A7', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(145, 'A8', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(146, 'A9', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(147, 'A10', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(148, 'A11', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(149, 'A20', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(150, 'B1', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(151, 'B2', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(152, 'B3', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(153, 'B4', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(154, 'B5', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(155, 'B6', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(156, 'B7', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(157, 'B8', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(158, 'B9', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(159, 'B10', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(160, 'B12', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(161, 'B13', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(162, 'B14', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(163, 'B15', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(164, 'B16', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(165, 'B17', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(166, 'B18', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(167, 'B19', 40000.00, NULL, 'VIP', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(168, 'C2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(169, 'C3', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(170, 'C4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(171, 'C5', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(172, 'C6', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(173, 'C7', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(174, 'C8', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(175, 'C12', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(176, 'C13', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(177, 'C14', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(178, 'C15', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(179, 'C16', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(180, 'C17', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(181, 'C18', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(182, 'D2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(183, 'D4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(184, 'D6', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(185, 'D8', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(186, 'D10', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(187, 'D11', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(188, 'D13', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(189, 'D15', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(190, 'D17', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(191, 'D19', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 02:03:50', '2025-06-02 02:03:50', 'hulk', 30.00),
(192, 'A8', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:25:44', '2025-06-02 20:25:44', 'fiesta de las salchichas', 0.00),
(193, 'A18', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:25:44', '2025-06-02 20:25:44', 'fiesta de las salchichas', 0.00),
(194, 'B4', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:25:44', '2025-06-02 20:25:44', 'fiesta de las salchichas', 0.00),
(195, 'C4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:25:44', '2025-06-02 20:25:44', 'fiesta de las salchichas', 0.00),
(196, 'D4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:25:44', '2025-06-02 20:25:44', 'fiesta de las salchichas', 0.00),
(197, 'A3', 3456.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(198, 'B3', 3456.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(199, 'B4', 3456.00, NULL, 'VIP', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(200, 'C4', 1111.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(201, 'C6', 1111.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(202, 'D3', 1111.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(203, 'D4', 1111.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 20:38:01', '2025-06-02 20:38:01', 'ddddd', 0.00),
(204, 'A1', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-02 21:32:42', 'Dragon Ball z', 0.00),
(205, 'A2', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-02 21:32:42', 'Dragon Ball z', 0.00),
(206, 'A3', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(207, 'A4', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(208, 'A5', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(209, 'A6', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(210, 'A7', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(211, 'A8', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(212, 'A16', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(213, 'A17', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(214, 'A18', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(215, 'B1', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(216, 'B2', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(217, 'B3', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(218, 'B4', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(219, 'B5', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(220, 'B6', 60000.00, NULL, 'VIP', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(221, 'B14', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(222, 'B15', 60000.00, NULL, 'VIP', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(223, 'C2', 50000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 21:02:29', '2025-06-02 21:32:42', 'Dragon Ball z', 0.00),
(224, 'C3', 50000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 21:02:29', '2025-06-02 21:32:42', 'Dragon Ball z', 0.00),
(225, 'C4', 50000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(226, 'C5', 50000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 21:02:29', '2025-06-03 07:22:15', 'Dragon Ball z', 0.00),
(227, 'C6', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(228, 'C7', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(229, 'C8', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(230, 'D4', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(231, 'D5', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(232, 'D6', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(233, 'D7', 50000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 21:02:29', '2025-06-02 21:02:29', 'Dragon Ball z', 0.00),
(234, 'A3', 70000.00, NULL, 'VIP', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(235, 'A4', 70000.00, NULL, 'VIP', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(236, 'A5', 70000.00, NULL, 'VIP', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(237, 'A6', 70000.00, NULL, 'VIP', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(238, 'A7', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(239, 'A8', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(240, 'A9', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(241, 'A10', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(242, 'A13', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(243, 'A14', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(244, 'A15', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(245, 'A16', 70000.00, NULL, 'VIP', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(246, 'B4', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(247, 'B5', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(248, 'B6', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(249, 'B7', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(250, 'B8', 70000.00, NULL, 'VIP', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(251, 'C3', 60000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(252, 'C4', 60000.00, NULL, 'GENERAl', 'Disponible', '2025-06-02 22:13:50', '2025-06-02 22:13:50', 'tttt', 20.00),
(253, 'C5', 60000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(254, 'D4', 60000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(255, 'D5', 60000.00, NULL, 'GENERAl', 'ocupada', '2025-06-02 22:13:50', '2025-06-02 22:14:12', 'tttt', 20.00),
(256, 'A1', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(257, 'A2', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(258, 'A3', 3564.00, NULL, 'VIP', 'ocupada', '2025-06-03 01:10:06', '2025-06-03 05:48:22', 'WQQQQQQ', 12.00),
(259, 'A4', 3564.00, NULL, 'VIP', 'ocupada', '2025-06-03 01:10:06', '2025-06-03 05:48:22', 'WQQQQQQ', 12.00),
(260, 'A5', 3564.00, NULL, 'VIP', 'ocupada', '2025-06-03 01:10:06', '2025-06-03 05:48:22', 'WQQQQQQ', 12.00),
(261, 'A6', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(262, 'A7', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(263, 'B1', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(264, 'B2', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(265, 'B3', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(266, 'B4', 3564.00, NULL, 'VIP', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(267, 'C3', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(268, 'C4', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(269, 'C5', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(270, 'C6', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(271, 'D5', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(272, 'D6', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(273, 'D7', 34567.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 01:10:06', '2025-06-03 01:10:06', 'WQQQQQQ', 12.00),
(274, 'A1', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(275, 'A2', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(276, 'A3', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(277, 'A4', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(278, 'A5', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(279, 'A6', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(280, 'A7', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(281, 'A8', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(282, 'A9', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(283, 'A15', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(284, 'A16', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(285, 'B1', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(286, 'B2', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(287, 'B3', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(288, 'B4', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(289, 'B5', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(290, 'B6', 30000.00, NULL, 'VIP', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(291, 'B7', 30000.00, NULL, 'VIP', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(292, 'C1', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(293, 'C2', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(294, 'C3', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(295, 'C4', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(296, 'C5', 20000.00, NULL, 'GENERAl', 'ocupada', '2025-06-03 06:57:06', '2025-06-03 07:02:32', 'karate Kid', 20.00),
(297, 'C6', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(298, 'C7', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(299, 'C15', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(300, 'C16', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(301, 'C17', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(302, 'D1', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(303, 'D2', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(304, 'D3', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(305, 'D4', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(306, 'D5', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(307, 'D6', 20000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 06:57:06', '2025-06-03 06:57:06', 'karate Kid', 20.00),
(308, 'A1', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(309, 'A12', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(310, 'A13', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(311, 'A14', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(312, 'B15', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(313, 'B16', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(314, 'B18', 20000.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(315, 'C5', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(316, 'C6', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(317, 'C18', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(318, 'C19', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(319, 'C20', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(320, 'D3', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(321, 'D4', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(322, 'D8', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(323, 'D9', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(324, 'D10', 10000.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:19:39', '2025-06-03 07:19:39', 'wwwwwwwww', 30.00),
(325, 'A1', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(326, 'A2', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(327, 'A3', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(328, 'A4', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(329, 'A5', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(330, 'A6', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(331, 'A7', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(332, 'A8', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(333, 'A9', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(334, 'A10', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(335, 'A11', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(336, 'A12', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(337, 'A13', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(338, 'A14', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(339, 'A15', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(340, 'A16', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(341, 'A17', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(342, 'A18', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(343, 'A19', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(344, 'A20', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(345, 'B1', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(346, 'B2', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(347, 'B3', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(348, 'B4', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(349, 'B5', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(350, 'B6', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(351, 'B7', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(352, 'B8', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(353, 'B9', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(354, 'B10', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(355, 'B11', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(356, 'B12', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(357, 'B13', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(358, 'B14', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(359, 'B15', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(360, 'B16', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(361, 'B17', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(362, 'B18', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(363, 'B19', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(364, 'B20', 11111.00, NULL, 'VIP', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(365, 'C1', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(366, 'C2', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(367, 'C3', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(368, 'C4', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(369, 'C5', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(370, 'C6', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(371, 'C7', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(372, 'C8', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(373, 'C9', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(374, 'C10', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(375, 'C11', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(376, 'C12', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(377, 'C13', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(378, 'C14', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(379, 'C15', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(380, 'C16', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(381, 'C17', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(382, 'C18', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(383, 'C19', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(384, 'C20', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(385, 'D1', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(386, 'D2', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(387, 'D3', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(388, 'D4', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(389, 'D5', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(390, 'D6', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(391, 'D7', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(392, 'D8', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(393, 'D9', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(394, 'D10', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(395, 'D11', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(396, 'D12', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(397, 'D13', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(398, 'D14', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(399, 'D15', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(400, 'D16', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(401, 'D17', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(402, 'D18', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(403, 'D19', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00),
(404, 'D20', 111.00, NULL, 'GENERAl', 'Disponible', '2025-06-03 07:38:22', '2025-06-03 07:38:22', 'he', 23.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idasiento` (`idasiento`);

--
-- Indices de la tabla `_asientos`
--
ALTER TABLE `_asientos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `_asientos`
--
ALTER TABLE `_asientos`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idasiento`) REFERENCES `_asientos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
