-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2026 lúc 01:14 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanly_datlich_oto`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `booking_date` varchar(255) NOT NULL,
  `booking_time` varchar(255) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'PENDING',
  `car_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `appointments`
--

INSERT INTO `appointments` (`id`, `customer_name`, `phone`, `booking_date`, `booking_time`, `service_type`, `status`, `car_id`) VALUES
(1, 'Hà Tiến Thịnh', '0912345678', '2026-06-10', '08:00 - 10:00', 'LAI_THU', 'APPROVED', 1),
(2, 'Nguyễn Hồng Trường', '0987654321', '2026-06-11', '14:00 - 16:00', 'BAO_DUONG', 'APPROVED', 3),
(3, 'thinhkhongrotmon', '0766069050', '2026-06-04', '08:00 - 10:00', 'LAI_THU', 'PENDING', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `price`, `image_url`, `description`) VALUES
(1, 'VinFast VF8', 'VinFast', 1090000000, 'https://images.unsplash.com/photo-1617788138017-80ad40651399?q=80&w=600', 'Xe SUV điện thông minh phân khúc D, trang bị hệ thống trợ lái nâng cao ADAS và trợ lý ảo tiếng Việt.'),
(2, 'VinFast VF9', 'VinFast', 1491000000, 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=600', 'Dòng xe SUV điện hạng sang phân khúc E, không gian rộng rãi 7 chỗ ngồi, tích hợp trần kính toàn cảnh.'),
(3, 'Toyota Camry 2.5Q', 'Toyota', 1405000000, 'https://images.unsplash.com/photo-1555215695-3004980ad54e?q=80&w=600', 'Dòng sedan hạng D cao cấp, vận hành bền bỉ, trang bị gói an toàn Toyota Safety Sense chủ động.'),
(4, 'Honda CR-V L', 'Honda', 1159000000, 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?q=80&w=600', 'Mẫu xe Crossover 7 chỗ mạnh mẽ, động cơ VTEC Turbo tăng tốc mượt mà, tiện nghi ngập tràn.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_appointments_cars` (`car_id`);

--
-- Chỉ mục cho bảng `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FK_appointments_cars` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
