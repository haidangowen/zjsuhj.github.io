-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 28, 2024 lúc 12:59 AM
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
-- Cơ sở dữ liệu: `fakebill`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `banned` int(11) NOT NULL DEFAULT 0,
  `rank` varchar(255) NOT NULL DEFAULT 'members',
  `ip` varchar(255) DEFAULT NULL,
  `ngaythamgia` datetime DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL,
  `sodu` varchar(255) NOT NULL DEFAULT '0',
  `tongtieu` varchar(255) NOT NULL DEFAULT '0',
  `tongnap` varchar(255) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar.gif',
  `access_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `banned`, `rank`, `ip`, `ngaythamgia`, `email`, `sodu`, `tongtieu`, `tongnap`, `avatar`, `access_key`) VALUES
(1, 'admin', '$2y$07$zc.11gVNL3sfQuo7K3PFE.H/vkWMNwQHTKyxqDEawmfHZbiIi0kZ.', 0, 'admin', '::1', '2024-07-31 06:29:32', NULL, '9999999', '0', '2', 'avatar.gif', '417826596b85-6d2c-4009-9785-895d88619cf7'),
(2, 'khuong', '$2y$07$zc.11gVNL3sfQuo7K3PFE.H/vkWMNwQHTKyxqDEawmfHZbiIi0kZ.', 0, 'members', '::1', '2024-08-07 21:25:59', 'myyeuhuy2003@gmail.com', '64231', '10553329', '12062456', 'avatar.gif', '1997477ece6f-e164-45db-9878-e8254e23ba37'),
(9, '1', '$2y$07$zc.11gVNL3sfQuo7K3PFE.H/vkWMNwQHTKyxqDEawmfHZbiIi0kZ.', 0, 'members', '::1', '2024-10-09 16:08:13', NULL, '2555', '3000', '111', 'avatar.gif', '8bb7b5d11e13-f74c-4593-aa63-bddd60e6c400');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_dsgoi`
--

CREATE TABLE `ws_dsgoi` (
  `dsgoi_id` int(11) NOT NULL,
  `tengoi` varchar(255) NOT NULL,
  `giagoi` int(11) NOT NULL,
  `gioihanbill` int(11) NOT NULL DEFAULT 0,
  `hansudung` varchar(200) NOT NULL DEFAULT '1',
  `ngaytao` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_dsgoi`
--

INSERT INTO `ws_dsgoi` (`dsgoi_id`, `tengoi`, `giagoi`, `gioihanbill`, `hansudung`, `ngaytao`, `trangthai`) VALUES
(1, '22', 2222, 1, '1', '2024-10-23 20:51:20', 1),
(2, '222', 222, 2215, '222', '2024-10-26 00:41:26', 1);

--
-- Bẫy `ws_dsgoi`
--
DELIMITER $$
CREATE TRIGGER `update_gioihanbill` AFTER UPDATE ON `ws_dsgoi` FOR EACH ROW BEGIN
    UPDATE ws_plans 
    SET gioihanbill = NEW.gioihanbill 
    WHERE tengoi = CONCAT('vip', NEW.dsgoi_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_freebill`
--

CREATE TABLE `ws_freebill` (
  `freebill_id` int(11) NOT NULL,
  `taikhoan` varchar(255) NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_freebill`
--

INSERT INTO `ws_freebill` (`freebill_id`, `taikhoan`, `thoigian`) VALUES
(1, 'khuong', '2024-10-23 20:47:54'),
(2, 'khuong', '2024-10-23 20:47:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_history_bank`
--

CREATE TABLE `ws_history_bank` (
  `bank_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `loai` varchar(255) NOT NULL,
  `magiaodich` varchar(255) NOT NULL,
  `sotien` int(11) NOT NULL DEFAULT 0,
  `noidung` text DEFAULT NULL,
  `thoigian` datetime NOT NULL DEFAULT current_timestamp(),
  `trangthai` enum('thatbai','thanhcong') DEFAULT 'thatbai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_history_bank`
--

INSERT INTO `ws_history_bank` (`bank_id`, `username`, `loai`, `magiaodich`, `sotien`, `noidung`, `thoigian`, `trangthai`) VALUES
(1, 'khuong', 'Admin Cộng Tay', 'WT8141945', 11, 'Nạp tiền vào tài khoản', '2024-10-24 20:38:25', 'thanhcong'),
(2, 'khuong', 'Admin Cộng Tay', 'WT4992246', 222, 'Nạp tiền vào tài khoản', '2024-10-24 20:38:27', 'thanhcong'),
(3, 'khuong', 'Admin Cộng Tay', 'WT8364223', 2222, 'Nạp tiền vào tài khoản', '2024-10-24 22:51:48', 'thanhcong'),
(4, 'khuong', 'Admin Cộng Tay', 'WT3285142', 11111, 'Nạp tiền vào tài khoản', '2024-10-24 22:51:52', 'thanhcong'),
(5, 'khuong', 'Admin Cộng Tay', 'WT7991117', 4444, 'Nạp tiền vào tài khoản', '2024-10-24 22:51:54', 'thanhcong'),
(6, 'khuong', 'Admin Cộng Tay', 'WT8363430', 44444, 'Nạp tiền vào tài khoản', '2024-10-24 22:51:57', 'thanhcong');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_history_card`
--

CREATE TABLE `ws_history_card` (
  `card_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `taikhoan` varchar(255) DEFAULT NULL,
  `loaithe` varchar(50) DEFAULT NULL,
  `mathe` varchar(20) DEFAULT NULL,
  `seriel` varchar(20) DEFAULT NULL,
  `menhgia` int(11) DEFAULT NULL,
  `thoigian` datetime DEFAULT current_timestamp(),
  `trangthai` enum('thanhcong','thatbai','choxuly') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_history_fakebill`
--

CREATE TABLE `ws_history_fakebill` (
  `fakebill_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_limitbill`
--

CREATE TABLE `ws_limitbill` (
  `limitbill_id` int(11) NOT NULL,
  `taikhoan` varchar(255) NOT NULL,
  `ngaytao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_limitbill`
--

INSERT INTO `ws_limitbill` (`limitbill_id`, `taikhoan`, `ngaytao`) VALUES
(1, 'khuong', '2024-10-23 20:52:09'),
(2, 'khuong', '2024-10-24 20:37:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_logs`
--

CREATE TABLE `ws_logs` (
  `log_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` datetime DEFAULT current_timestamp(),
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_logs`
--

INSERT INTO `ws_logs` (`log_id`, `username`, `content`, `time`, `action`) VALUES
(1, 'khuong', 'đã tạo fake bill miễn phí', '2024-10-25 17:45:10', 'Tạo Bill Free'),
(2, 'khuong', 'đã tạo fake bill miễn phí', '2024-10-25 17:45:11', 'Tạo Bill Free'),
(3, 'khuong', 'đã tạo fake bill miễn phí', '2024-10-25 17:45:12', 'Tạo Bill Free'),
(4, 'khuong', 'đã tạo fake bill miễn phí', '2024-10-25 17:45:13', 'Tạo Bill Free'),
(5, 'khuong', 'tạo fake bill miễn phí', '2024-10-25 17:45:14', 'Tạo Bill Free'),
(6, 'khuong', 'tạo fake bill miễn phí', '2024-10-25 17:45:15', 'Tạo Bill Free'),
(7, 'khuong', 'tạo bill với giá 3.000đ', '2024-10-25 17:45:16', 'Tạo Bill Theo Số Dư'),
(8, 'khuong', 'mua gói VIP1 với giá 2,222đ', '2024-10-25 17:45:17', 'Mua Gói'),
(9, 'khuong', 'tạo bill với giá 3.000đ', '2024-10-25 17:45:18', 'Tạo Bill Theo Số Dư'),
(10, 'khuong', 'tạo bill với giá 3.000đ', '2024-10-25 17:45:19', 'Tạo Bill Theo Số Dư'),
(11, 'admin', 'cộng 11đ vào tài khoản khuong', '2024-10-25 17:45:20', 'Cộng Tiền'),
(12, 'admin', 'cộng 222đ vào tài khoản khuong', '2024-10-25 17:45:21', 'Cộng Tiền'),
(13, 'khuong', 'gói thành viên VIP1 đã hết hạn', '2024-10-25 17:45:22', 'Hết Hạn Gói VIP'),
(14, 'admin', 'cộng 2.222đ vào tài khoản khuong', '2024-10-25 17:45:23', 'Cộng Tiền'),
(15, 'admin', 'cộng 11.111đ vào tài khoản khuong', '2024-10-25 17:45:24', 'Cộng Tiền'),
(16, 'admin', 'cộng 4.444đ vào tài khoản khuong111111111111112', '2024-10-25 17:45:25', 'Cộng Tiền'),
(17, 'admin', 'cộng 44.444đ vào tài khoản khuong', '2024-10-25 17:45:26', 'Cộng Tiền');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_newfeeds`
--

CREATE TABLE `ws_newfeeds` (
  `newfeeds_id` int(11) NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `noidung` text NOT NULL,
  `loai` varchar(50) DEFAULT NULL,
  `ngaydang` datetime DEFAULT current_timestamp(),
  `trangthai` tinyint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_newfeeds`
--

INSERT INTO `ws_newfeeds` (`newfeeds_id`, `tieude`, `noidung`, `loai`, `ngaydang`, `trangthai`) VALUES
(1, 'Tin Tức #1', '<div style=\"line-height: 19px;\"><div style=\"\"><img src=\"https://imgur.com/JS3Z97t.gif\" width=\"20\"> Khi quý khách nạp</div><div style=\"\">&nbsp;tiền, vui lòng ghi đầy đủ nội dung bank trước khi chuyển, và hãy luôn đọc và&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">để ý các lưu ý mà chúng tôi đã ghi rõ.</span></div><div style=\"\"><img src=\"https://imgur.com/Sd4JMGu.gif\" width=\"20\"> Chúng tôi có bán&nbsp;<span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">code fakebill này với giá siêu rẻ cho các khách hàng kinh doanh, mọi chi</span></div><div style=\"\">tiết xin vui lòng liên hệ đến chúng tôi.</div><div style=\"\">Tag: fakebill, web fakebill, fake bdsd, web fake cccd, fake cccd, fakebill</div><div style=\"\">thanhdieu, fake bill miễn phí</div></div>', 'primary', '2024-06-20 00:00:00', 1),
(2, 'Thông Báo Khẩn Cấp', ' <img src=\"https://imgur.com/a54JAh8.gif\" width=\"20\">&ensp;Kính Chào Khách Hàng,\n\n🌪 Hệ thống chúng tôi gặp sự cố không mong muốn, có những tài khoản đã nạp mà bị reset số dư về 0đ hoặc tổng nạp bị reset về 0đ hãy chụp ảnh tài khoản trên web + bill chuyển tiền để admin check và hoàn lại tiền trong web về như\n                                            cũ.\n\n<img src=\"https://imgur.com/Rs7xac5.gif\" width=\"20\">&ensp;Đối với các trường hợp nạp mà chưa được cộng tiền vui lòng kiểm tra xem đã ghi nội dung hay chưa, và có đúng hay không, nếu đã đúng nd mà chưa được cộng tiền hãy gửi bill cho admin.\n\n <a href=\"https://t.me/WsThanhDieu\" target=\"_blank\">https://t.me/WsThanhDieu</a>', 'warning', '2024-07-31 00:00:00', 1),
(3, 'Tin Tức #2', '➡️ Cực hot, siêu giảm giá cho tất cả các gói thành viên VIP <img src=\"https://i.imgur.com/qvSmhvo.png\" width=\"20\">.\n🙅 Còn chần chờ gì nữa mà không nâng cấp ngay, tạo bill không có watermark và không giới hạn lần tạo bill.  \n<img src=\"https://imgur.com/XnaqI6Z.png\" width=\"20\"> Hiệu lực áp dụng cho cuối tháng này, hãy nhanh tay thuê ngay kẻo bỏ lỡ !!!.', 'primary', '2024-07-31 00:00:00', 1),
(4, 'Siêu Giảm Giá', '<img src=\"https://i.imgur.com/stN5Rel.gif\" width=\"20\">&ensp;Nhân dịp ngày Quốc tế Bạn gái.\n<img src=\"https://i.imgur.com/fmCupKL.png\" width=\"15\">&ensp;Chúng tôi hạ giá gói VIP1 xuống chỉ còn 7k, gói VIP2 chỉ còn 299k, đặc biệt gói VIP3 chỉ còn 999k.\n👉&ensp;Nhanh tay nhấn vào <a href=\"/thue-goi\">Thuê Gói VIP</a> để mua ngay trong hôm nay, áp dụng giảm giá kể từ ngày 01/08 đến cuối ngày 02/08.', 'primary', '2024-08-01 00:00:00', 1),
(5, 'Tin Tức #3', '<img src=\"https://i.imgur.com/aPDbjca.gif\" width=\"20\">&ensp;Đã hết thời gian khuyến mãi giảm giá các gói VIP!!!\n<img src=\"https://i.imgur.com/7MqSOai.png\" width=\"24\">Website sắp ra fake bill biến động số dư, fake cccd nên sẽ tăng giá lên để phù hợp với tính năng này.\n✅ Nền tảng fake bill không giới hạn số lần tạo, tự tin là những dịch vụ hàng đầu về fake bill chuyển khoản, cung cấp các app fakebill chuyên nghiệp.', 'primary', '2024-08-04 00:00:00', 1),
(6, 'Bản Cập Nhật & Vá Lỗi', '<img src=\"https://i.imgur.com/Daw8j7T.gif\" width=\"20\">&ensp;Fake biến động số dư đã có mặt trên nền tảng fakebill, quý khách vui lòng kiểm tra và sử dụng.\n<img src=\"https://i.imgur.com/TB6V1ww.gif\" width=\"20\"> Trong quá trình sử dụng, quý khách gặp các vấn đề gặp lỗi hoặc cần được sự hỗ trợ, vui lòng liên hệ đến telegram của chúng tôi.\n<img src=\"https://i.imgur.com/aPDbjca.gif\" width=\"20\">&ensp;Hệ thống vẫn đang nâng cấp và thêm tính năng cho các fakebill ngân hàng. Vui lòng kiên nhẫn chờ đợi.', 'primary', '2024-08-06 00:00:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_otpmailler`
--

CREATE TABLE `ws_otpmailler` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `otp_code` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_plans`
--

CREATE TABLE `ws_plans` (
  `plans_id` int(11) NOT NULL,
  `taikhoan` varchar(255) DEFAULT NULL,
  `tengoi` varchar(255) DEFAULT NULL,
  `giatien` int(11) NOT NULL DEFAULT 0,
  `gioihanbill` int(11) NOT NULL,
  `ngaymua` datetime DEFAULT NULL,
  `ngayhethan` datetime NOT NULL,
  `trangthai` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_plans`
--

INSERT INTO `ws_plans` (`plans_id`, `taikhoan`, `tengoi`, `giatien`, `gioihanbill`, `ngaymua`, `ngayhethan`, `trangthai`) VALUES
(1, 'khuong', 'vip1', 2222, 1, '2024-10-23 20:51:27', '2024-10-24 20:51:27', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_scaninfo`
--

CREATE TABLE `ws_scaninfo` (
  `scaninfo_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `loai` varchar(100) NOT NULL,
  `giatien` int(11) NOT NULL DEFAULT 0,
  `ngaytao` datetime DEFAULT current_timestamp(),
  `ngaycapnhat` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ghichu` text DEFAULT NULL,
  `trangthai` enum('success','pending','failed') NOT NULL DEFAULT 'pending',
  `giatri` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_scaninfo`
--

INSERT INTO `ws_scaninfo` (`scaninfo_id`, `username`, `loai`, `giatien`, `ngaytao`, `ngaycapnhat`, `ghichu`, `trangthai`, `giatri`) VALUES
(1, 'admin', 'Tìm Thông Tin Facebook', 0, '2024-09-05 02:48:11', '2024-09-05 02:48:26', 'ℹ️ℹ️ℹ️  FACEBOOK 1   ℹ️ℹ️ℹ️\r\nFacebook UID : 100015850635351\r\nSố điện thoại : 0394743386\r\nNgày thu thập dữ liệu FB : 2018-08-22T16:16:41.777000+07:00\r\nTên : Hoàng Yến\r\nGiới tính : 1\r\nNgày sinh : 10/08\r\nĐịa chỉ : Ho Chi Minh City, Vietnam\r\nLink : https://www.facebook.com/100015850635351', 'success', 'https://www.facebook.com/'),
(2, 'admin', 'Tìm Thông Tin Facebook', 0, '2024-09-05 02:50:04', '2024-09-05 03:13:33', 'Tìm không thành công, đã thực hiện hoàn tiền.', 'failed', 'https://www.facebook.com/1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_settings`
--

CREATE TABLE `ws_settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT 'Hệ Thống WusTeam',
  `keywords` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `black-ip` text DEFAULT NULL,
  `author` varchar(255) DEFAULT '0',
  `footer` text DEFAULT NULL,
  `bao-tri` int(11) DEFAULT 0,
  `name-site` varchar(255) NOT NULL DEFAULT 'WusTeam',
  `version-code` varchar(11) NOT NULL,
  `zalo` varchar(200) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `telegram` varchar(220) NOT NULL,
  `og:image` varchar(255) NOT NULL,
  `boxchat` varchar(200) NOT NULL DEFAULT 'https://thanhdieu.com',
  `backupdb` int(11) NOT NULL DEFAULT 1,
  `id-geetest` varchar(255) NOT NULL DEFAULT '0',
  `key-geetest` varchar(255) NOT NULL DEFAULT '0',
  `min-nap` int(11) NOT NULL,
  `partner-id` varchar(255) NOT NULL,
  `partner-key` varchar(255) DEFAULT NULL,
  `is-modal` int(11) NOT NULL,
  `is-log` int(11) NOT NULL DEFAULT 0,
  `modal-content` mediumtext NOT NULL,
  `cache` varchar(255) NOT NULL DEFAULT '1.1.1',
  `key-aes` varchar(255) NOT NULL,
  `navbar-logo` varchar(255) NOT NULL,
  `cuphap-naptien` varchar(255) NOT NULL DEFAULT 'WSNAPTIEN',
  `giataobill` int(11) NOT NULL DEFAULT 0,
  `limit-bill` int(11) NOT NULL DEFAULT 1,
  `time-bill` varchar(255) NOT NULL DEFAULT '0',
  `loader` int(11) NOT NULL DEFAULT 1,
  `mail-user` varchar(255) NOT NULL,
  `mail-pass` varchar(255) NOT NULL,
  `anti-spam` int(11) NOT NULL DEFAULT 1,
  `https` int(11) NOT NULL DEFAULT 0,
  `fuck-devtools` int(11) NOT NULL DEFAULT 0,
  `limit-account` int(11) NOT NULL DEFAULT 0,
  `auto-delete` int(11) NOT NULL DEFAULT 3,
  `khuyen-mai` int(11) NOT NULL DEFAULT 0,
  `giataogiayto` varchar(255) NOT NULL DEFAULT 'vip1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_settings`
--

INSERT INTO `ws_settings` (`id`, `title`, `keywords`, `favicon`, `description`, `black-ip`, `author`, `footer`, `bao-tri`, `name-site`, `version-code`, `zalo`, `facebook`, `telegram`, `og:image`, `boxchat`, `backupdb`, `id-geetest`, `key-geetest`, `min-nap`, `partner-id`, `partner-key`, `is-modal`, `is-log`, `modal-content`, `cache`, `key-aes`, `navbar-logo`, `cuphap-naptien`, `giataobill`, `limit-bill`, `time-bill`, `loader`, `mail-user`, `mail-pass`, `anti-spam`, `https`, `fuck-devtools`, `limit-account`, `auto-delete`, `khuyen-mai`, `giataogiayto`) VALUES
(1, 'Dịch Vụ Fake Bill Online ', 'Thanhdieu.com, thanhdieu .com, fakebill thanhdieu.com, fakebill ngân hàng, thanhdieu fakebill, fakebill.thanhdieu. com, website fake bill', '/public/src/vtd/img/logo.png', 'Trang fake bill Vietinbank, Mbbank, Momo, Vietcombank và nhiều ngân hàng khác', '', 'Vương Thanh Diệu', '© 2023, WusTeam. All Rights Reserved.', 0, 'Fakebill Master', '5.0.5', 'https://zalo.me/', 'https://facebook.com', 'https://t.me/', '/public/src/vtd/img/banner.png', 'https://boxchat.com/', 0, 'f3a50fc097a200b9260012e1e88d2dcd', '46bdbac1ea92195750ff71f7d949da83', 10000, '0', '', 0, 1, ' <b class=\"text-red-800\">💥 Kể từ ngày 09/08 mõi tài khoản sẽ nhận được <?=$TD->Setting(\'limit-bill\')?>\n                    lần tạo bill miễn phí hằng ngày!<br /><br />\n                    ✅ Những thành viên không có gói VIP hoặc không nạp tiền, nền tảng sẽ hiện quảng cáo.<br><br />\n                    🤙 Để biết thêm về bản cập nhật này vui lòng xem thêm: <a href=\"https://t.me/wus_team\">Tại đây</a>\n                </b>', '6.1.14', '1fba89cc63a79f16d3be6d58', 'https://i.imgur.com/ocC8YG5.png', 'WSNAPTIEN', 3000, 2, '0', 0, 'ws.thanhdieu@gmail.com', '', 1, 0, 0, 0, 0, 0, 'vip3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_spamsms`
--

CREATE TABLE `ws_spamsms` (
  `spamsms_id` int(11) NOT NULL,
  `taikhoan` varchar(255) NOT NULL,
  `sodienthoai` varchar(20) NOT NULL,
  `giatien` int(11) NOT NULL DEFAULT 0,
  `maychu` varchar(255) NOT NULL,
  `thoigian` datetime NOT NULL DEFAULT current_timestamp(),
  `thoigiancho` datetime DEFAULT current_timestamp(),
  `trangthai` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_subdomain`
--

CREATE TABLE `ws_subdomain` (
  `domain_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `ten_mien` varchar(255) NOT NULL,
  `hauto` varchar(255) NOT NULL,
  `loai` varchar(50) NOT NULL,
  `gia_tri` varchar(255) NOT NULL,
  `ngaytao` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaycapnhat` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `trangthai` enum('active','banned','pending') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ws_transfer`
--

CREATE TABLE `ws_transfer` (
  `transfer_id` int(11) NOT NULL,
  `stk` varchar(255) NOT NULL,
  `chutaikhoan` varchar(255) NOT NULL,
  `nganhang` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `callback` text DEFAULT NULL,
  `kieubank` varchar(255) NOT NULL DEFAULT 'Thủ Công'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ws_transfer`
--

INSERT INTO `ws_transfer` (`transfer_id`, `stk`, `chutaikhoan`, `nganhang`, `logo`, `callback`, `kieubank`) VALUES
(1, '111', '111', 'Momo', 'https://i.imgur.com/AbtjoUD.png', '', 'thucong'),
(2, '11122', '111122', 'Vietcombank', 'https://api.vieqr.com/icons/VCB.png', '', 'thucong');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_username` (`username`);

--
-- Chỉ mục cho bảng `ws_dsgoi`
--
ALTER TABLE `ws_dsgoi`
  ADD PRIMARY KEY (`dsgoi_id`);

--
-- Chỉ mục cho bảng `ws_freebill`
--
ALTER TABLE `ws_freebill`
  ADD PRIMARY KEY (`freebill_id`);

--
-- Chỉ mục cho bảng `ws_history_bank`
--
ALTER TABLE `ws_history_bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Chỉ mục cho bảng `ws_history_card`
--
ALTER TABLE `ws_history_card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `taikhoan` (`taikhoan`);

--
-- Chỉ mục cho bảng `ws_history_fakebill`
--
ALTER TABLE `ws_history_fakebill`
  ADD PRIMARY KEY (`fakebill_id`);

--
-- Chỉ mục cho bảng `ws_limitbill`
--
ALTER TABLE `ws_limitbill`
  ADD PRIMARY KEY (`limitbill_id`),
  ADD KEY `fk_taikhoan` (`taikhoan`);

--
-- Chỉ mục cho bảng `ws_logs`
--
ALTER TABLE `ws_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Chỉ mục cho bảng `ws_newfeeds`
--
ALTER TABLE `ws_newfeeds`
  ADD PRIMARY KEY (`newfeeds_id`);

--
-- Chỉ mục cho bảng `ws_otpmailler`
--
ALTER TABLE `ws_otpmailler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `ws_plans`
--
ALTER TABLE `ws_plans`
  ADD PRIMARY KEY (`plans_id`);

--
-- Chỉ mục cho bảng `ws_scaninfo`
--
ALTER TABLE `ws_scaninfo`
  ADD PRIMARY KEY (`scaninfo_id`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `ws_settings`
--
ALTER TABLE `ws_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ws_spamsms`
--
ALTER TABLE `ws_spamsms`
  ADD PRIMARY KEY (`spamsms_id`);

--
-- Chỉ mục cho bảng `ws_subdomain`
--
ALTER TABLE `ws_subdomain`
  ADD PRIMARY KEY (`domain_id`),
  ADD KEY `username` (`username`);

--
-- Chỉ mục cho bảng `ws_transfer`
--
ALTER TABLE `ws_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ws_dsgoi`
--
ALTER TABLE `ws_dsgoi`
  MODIFY `dsgoi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ws_freebill`
--
ALTER TABLE `ws_freebill`
  MODIFY `freebill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ws_history_bank`
--
ALTER TABLE `ws_history_bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ws_history_card`
--
ALTER TABLE `ws_history_card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ws_history_fakebill`
--
ALTER TABLE `ws_history_fakebill`
  MODIFY `fakebill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `ws_limitbill`
--
ALTER TABLE `ws_limitbill`
  MODIFY `limitbill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ws_logs`
--
ALTER TABLE `ws_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `ws_newfeeds`
--
ALTER TABLE `ws_newfeeds`
  MODIFY `newfeeds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ws_otpmailler`
--
ALTER TABLE `ws_otpmailler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ws_plans`
--
ALTER TABLE `ws_plans`
  MODIFY `plans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ws_scaninfo`
--
ALTER TABLE `ws_scaninfo`
  MODIFY `scaninfo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `ws_settings`
--
ALTER TABLE `ws_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ws_spamsms`
--
ALTER TABLE `ws_spamsms`
  MODIFY `spamsms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ws_subdomain`
--
ALTER TABLE `ws_subdomain`
  MODIFY `domain_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ws_transfer`
--
ALTER TABLE `ws_transfer`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ws_history_card`
--
ALTER TABLE `ws_history_card`
  ADD CONSTRAINT `ws_history_card_ibfk_1` FOREIGN KEY (`taikhoan`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `ws_limitbill`
--
ALTER TABLE `ws_limitbill`
  ADD CONSTRAINT `fk_taikhoan` FOREIGN KEY (`taikhoan`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ws_otpmailler`
--
ALTER TABLE `ws_otpmailler`
  ADD CONSTRAINT `ws_otpmailler_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ws_scaninfo`
--
ALTER TABLE `ws_scaninfo`
  ADD CONSTRAINT `ws_scaninfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Các ràng buộc cho bảng `ws_subdomain`
--
ALTER TABLE `ws_subdomain`
  ADD CONSTRAINT `ws_subdomain_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
