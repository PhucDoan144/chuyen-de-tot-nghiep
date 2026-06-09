-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 09, 2026 lúc 03:35 PM
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
-- Cơ sở dữ liệu: `phongtro_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao`
--

CREATE TABLE `bao_cao` (
  `ma_bao_cao` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `loai_bao_cao` varchar(100) NOT NULL,
  `trang_thai` enum('PENDING','RESOLVED') DEFAULT 'PENDING',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_dich_vu`
--

CREATE TABLE `chi_tiet_dich_vu` (
  `ma_phong` int(11) NOT NULL,
  `ma_dich_vu` int(11) NOT NULL,
  `chi_so_cu` int(11) DEFAULT 0,
  `chi_so_moi` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_tien_ich`
--

CREATE TABLE `chi_tiet_tien_ich` (
  `ma_phong` int(11) NOT NULL,
  `ma_tien_ich` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_tien_ich`
--

INSERT INTO `chi_tiet_tien_ich` (`ma_phong`, `ma_tien_ich`) VALUES
(10, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia`
--

CREATE TABLE `danh_gia` (
  `ma_danh_gia` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `ma_nguoi_thue` int(11) NOT NULL,
  `so_sao` int(11) NOT NULL CHECK (`so_sao` >= 1 and `so_sao` <= 5),
  `noi_dung` text DEFAULT NULL,
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia`
--

INSERT INTO `danh_gia` (`ma_danh_gia`, `ma_phong`, `ma_nguoi_thue`, `so_sao`, `noi_dung`, `ngay_tao`) VALUES
(1, 10, 1, 5, 'nhà đẹp sạch sẽ', '2026-06-04 02:23:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dich_vu`
--

CREATE TABLE `dich_vu` (
  `ma_dich_vu` int(11) NOT NULL,
  `ten_dich_vu` varchar(100) NOT NULL,
  `don_gia` decimal(15,2) NOT NULL,
  `don_vi_tinh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_phong`
--

CREATE TABLE `hinh_anh_phong` (
  `ma_anh` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `duong_dan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh_phong`
--

INSERT INTO `hinh_anh_phong` (`ma_anh`, `ma_phong`, `duong_dan`) VALUES
(4, 5, 'api/uploads/1780507952_nha1.jpg'),
(5, 5, 'api/uploads/1780507952_nha1-1.jpg'),
(6, 5, 'api/uploads/1780507952_nha1-2.jpg'),
(7, 5, 'api/uploads/1780507952_nha1-3.jpg'),
(8, 5, 'api/uploads/1780507952_nha1-4.jpg'),
(9, 6, 'api/uploads/1780508278_nha2.jpg'),
(10, 6, 'api/uploads/1780508278_nha2-1.jpg'),
(11, 6, 'api/uploads/1780508278_nha2-2.jpg'),
(12, 6, 'api/uploads/1780508278_nha2-3.jpg'),
(13, 7, 'api/uploads/1780508515_nha3.jpg'),
(14, 7, 'api/uploads/1780508515_nha3-1.jpg'),
(15, 7, 'api/uploads/1780508515_nha3-2.jpg'),
(16, 7, 'api/uploads/1780508515_nha3-3.jpg'),
(17, 7, 'api/uploads/1780508515_nha3-4.jpg'),
(18, 8, 'api/uploads/1780508817_nha4.jpg'),
(19, 8, 'api/uploads/1780508817_nha4-1.jpg'),
(20, 8, 'api/uploads/1780508817_nha4-2.jpg'),
(21, 8, 'api/uploads/1780508817_nha4-3.jpg'),
(22, 8, 'api/uploads/1780508817_nha4-4.jpg'),
(23, 9, 'api/uploads/1780509134_nha5.jpg'),
(24, 9, 'api/uploads/1780509134_nha5-1.jpg'),
(25, 9, 'api/uploads/1780509134_nha5-2.jpg'),
(26, 9, 'api/uploads/1780509134_nha5-3.jpg'),
(27, 9, 'api/uploads/1780509134_nha5-4.jpg'),
(28, 10, 'api/uploads/1780509346_nha6.jpg'),
(29, 10, 'api/uploads/1780509346_nha6-1.jpg'),
(30, 10, 'api/uploads/1780509346_nha6-2.jpg'),
(31, 10, 'api/uploads/1780509346_nha6-3.jpg'),
(32, 10, 'api/uploads/1780509346_nha6-4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don`
--

CREATE TABLE `hoa_don` (
  `ma_hoa_don` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `ma_nguoi_thue` int(11) NOT NULL,
  `thang_nam` varchar(10) NOT NULL,
  `tien_phong` decimal(15,2) DEFAULT 0.00,
  `tien_dien` decimal(15,2) DEFAULT 0.00,
  `tien_nuoc` decimal(15,2) DEFAULT 0.00,
  `tien_internet` decimal(15,2) DEFAULT 0.00,
  `tien_rac` decimal(15,2) DEFAULT 0.00,
  `tien_dich_vu_khac` decimal(15,2) DEFAULT 0.00,
  `tong_tien` decimal(15,2) DEFAULT 0.00,
  `trang_thai` varchar(50) DEFAULT 'CHUA_THANH_TOAN',
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoa_don`
--

INSERT INTO `hoa_don` (`ma_hoa_don`, `ma_phong`, `ma_nguoi_thue`, `thang_nam`, `tien_phong`, `tien_dien`, `tien_nuoc`, `tien_internet`, `tien_rac`, `tien_dich_vu_khac`, `tong_tien`, `trang_thai`, `ngay_tao`) VALUES
(1, 8, 1, '06/2026', 2500000.00, 500000.00, 200000.00, 100000.00, 50000.00, 0.00, 3350000.00, 'DA_THANH_TOAN', '2026-06-04 11:08:55'),
(2, 8, 1, '06/2026', 2500000.00, 2000000.00, 100000.00, 40000.00, 0.00, 0.00, 4640000.00, 'DA_THANH_TOAN', '2026-06-06 14:11:43'),
(3, 8, 1, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-06 14:38:10'),
(4, 10, 7, '06/2026', 1300000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1300000.00, 'DA_THANH_TOAN', '2026-06-09 14:47:27'),
(5, 10, 7, '06/2026', 1300000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1300000.00, 'DA_THANH_TOAN', '2026-06-09 14:54:00'),
(6, 8, 7, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-09 14:55:08'),
(7, 8, 7, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-09 15:02:45'),
(8, 8, 7, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-09 18:37:45'),
(9, 8, 7, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-09 19:09:23'),
(10, 8, 7, '06/2026', 2500000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500000.00, 'DA_THANH_TOAN', '2026-06-09 20:18:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don_loi_cu`
--

CREATE TABLE `hoa_don_loi_cu` (
  `ma_hoa_don` int(11) NOT NULL,
  `ma_hop_dong` int(11) NOT NULL,
  `thang_nam` varchar(10) NOT NULL,
  `tien_phong` decimal(10,2) NOT NULL,
  `tien_dien` decimal(10,2) DEFAULT 0.00,
  `tien_nuoc` decimal(10,2) DEFAULT 0.00,
  `tien_rac` decimal(10,2) DEFAULT 0.00,
  `tien_wifi` decimal(10,2) DEFAULT 0.00,
  `phi_khac` decimal(10,2) DEFAULT 0.00,
  `tong_tien` decimal(10,2) NOT NULL,
  `trang_thai` enum('CHUA_THANH_TOAN','DA_THANH_TOAN') DEFAULT 'CHUA_THANH_TOAN',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `tien_internet` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hop_dong`
--

CREATE TABLE `hop_dong` (
  `ma_hop_dong` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `ma_chu_tro` int(11) NOT NULL,
  `ma_nguoi_thue` int(11) NOT NULL,
  `tien_coc` decimal(10,2) NOT NULL,
  `gia_thue_thang` decimal(10,2) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `trang_thai` enum('CHO_KY','DA_KY','DA_HUY') DEFAULT 'CHO_KY',
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `so_luong_nguoi_o` int(11) DEFAULT 1 COMMENT 'Số người ở thực tế trong phòng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hop_dong`
--

INSERT INTO `hop_dong` (`ma_hop_dong`, `ma_phong`, `ma_chu_tro`, `ma_nguoi_thue`, `tien_coc`, `gia_thue_thang`, `ngay_bat_dau`, `ngay_ket_thuc`, `trang_thai`, `ngay_tao`, `so_luong_nguoi_o`) VALUES
(4, 8, 2, 1, 2000000.00, 2000000.00, '2026-06-04', '2026-09-04', 'CHO_KY', '2026-06-03 20:11:09', 1),
(20, 9, 2, 1, 4000000.00, 2000000.00, '2026-06-09', '2027-04-09', 'CHO_KY', '2026-06-09 07:00:04', 4),
(21, 10, 2, 7, 2600000.00, 1300000.00, '2026-06-20', '2027-01-09', 'CHO_KY', '2026-06-09 07:46:48', 2),
(22, 8, 2, 7, 5000000.00, 2500000.00, '2026-06-09', '2026-06-09', 'CHO_KY', '2026-06-09 07:54:26', 1),
(24, 8, 2, 7, 5000000.00, 2500000.00, '2026-06-09', '2026-07-09', 'CHO_KY', '2026-06-09 11:41:37', 2),
(25, 10, 2, 7, 2600000.00, 1300000.00, '2026-06-09', '2026-07-09', 'CHO_KY', '2026-06-09 11:57:03', 1),
(26, 8, 2, 1, 5000000.00, 2500000.00, '2026-06-09', '2026-07-09', 'CHO_KY', '2026-06-09 11:57:20', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lich_su_thanh_toan`
--

CREATE TABLE `lich_su_thanh_toan` (
  `ma_giao_dich` int(11) NOT NULL,
  `ma_hoa_don` int(11) NOT NULL,
  `ma_nguoi_thue` int(11) NOT NULL,
  `ngay_thanh_toan` datetime DEFAULT current_timestamp(),
  `so_tien` decimal(15,2) NOT NULL,
  `phuong_thuc_thanh_toan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_phong`
--

CREATE TABLE `loai_phong` (
  `ma_loai` int(11) NOT NULL,
  `ten_loai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `ma_nguoi_dung` int(11) NOT NULL,
  `ten_dang_nhap` varchar(50) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `anh_dai_dien` varchar(255) DEFAULT 'default-avatar.png',
  `vai_tro` enum('LESSOR','LESSEE','ADMIN') DEFAULT 'LESSEE',
  `bi_khoa` tinyint(1) DEFAULT 0,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `trang_thai` varchar(20) DEFAULT 'HOP_LE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`ma_nguoi_dung`, `ten_dang_nhap`, `mat_khau`, `so_dien_thoai`, `email`, `anh_dai_dien`, `vai_tro`, `bi_khoa`, `ngay_tao`, `trang_thai`) VALUES
(1, 'phuc144', '0954253377', '0954253377', 'kaitokino@gmail.com', 'default-avatar.png', 'LESSEE', 0, '2026-06-03 05:08:34', 'HOP_LE'),
(2, 'linh', '0954253377', '0954253377', 'kinolaem@gmail.com', 'api/uploads/avatars/1780469934_1775196727_IMG_20260222_115924_170.jpg', 'LESSOR', 0, '2026-06-03 05:09:02', 'HOP_LE'),
(3, 'admin', '0954253377', '0954253377', NULL, 'default-avatar.png', 'ADMIN', 0, '2026-06-03 05:10:55', 'HOP_LE'),
(4, 'ha', '0954253377', '0954253377', 'kinolaem@gmail.com', 'default-avatar.png', 'LESSOR', 0, '2026-06-03 11:25:00', 'HOP_LE'),
(7, 'tan123', '$2y$10$HqlzuXOvs6alQaD2suND5.VaR1aIg5IXF03hF05Nr5lcHFh2OTqoe', '0954253377', 'phuc.dn.62cntt@ntu.edu.vn', 'default-avatar.png', '', 0, '2026-06-09 07:29:19', 'HOP_LE'),
(8, 'phuc123', '$2y$10$HrztmmkNkeYiHbSdPTg4veZzFJt5NamyhBRr8VWtuYl7C.grCpI16', '0954253377', 'hoprtep@gmail.com', 'default-avatar.png', '', 0, '2026-06-09 13:20:17', 'HOP_LE'),
(9, 'chinh', '$2y$10$vPcGYs028CfAjUCBiPWmjeL0Q6wj5t4iMpIQ61bPP2KVSH90TWy8i', '0954253377', 'kaitokino144@gmail.com', 'default-avatar.png', '', 0, '2026-06-09 13:34:33', 'HOP_LE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong_tro`
--

CREATE TABLE `phong_tro` (
  `ma_phong` int(11) NOT NULL,
  `ma_chu_tro` int(11) NOT NULL,
  `ma_loai` int(11) DEFAULT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `gia_thue` decimal(10,2) NOT NULL,
  `dien_tich` decimal(5,2) NOT NULL,
  `so_luong_trong` int(11) DEFAULT 1,
  `dia_chi` varchar(255) NOT NULL,
  `vi_do` decimal(10,8) DEFAULT NULL,
  `kinh_do` decimal(11,8) DEFAULT NULL,
  `duong_dan_anh` varchar(255) DEFAULT NULL,
  `trang_thai` enum('CHO_DUYET','DANG_HIEN_THI','TU_CHOI','DA_CHO_THUE') DEFAULT 'CHO_DUYET',
  `ly_do_tu_choi` text DEFAULT NULL,
  `co_internet` tinyint(1) DEFAULT 0,
  `co_may_lanh` tinyint(1) DEFAULT 0,
  `co_don_phong` tinyint(1) DEFAULT 0,
  `bao_rac` tinyint(1) DEFAULT 0,
  `bao_dien_nuoc` tinyint(1) DEFAULT 0,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `latitude` varchar(50) DEFAULT '12.24507',
  `longitude` varchar(50) DEFAULT '109.19432',
  `tien_ich` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phong_tro`
--

INSERT INTO `phong_tro` (`ma_phong`, `ma_chu_tro`, `ma_loai`, `tieu_de`, `mo_ta`, `gia_thue`, `dien_tich`, `so_luong_trong`, `dia_chi`, `vi_do`, `kinh_do`, `duong_dan_anh`, `trang_thai`, `ly_do_tu_choi`, `co_internet`, `co_may_lanh`, `co_don_phong`, `bao_rac`, `bao_dien_nuoc`, `ngay_tao`, `latitude`, `longitude`, `tien_ich`) VALUES
(5, 4, NULL, 'Cho thuê nhà nguyên căn', 'Dt 60m, nhà trống không nội thất\r\n1pn 1pk bếp phía sau có không gian phơi đồ mát mẻ \r\n-Giá chốt 3.5tr/tháng, cọc 2 tt1. ', 3500000.00, 60.00, 1, 'hẻm 58 lương định của , nha trang', 12.25682501, 109.17378501, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:32:32', '12.24507', '109.19432', ''),
(6, 4, NULL, 'Cho thuê phòng trọ', 'Phòng sạch sẽ, cách biển 1 phút đi bộ, toà nhà được trang bị hệ thống báo cháy, cửa chống cháy cầu thang đảm bảo an toàn khi có cháy nổ. Có máy nước nóng, ban công ngắm cảnh, kệ nấu ăn, cây phơi đồ, wifi, bảo vệ chuyên nghiệp, thang máy, lau dọn, toilet trang bị đồ inox cao cấp, hệ thống camera quan sát, bảo vệ chuyên nghiệp, ra vào bằng thẻ từ, nhà để xe rộng rãi. Nằm ngay ngã 3 thuận tiện đi lại, cách biển 60m 1 phút đi bộ, gần chợ, cửa hàng tiện lợi, trường học, khu dân cư quân đội của trường Sỹ Quan Thông Tin, đảm bảo an ninh', 2300000.00, 20.00, 1, 'Phố Phan Phù Tiên, Phường Vĩnh Hải, Thành phố Nha Trang, Khánh Hòa', 12.28095449, 109.18739861, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:37:58', '12.24507', '109.19432', ''),
(7, 4, NULL, 'Cho thuê phòng trọ ngay trung tâm TP Nha Trang', 'DT: 25m², có gác lửng, toilet riêng, an ninh, yên tĩnh thoáng mát, giờ giấc tự do.', 2200000.00, 25.00, 1, '159 đường Nguyễn Khuyến, phường Vĩnh Hải, Nha Trang', 12.27881203, 109.18600886, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:41:55', '12.24507', '109.19432', ''),
(8, 2, NULL, 'Phòng trọ đẹp, tiện nghi, giá rẻ, trung tâm Nha Trang', 'Chính chủ cho thuê dãy phòng trọ mới xây, tiện nghi, thoáng mát, trung tâm TP Nha Trang.\r\nWIFI miễn phí. Điện nước giá rẻ. Lối đi riêng, không chung chủ. Chỗ để xe rộng rãi. Khu vực an ninh, yên tĩnh.', 2500000.00, 25.00, 3, '12 Hải Nam, phường Vĩnh Hải, Nha Trang.', 12.27895609, 109.19961492, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:46:57', '12.24507', '109.19432', ''),
(9, 2, NULL, 'Nhà Trọ CÁT TIÊN', 'Phòng ở dành cho hộ gia đình có trẻ em, khu yên tĩnh.\r\nHĐ 6 tháng, giờ giấc tự do có chìa khóa cổng riêng.', 2000000.00, 25.00, 3, 'Võ Cạnh, Tây Nha Trang, Khánh Hòa, Việt Nam', 12.25790488, 109.12531761, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:52:14', '12.24507', '109.19432', ''),
(10, 2, NULL, 'CHO THUÊ PHÒNG TRỌ ', '+Có bếp nấu ăn\r\n+Diện rích :20m2 có gác lửng (rộng rãi . Sạch sẽ )\r\n+Cổng riêng không chung chủ, giờ giấc tự do thoải mái 😘\r\n+Không ngập lụt vào mùa mưa\r\n+Chủ dễ tính vui vẻ và thân thiện có thể qua chuyện trò tâm sự 🥰\r\n- khu vực yên tĩnh vắng người có không gian riêng tư\r\nĐiện 3500đ/kw, nước 10k một khối', 1300000.00, 20.00, 4, '+Tổ 17 Thôn Xuân Ngọc xã Vĩnh Ngọc thành phố Nha Trang ( gần đầu cầu gỗ , phú kiểng)', 12.27508276, 109.16824187, NULL, 'DANG_HIEN_THI', NULL, 0, 0, 0, 0, 0, '2026-06-03 17:55:46', '12.24507', '109.19432', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

CREATE TABLE `thong_bao` (
  `ma_thong_bao` int(11) NOT NULL,
  `ma_nguoi_nhan` int(11) NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_thai_doc` tinyint(1) DEFAULT 0,
  `ngay_tao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_bao`
--

INSERT INTO `thong_bao` (`ma_thong_bao`, `ma_nguoi_nhan`, `noi_dung`, `trang_thai_doc`, `ngay_tao`) VALUES
(1, 2, 'Khách hàng phuc144 (ID: 1) muốn thuê phòng \'Phòng trọ đẹp, tiện nghi, giá rẻ, trung tâm Nha Trang\' (Mã phòng: 8)', 1, '2026-06-04 03:09:09'),
(2, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:09'),
(3, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:12'),
(4, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:12'),
(5, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:12'),
(6, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:12'),
(7, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-04 03:11:13'),
(8, 5, '⚠️ CẢNH BÁO TỪ BỘ PHẬN QUẢN TRỊ: tài khoản cần thêm hình ảnh xác thực (Vui lòng tuân thủ quy định để tránh bị khóa tài khoản vĩnh viễn).', 1, '2026-06-04 11:18:52'),
(9, 1, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 1, '2026-06-06 14:11:18'),
(10, 1, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 4.640.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-06 14:11:43'),
(11, 1, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-06 14:38:10'),
(12, 2, 'Khách hàng phuc144 (ID: 1) muốn thuê phòng \'CHO THUÊ PHÒNG TRỌ \' (Mã phòng: 10)', 1, '2026-06-07 14:44:50'),
(13, 4, 'Khách hàng phuc144 (ID: 1) muốn thuê phòng \'Cho thuê phòng trọ ngay trung tâm TP Nha Trang\' (Mã phòng: 7)', 0, '2026-06-09 13:43:00'),
(14, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:45'),
(15, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:47'),
(16, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:47'),
(17, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:47'),
(18, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:47'),
(19, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:47'),
(20, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:51:48'),
(21, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:54:11'),
(22, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 10). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:58:47'),
(23, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 13:59:44'),
(24, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 9). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 14:00:04'),
(25, 7, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 10). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 14:46:48'),
(26, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 1.300.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-09 14:47:27'),
(27, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 1.300.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-09 14:54:00'),
(28, 7, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 14:54:26'),
(29, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-09 14:55:08'),
(30, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ. Vui lòng kiểm tra và thanh toán.', 1, '2026-06-09 15:02:45'),
(31, 7, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 15:13:56'),
(32, 7, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 1, '2026-06-09 15:21:43'),
(33, 7, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 1, '2026-06-09 15:21:45'),
(34, 7, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 1, '2026-06-09 15:21:46'),
(35, 7, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 1, '2026-06-09 15:21:48'),
(36, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ.', 1, '2026-06-09 18:37:45'),
(37, 7, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 18:41:37'),
(38, 7, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 10). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 18:57:03'),
(39, 1, 'Chủ trọ đã gửi cho bạn một Hợp Đồng Thuê Phòng (Mã phòng: 8). Vui lòng vào mục Hợp đồng trên thanh Menu để xem chi tiết.', 1, '2026-06-09 18:57:20'),
(40, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ.', 1, '2026-06-09 19:09:23'),
(41, 7, '🔔 Chủ trọ vừa lập hóa đơn mới kỳ 06/2026. Tổng tiền: 2.500.000 VNĐ.', 1, '2026-06-09 20:18:19'),
(42, 2, '💰 Khách thuê phòng [Phòng trọ đẹp, tiện nghi, giá rẻ, trung tâm Nha Trang] vừa báo đã chuyển khoản hóa đơn kỳ 06/2026. Hãy kiểm tra tài khoản ngân hàng!', 1, '2026-06-09 20:18:41'),
(43, 7, '✅ Chủ trọ đã xác nhận thu đủ tiền hóa đơn kỳ 06/2026 của bạn. Cảm ơn bạn!', 0, '2026-06-09 20:18:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tien_ich`
--

CREATE TABLE `tien_ich` (
  `ma_tien_ich` int(11) NOT NULL,
  `ten_tien_ich` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tien_ich`
--

INSERT INTO `tien_ich` (`ma_tien_ich`, `ten_tien_ich`, `icon`) VALUES
(1, 'Internet/Wifi', '🌐'),
(2, 'Máy lạnh', '❄️'),
(3, 'Dịch vụ dọn phòng', '🧹'),
(4, 'Bao tiền rác', '🗑️'),
(5, 'Tự do lối đi', '🔑');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_nhan`
--

CREATE TABLE `tin_nhan` (
  `ma_tin_nhan` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `ma_nguoi_gui` int(11) NOT NULL,
  `ma_nguoi_nhan` int(11) NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_gui` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tin_nhan`
--

INSERT INTO `tin_nhan` (`ma_tin_nhan`, `ma_phong`, `ma_nguoi_gui`, `ma_nguoi_nhan`, `noi_dung`, `ngay_gui`) VALUES
(1, 8, 1, 2, 'chào cô', '2026-06-04 02:48:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeu_thich`
--

CREATE TABLE `yeu_thich` (
  `ma_nguoi_dung` int(11) NOT NULL,
  `ma_phong` int(11) NOT NULL,
  `ngay_luu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD PRIMARY KEY (`ma_bao_cao`),
  ADD KEY `ma_phong` (`ma_phong`);

--
-- Chỉ mục cho bảng `chi_tiet_dich_vu`
--
ALTER TABLE `chi_tiet_dich_vu`
  ADD PRIMARY KEY (`ma_phong`,`ma_dich_vu`),
  ADD KEY `ma_dich_vu` (`ma_dich_vu`);

--
-- Chỉ mục cho bảng `chi_tiet_tien_ich`
--
ALTER TABLE `chi_tiet_tien_ich`
  ADD PRIMARY KEY (`ma_phong`,`ma_tien_ich`),
  ADD KEY `ma_tien_ich` (`ma_tien_ich`);

--
-- Chỉ mục cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD PRIMARY KEY (`ma_danh_gia`),
  ADD KEY `ma_phong` (`ma_phong`),
  ADD KEY `ma_nguoi_thue` (`ma_nguoi_thue`);

--
-- Chỉ mục cho bảng `dich_vu`
--
ALTER TABLE `dich_vu`
  ADD PRIMARY KEY (`ma_dich_vu`);

--
-- Chỉ mục cho bảng `hinh_anh_phong`
--
ALTER TABLE `hinh_anh_phong`
  ADD PRIMARY KEY (`ma_anh`),
  ADD KEY `ma_phong` (`ma_phong`);

--
-- Chỉ mục cho bảng `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD PRIMARY KEY (`ma_hoa_don`);

--
-- Chỉ mục cho bảng `hoa_don_loi_cu`
--
ALTER TABLE `hoa_don_loi_cu`
  ADD PRIMARY KEY (`ma_hoa_don`),
  ADD KEY `ma_hop_dong` (`ma_hop_dong`);

--
-- Chỉ mục cho bảng `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD PRIMARY KEY (`ma_hop_dong`),
  ADD KEY `ma_phong` (`ma_phong`),
  ADD KEY `ma_chu_tro` (`ma_chu_tro`),
  ADD KEY `ma_nguoi_thue` (`ma_nguoi_thue`);

--
-- Chỉ mục cho bảng `lich_su_thanh_toan`
--
ALTER TABLE `lich_su_thanh_toan`
  ADD PRIMARY KEY (`ma_giao_dich`),
  ADD KEY `ma_hoa_don` (`ma_hoa_don`),
  ADD KEY `ma_nguoi_thue` (`ma_nguoi_thue`);

--
-- Chỉ mục cho bảng `loai_phong`
--
ALTER TABLE `loai_phong`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`ma_nguoi_dung`),
  ADD UNIQUE KEY `ten_dang_nhap` (`ten_dang_nhap`);

--
-- Chỉ mục cho bảng `phong_tro`
--
ALTER TABLE `phong_tro`
  ADD PRIMARY KEY (`ma_phong`),
  ADD KEY `ma_chu_tro` (`ma_chu_tro`),
  ADD KEY `ma_loai` (`ma_loai`);

--
-- Chỉ mục cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD PRIMARY KEY (`ma_thong_bao`);

--
-- Chỉ mục cho bảng `tien_ich`
--
ALTER TABLE `tien_ich`
  ADD PRIMARY KEY (`ma_tien_ich`);

--
-- Chỉ mục cho bảng `tin_nhan`
--
ALTER TABLE `tin_nhan`
  ADD PRIMARY KEY (`ma_tin_nhan`);

--
-- Chỉ mục cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD PRIMARY KEY (`ma_nguoi_dung`,`ma_phong`),
  ADD KEY `ma_phong` (`ma_phong`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  MODIFY `ma_bao_cao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  MODIFY `ma_danh_gia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `dich_vu`
--
ALTER TABLE `dich_vu`
  MODIFY `ma_dich_vu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_phong`
--
ALTER TABLE `hinh_anh_phong`
  MODIFY `ma_anh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `hoa_don`
--
ALTER TABLE `hoa_don`
  MODIFY `ma_hoa_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `hoa_don_loi_cu`
--
ALTER TABLE `hoa_don_loi_cu`
  MODIFY `ma_hoa_don` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hop_dong`
--
ALTER TABLE `hop_dong`
  MODIFY `ma_hop_dong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `lich_su_thanh_toan`
--
ALTER TABLE `lich_su_thanh_toan`
  MODIFY `ma_giao_dich` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `loai_phong`
--
ALTER TABLE `loai_phong`
  MODIFY `ma_loai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `ma_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `phong_tro`
--
ALTER TABLE `phong_tro`
  MODIFY `ma_phong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  MODIFY `ma_thong_bao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `tien_ich`
--
ALTER TABLE `tien_ich`
  MODIFY `ma_tien_ich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tin_nhan`
--
ALTER TABLE `tin_nhan`
  MODIFY `ma_tin_nhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD CONSTRAINT `bao_cao_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chi_tiet_dich_vu`
--
ALTER TABLE `chi_tiet_dich_vu`
  ADD CONSTRAINT `chi_tiet_dich_vu_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE,
  ADD CONSTRAINT `chi_tiet_dich_vu_ibfk_2` FOREIGN KEY (`ma_dich_vu`) REFERENCES `dich_vu` (`ma_dich_vu`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chi_tiet_tien_ich`
--
ALTER TABLE `chi_tiet_tien_ich`
  ADD CONSTRAINT `chi_tiet_tien_ich_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE,
  ADD CONSTRAINT `chi_tiet_tien_ich_ibfk_2` FOREIGN KEY (`ma_tien_ich`) REFERENCES `tien_ich` (`ma_tien_ich`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danh_gia`
--
ALTER TABLE `danh_gia`
  ADD CONSTRAINT `danh_gia_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE,
  ADD CONSTRAINT `danh_gia_ibfk_2` FOREIGN KEY (`ma_nguoi_thue`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinh_anh_phong`
--
ALTER TABLE `hinh_anh_phong`
  ADD CONSTRAINT `hinh_anh_phong_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hoa_don_loi_cu`
--
ALTER TABLE `hoa_don_loi_cu`
  ADD CONSTRAINT `hoa_don_loi_cu_ibfk_1` FOREIGN KEY (`ma_hop_dong`) REFERENCES `hop_dong` (`ma_hop_dong`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD CONSTRAINT `hop_dong_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE,
  ADD CONSTRAINT `hop_dong_ibfk_2` FOREIGN KEY (`ma_chu_tro`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE,
  ADD CONSTRAINT `hop_dong_ibfk_3` FOREIGN KEY (`ma_nguoi_thue`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lich_su_thanh_toan`
--
ALTER TABLE `lich_su_thanh_toan`
  ADD CONSTRAINT `lich_su_thanh_toan_ibfk_1` FOREIGN KEY (`ma_hoa_don`) REFERENCES `hoa_don_loi_cu` (`ma_hoa_don`) ON DELETE CASCADE,
  ADD CONSTRAINT `lich_su_thanh_toan_ibfk_2` FOREIGN KEY (`ma_nguoi_thue`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `phong_tro`
--
ALTER TABLE `phong_tro`
  ADD CONSTRAINT `phong_tro_ibfk_1` FOREIGN KEY (`ma_chu_tro`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE,
  ADD CONSTRAINT `phong_tro_ibfk_2` FOREIGN KEY (`ma_loai`) REFERENCES `loai_phong` (`ma_loai`);

--
-- Các ràng buộc cho bảng `yeu_thich`
--
ALTER TABLE `yeu_thich`
  ADD CONSTRAINT `yeu_thich_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`) ON DELETE CASCADE,
  ADD CONSTRAINT `yeu_thich_ibfk_2` FOREIGN KEY (`ma_phong`) REFERENCES `phong_tro` (`ma_phong`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
