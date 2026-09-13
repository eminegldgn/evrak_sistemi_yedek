-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 12 Eyl 2026, 17:07:45
-- Sunucu sürümü: 9.1.0
-- PHP Sürümü: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `evrak_sistemi_yedek`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_logs`
--

DROP TABLE IF EXISTS `admin_logs`;
CREATE TABLE IF NOT EXISTS `admin_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(100) NOT NULL,
  `action` varchar(150) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admin_logs`
--

INSERT INTO `admin_logs` (`id`, `admin_id`, `action`, `description`, `created_at`) VALUES
(1, 'admin_test_cihazi', 'DERS_EKLENDI', '\"Nesne Yönelimli Programlama\" dersi \"Fırat Üniversitesi\" üniversitesine eklendi.', '2026-08-05 10:01:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Mühendislik', '2026-08-01 11:20:47'),
(2, 'Bilgisayar ve Yazılım', '2026-08-03 08:13:29'),
(3, 'Hukuk', '2026-08-03 08:13:29'),
(4, 'Tıp', '2026-08-03 08:13:29'),
(5, 'Diş Hekimliği', '2026-08-03 08:13:29'),
(6, 'Eczacılık', '2026-08-03 08:13:29'),
(7, 'Hemşirelik ve Sağlık Bilimleri', '2026-08-03 08:13:29'),
(8, 'İktisadi ve İdari Bilimler', '2026-08-03 08:13:29'),
(9, 'İşletme', '2026-08-03 08:13:29'),
(10, 'İktisat', '2026-08-03 08:13:29'),
(11, 'Eğitim Bilimleri', '2026-08-03 08:13:29'),
(12, 'Fen Bilimleri', '2026-08-03 08:13:29'),
(13, 'Matematik ve İstatistik', '2026-08-03 08:13:29'),
(14, 'Sosyal Bilimler', '2026-08-03 08:13:29'),
(15, 'Psikoloji', '2026-08-03 08:13:29'),
(16, 'Sosyoloji', '2026-08-03 08:13:29'),
(17, 'Tarih', '2026-08-03 08:13:29'),
(18, 'Türk Dili ve Edebiyatı', '2026-08-03 08:13:29'),
(19, 'Yabancı Diller', '2026-08-03 08:13:29'),
(20, 'İletişim', '2026-08-03 08:13:29'),
(21, 'Mimarlık ve Tasarım', '2026-08-03 08:13:29'),
(22, 'Güzel Sanatlar', '2026-08-03 08:13:29'),
(23, 'Spor Bilimleri', '2026-08-03 08:13:29'),
(24, 'Turizm', '2026-08-03 08:13:29'),
(25, 'İlahiyat', '2026-08-03 08:13:29'),
(26, 'Veterinerlik', '2026-08-03 08:13:29'),
(27, 'Ziraat', '2026-08-03 08:13:29'),
(28, 'Denizcilik', '2026-08-03 08:13:29'),
(29, 'Havacılık', '2026-08-03 08:13:29'),
(30, 'Meslek Yüksekokulu Dersleri', '2026-08-03 08:13:29'),
(31, 'Sınav Hazırlık', '2026-08-03 08:13:29'),
(32, 'Diğer', '2026-08-03 08:13:29'),
(33, 'Saglik Bilimleri', '2026-08-03 14:23:50');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `university_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `university_id` (`university_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`id`, `university_id`, `name`, `created_at`) VALUES
(1, 2, 'Veri Yapıları', '2026-08-01 11:20:47'),
(2, 10, 'Algoritma', '2026-08-05 08:17:46'),
(3, 69, 'Nesne Yönelimli Programlama', '2026-08-05 10:01:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `university_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `education_type` enum('Ön Lisans','Lisans','Yüksek Lisans','Doktora','Uzmanlık','Diğer') NOT NULL DEFAULT 'Lisans',
  `grade_level` varchar(50) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `download_count` int DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `university_id` (`university_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `notes`
--

INSERT INTO `notes` (`id`, `title`, `description`, `category_id`, `university_id`, `course_id`, `education_type`, `grade_level`, `file_path`, `user_id`, `download_count`, `price`, `status`, `created_at`) VALUES
(1, 'Veri Yapıları Vize Özet Notu', 'Marmara Bilgisayar 2. Sınıf vize öncesi hazırlanan tam özet dökümandır.', 1, 1, 1, 'Lisans', '2. Sınıf', 'test-pdf.pdf', 'test_cihaz_id', 1, 30.00, 'approved', '2026-08-01 11:20:47'),
(2, 'Veri Yapıları Vize Özet Notu', 'Bilgisayar Programcılığı 2. sınıf Veri Yapıları dersi için hazırlanmış vize özetidir. Diziler, bağlı listeler, yığın, kuyruk ve ağaç yapıları hakkında kısa konu anlatımları ve örnekler içerir.', 1, 153, 1, 'Lisans', '2. Sınıf', '1785741865134-Veri_Yapilari_Vize_Ozet_Notu.pdf', 'UE1A.230829.050', 1, 30.00, 'approved', '2026-08-03 07:24:25'),
(3, 'Java Nesne Tabanlı Programlama Final Özeti', 'Sınıflar, nesneler, inheritance, polymorphism, interface ve abstract class konularını örneklerle anlatan 18 sayfalık final özeti.', 2, 162, 1, 'Ön Lisans', 'DGS Hazırlık', '1785768426849-793367494-1785741865134-Veri_Yapilari_Vize_Ozet_Notu.pdf', 'UE1A.230829.050', 1, 45.00, 'approved', '2026-08-03 14:47:06'),
(4, 'İlk Yardım ve Acil Tıp Özet Notları', 'Temel yaşam desteği (CPR), kanamalar, yanıklar, kırıklar ve acil müdahale konularını içeren özet ders notları.', 4, 77, 1, 'Yüksek Lisans', 'Ders Dönemi', '1785830390343-87710170-Ilk_Yardim_Acil_Tip_Ozet_Notlari__1_.pdf', 'UE1A.230829.050', 1, 60.00, 'approved', '2026-08-04 07:59:50'),
(5, 'Matematik 1 Final Özet Notları', 'Matematik 1 dersi için final sınavına yönelik hazırlanmış kapsamlı özet notlarıdır.\n\nİçerik:\n• Fonksiyonlar\n• Limit\n• Süreklilik\n• Türev\n• Türev Uygulamaları\n• İntegral\n• İntegral Uygulamaları\n• Çıkmış soru ipuçları\n\nSınava hızlı tekrar yapmak isteyen öğrenciler için uygundur.', 13, 14, 1, 'Lisans', '1. Sınıf', '1785855046440-551356216-Matematik_1_Final_Ozet_Notlari__1_.pdf', 'test_cihaz_id', 0, 49.00, 'approved', '2026-08-04 14:50:46'),
(6, 'veri yaplar', '123', 22, 129, 1, 'Yüksek Lisans', '2. Yıl', '1785938560976-932061020-1785830390343-87710170-Ilk_Yardim_Acil_Tip_Ozet_Notlari__1_.pdf', 'test_cihaz_id', 0, 100.00, 'approved', '2026-08-05 14:02:41'),
(7, 'Gemi Stabilitesi - Kısa Ders Notu', 'Gemi stabilitesi, ağırlık merkezi, metasantr ve yük dağılımı konularını içeren kısa ders notu. Vize ve final çalışmaları için uygundur.', 28, 134, 1, 'Lisans', '2. Sınıf', '1786002861678-797638015-Gemi_Stabilitesi_Kisa_Ders_Notu.pdf', 'test_cihaz_id', 0, 20.00, 'pending', '2026-08-06 07:54:21');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` varchar(150) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_notifications_user` (`user_id`),
  KEY `idx_notifications_user_read` (`user_id`,`is_read`),
  KEY `idx_notifications_created_at` (`created_at`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `reference_type`, `reference_id`, `is_read`, `created_at`) VALUES
(1, 'UE1A.230829.050', 'announcement', 'Cadion Bildirim Testi', 'Bildirim sistemi başarıyla çalışıyor.', 'system', NULL, 1, '2026-08-04 07:15:10'),
(2, 'UE1A.230829.050', 'note_approved', 'Notunuz Onaylandı', '\"Java Nesne Tabanlı Programlama Final Özeti\" adlı notunuz onaylandı ve yayına alındı.', 'note', '3', 1, '2026-08-04 08:08:13'),
(3, 'UE1A.230829.050', 'note_approved', 'Notunuz Onaylandı', '\"İlk Yardım ve Acil Tıp Özet Notları\" adlı notunuz onaylandı ve yayına alındı.', 'note', '4', 1, '2026-08-04 08:08:35'),
(4, 'UE1A.230829.050', 'new_review', 'Notunuza Yeni Değerlendirme Geldi', '\"İlk Yardım ve Acil Tıp Özet Notları\" adlı notunuza 5 yıldızlı yeni bir yorum yapıldı.', 'note', '4', 1, '2026-08-04 14:00:51'),
(5, 'UE1A.230829.050', 'note_sold', 'Notunuz Satıldı', '\"Java Nesne Tabanlı Programlama Final Özeti\" adlı notunuz satın alındı.', 'note', '3', 1, '2026-08-04 14:01:07'),
(6, 'UE1A.230829.050', 'new_review', 'Notunuza Yeni Değerlendirme Geldi', '\"Java Nesne Tabanlı Programlama Final Özeti\" adlı notunuza 4 yıldızlı yeni bir yorum yapıldı.', 'note', '3', 1, '2026-08-04 14:01:42'),
(7, 'test_cihaz_id', 'note_approved', 'Notunuz Onaylandı', '\"Matematik 1 Final Özet Notları\" adlı notunuz onaylandı ve yayına alındı.', 'note', '5', 0, '2026-08-04 14:52:38'),
(8, 'admin_test_cihazi', 'announcement', 'Test Bildirimi', 'Cadion admin panelinden gönderildi.', 'system', NULL, 0, '2026-08-05 09:09:11'),
(9, 'test_cihaz_id', 'announcement', 'Test Bildirimi', 'Cadion admin panelinden gönderildi.', 'system', NULL, 0, '2026-08-05 09:09:11'),
(10, 'TEST.USER.002', 'announcement', 'Test Bildirimi', 'Cadion admin panelinden gönderildi.', 'system', NULL, 0, '2026-08-05 09:09:11'),
(11, 'UE1A.230829.050', 'announcement', 'Test Bildirimi', 'Cadion admin panelinden gönderildi.', 'system', NULL, 0, '2026-08-05 09:09:11'),
(12, 'test_cihaz_id', 'note_approved', 'Notunuz Onaylandı', '\"veri yaplar\" adlı notunuz onaylandı ve yayına alındı.', 'note', '6', 0, '2026-08-05 14:05:17'),
(13, 'UE1A.230829.050', 'note_sold', 'Notunuz Satıldı', '\"Veri Yapıları Vize Özet Notu\" adlı notunuz satın alındı.', 'note', '2', 0, '2026-08-05 14:08:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `seller_earning` decimal(10,2) NOT NULL,
  `platform_commission` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note_id` int DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_purchase` (`note_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `purchases`
--

INSERT INTO `purchases` (`id`, `note_id`, `user_id`, `ip_address`, `created_at`) VALUES
(1, 1, 'UE1A.230829.050', '127.0.0.1', '2026-08-03 08:46:51'),
(2, 4, 'test_cihaz_id', '127.0.0.1', '2026-08-04 13:59:17'),
(3, 3, 'test_cihaz_id', '127.0.0.1', '2026-08-04 14:01:07'),
(4, 2, 'test_cihaz_id', '127.0.0.1', '2026-08-05 14:08:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `report_type` enum('note','review') NOT NULL,
  `reference_id` int UNSIGNED NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `reason` enum('incorrect_content','incomplete_content','copyright','inappropriate_content','spam','other') NOT NULL,
  `description` text,
  `status` enum('pending','reviewing','resolved','rejected') NOT NULL DEFAULT 'pending',
  `admin_note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_reports_type_reference` (`report_type`,`reference_id`),
  KEY `idx_reports_user` (`user_id`),
  KEY `idx_reports_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `reports`
--

INSERT INTO `reports` (`id`, `report_type`, `reference_id`, `user_id`, `reason`, `description`, `status`, `admin_note`, `created_at`, `updated_at`) VALUES
(1, 'note', 2, 'test_cihaz_id', 'incorrect_content', 'ders icerigi bastan sona yanlis verilmis duzeltilmeli', 'pending', NULL, '2026-08-04 14:20:15', '2026-08-04 14:20:15');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note_id` int DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `rating` tinyint NOT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `note_id` (`note_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `reviews`
--

INSERT INTO `reviews` (`id`, `note_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 4, 'test_cihaz_id', 5, 'Not yeterince ayrintili degildi', '2026-08-04 14:00:51'),
(2, 3, 'test_cihaz_id', 4, 'Cok begendim ellerinize saglk', '2026-08-04 14:01:42');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commission_rate` decimal(5,2) NOT NULL DEFAULT '20.00',
  `min_note_price` decimal(10,2) NOT NULL DEFAULT '5.00',
  `max_note_price` decimal(10,2) NOT NULL DEFAULT '500.00',
  `max_pdf_size_mb` int NOT NULL DEFAULT '50',
  `registration_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `note_approval_required` tinyint(1) NOT NULL DEFAULT '1',
  `notifications_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `system_settings`
--

INSERT INTO `system_settings` (`id`, `commission_rate`, `min_note_price`, `max_note_price`, `max_pdf_size_mb`, `registration_enabled`, `note_approval_required`, `notifications_enabled`, `maintenance_mode`, `updated_at`) VALUES
(1, 20.00, 5.00, 500.00, 50, 1, 1, 1, 0, '2026-08-05 10:46:36');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `universities`
--

DROP TABLE IF EXISTS `universities`;
CREATE TABLE IF NOT EXISTS `universities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('Devlet','Vakıf') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `universities`
--

INSERT INTO `universities` (`id`, `name`, `city`, `district`, `created_at`, `type`) VALUES
(2, 'Abdullah Gül Üniversitesi', 'Kayseri', '', '2026-08-03 06:33:26', 'Devlet'),
(3, 'Acıbadem Mehmet Ali Aydınlar Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(4, 'Adana Alparslan Türkeş Bilim Ve Teknoloji Üniversitesi', 'Adana', '', '2026-08-03 06:33:26', 'Devlet'),
(5, 'Adıyaman Üniversitesi', 'Adıyaman', '', '2026-08-03 06:33:26', 'Devlet'),
(6, 'Afyonkarahisar Sağlık Bilimleri Üniversitesi', 'Afyonkarahisar', '', '2026-08-03 06:33:26', 'Devlet'),
(7, 'Afyon Kocatepe Üniversitesi', 'Afyonkarahisar', '', '2026-08-03 06:33:26', 'Devlet'),
(8, 'Ağrı İbrahim Çeçen Üniversitesi', 'Ağrı', '', '2026-08-03 06:33:26', 'Devlet'),
(9, 'Ahmet Yesevi Üniversitesi', 'Türkistan', '', '2026-08-03 06:33:26', 'Devlet'),
(10, 'Akdeniz Üniversitesi', 'Antalya', '', '2026-08-03 06:33:26', 'Devlet'),
(11, 'Aksaray Üniversitesi', 'Aksaray', '', '2026-08-03 06:33:26', 'Devlet'),
(12, 'Alanya Alaaddin Keykubat Üniversitesi', 'Antalya', 'Alanya', '2026-08-03 06:33:26', 'Devlet'),
(13, 'Alanya Üniversitesi', 'Antalya', 'Alanya', '2026-08-03 06:33:26', 'Vakıf'),
(14, 'Altınbaş Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(15, 'Amasya Üniversitesi', 'Amasya', '', '2026-08-03 06:33:26', 'Devlet'),
(16, 'Anadolu Üniversitesi', 'Eskişehir', '', '2026-08-03 06:33:26', 'Devlet'),
(17, 'Ankara Bilim Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(18, 'Ankara Hacı Bayram Veli Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(19, 'Ankara Medipol Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(20, 'Ankara Müzik ve Güzel Sanatlar Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(21, 'Ankara Sosyal Bilimler Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(22, 'Ankara Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(23, 'Ankara Yıldırım Beyazıt Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(24, 'Antalya Belek Üniversitesi', 'Antalya', 'Serik', '2026-08-03 06:33:26', 'Vakıf'),
(25, 'Antalya Bilim Üniversitesi', 'Antalya', '', '2026-08-03 06:33:26', 'Vakıf'),
(26, 'Ardahan Üniversitesi', 'Ardahan', '', '2026-08-03 06:33:26', 'Devlet'),
(27, 'Artvin Çoruh Üniversitesi', 'Artvin', '', '2026-08-03 06:33:26', 'Devlet'),
(28, 'Ataşehir Adıgüzel Meslek Yüksekokulu', 'İstanbul', 'Ataşehir', '2026-08-03 06:33:26', 'Vakıf'),
(29, 'Atatürk Üniversitesi', 'Erzurum', '', '2026-08-03 06:33:26', 'Devlet'),
(30, 'Atılım Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(31, 'Avrasya Üniversitesi', 'Trabzon', '', '2026-08-03 06:33:26', 'Vakıf'),
(32, 'Aydın Adnan Menderes Üniversitesi', 'Aydın', '', '2026-08-03 06:33:26', 'Devlet'),
(33, 'Bahçeşehir Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(34, 'Balıkesir Üniversitesi', 'Balıkesir', '', '2026-08-03 06:33:26', 'Devlet'),
(35, 'Bandırma Onyedi Eylül Üniversitesi', 'Balıkesir', 'Bandırma', '2026-08-03 06:33:26', 'Devlet'),
(36, 'Bartın Üniversitesi', 'Bartın', '', '2026-08-03 06:33:26', 'Devlet'),
(37, 'Başkent Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(38, 'Batman Üniversitesi', 'Batman', '', '2026-08-03 06:33:26', 'Devlet'),
(39, 'Bayburt Üniversitesi', 'Bayburt', '', '2026-08-03 06:33:26', 'Devlet'),
(40, 'Beykoz Üniversitesi', 'İstanbul', 'Beykoz', '2026-08-03 06:33:26', 'Vakıf'),
(41, 'Bezmialem Vakıf Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(42, 'Bilecik Şeyh Edebali Üniversitesi', 'Bilecik', '', '2026-08-03 06:33:26', 'Devlet'),
(43, 'Bingöl Üniversitesi', 'Bingöl', '', '2026-08-03 06:33:26', 'Devlet'),
(44, 'Biruni Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(45, 'Bitlis Eren Üniversitesi', 'Bitlis', '', '2026-08-03 06:33:26', 'Devlet'),
(46, 'Boğaziçi Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(47, 'Bolu Abant İzzet Baysal Üniversitesi', 'Bolu', '', '2026-08-03 06:33:26', 'Devlet'),
(48, 'Burdur Mehmet Akif Ersoy Üniversitesi', 'Burdur', '', '2026-08-03 06:33:26', 'Devlet'),
(49, 'Bursa Teknik Üniversitesi', 'Bursa', '', '2026-08-03 06:33:26', 'Devlet'),
(50, 'Bursa Uludağ Üniversitesi', 'Bursa', '', '2026-08-03 06:33:26', 'Devlet'),
(51, 'Çağ Üniversitesi', 'Mersin', 'Tarsus', '2026-08-03 06:33:26', 'Vakıf'),
(52, 'Çanakkale Onsekiz Mart Üniversitesi', 'Çanakkale', '', '2026-08-03 06:33:26', 'Devlet'),
(53, 'Çankaya Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(54, 'Çankırı Karatekin Üniversitesi', 'Çankırı', '', '2026-08-03 06:33:26', 'Devlet'),
(55, 'Çukurova Üniversitesi', 'Adana', '', '2026-08-03 06:33:26', 'Devlet'),
(56, 'Demiroğlu Bilim Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(57, 'Dicle Üniversitesi', 'Diyarbakır', '', '2026-08-03 06:33:26', 'Devlet'),
(58, 'Doğuş Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(59, 'Dokuz Eylül Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Devlet'),
(60, 'Düzce Üniversitesi', 'Düzce', '', '2026-08-03 06:33:26', 'Devlet'),
(61, 'Ege Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Devlet'),
(62, 'Erciyes Üniversitesi', 'Kayseri', '', '2026-08-03 06:33:26', 'Devlet'),
(63, 'Erzincan Binali Yıldırım Üniversitesi', 'Erzincan', '', '2026-08-03 06:33:26', 'Devlet'),
(64, 'Erzurum Teknik Üniversitesi', 'Erzurum', '', '2026-08-03 06:33:26', 'Devlet'),
(65, 'Eskişehir Osmangazi Üniversitesi', 'Eskişehir', '', '2026-08-03 06:33:26', 'Devlet'),
(66, 'Eskişehir Teknik Üniversitesi', 'Eskişehir', '', '2026-08-03 06:33:26', 'Devlet'),
(67, 'Fatih Sultan Mehmet Vakıf Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(68, 'Fenerbahçe Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(69, 'Fırat Üniversitesi', 'Elazığ', '', '2026-08-03 06:33:26', 'Devlet'),
(70, 'Galatasaray Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(71, 'Gaziantep İslam Bilim ve Teknoloji Üniversitesi', 'Gaziantep', '', '2026-08-03 06:33:26', 'Devlet'),
(72, 'Gaziantep Üniversitesi', 'Gaziantep', '', '2026-08-03 06:33:26', 'Devlet'),
(73, 'Gazi Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(74, 'Gebze Teknik Üniversitesi', 'Kocaeli', 'Gebze', '2026-08-03 06:33:26', 'Devlet'),
(75, 'Giresun Üniversitesi', 'Giresun', '', '2026-08-03 06:33:26', 'Devlet'),
(76, 'Gümüşhane Üniversitesi', 'Gümüşhane', '', '2026-08-03 06:33:26', 'Devlet'),
(77, 'Hacettepe Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(78, 'Hakkari Üniversitesi', 'Hakkari', '', '2026-08-03 06:33:26', 'Devlet'),
(79, 'Haliç Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(80, 'Harran Üniversitesi', 'Şanlıurfa', '', '2026-08-03 06:33:26', 'Devlet'),
(81, 'Hasan Kalyoncu Üniversitesi', 'Gaziantep', '', '2026-08-03 06:33:26', 'Vakıf'),
(82, 'Hatay Mustafa Kemal Üniversitesi', 'Hatay', '', '2026-08-03 06:33:26', 'Devlet'),
(83, 'Hitit Üniversitesi', 'Çorum', '', '2026-08-03 06:33:26', 'Devlet'),
(84, 'Iğdır Üniversitesi', 'Iğdır', '', '2026-08-03 06:33:26', 'Devlet'),
(85, 'Isparta Uygulamalı Bilimler Üniversitesi', 'Isparta', '', '2026-08-03 06:33:26', 'Devlet'),
(86, 'Işık Üniversitesi', 'İstanbul', 'Şile', '2026-08-03 06:33:26', 'Vakıf'),
(87, 'İbn Haldun Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(88, 'İhsan Doğramacı Bilkent Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(89, 'İnönü Üniversitesi', 'Malatya', '', '2026-08-03 06:33:26', 'Devlet'),
(90, 'İskenderun Teknik Üniversitesi', 'Hatay', 'İskenderun', '2026-08-03 06:33:26', 'Devlet'),
(91, 'İstanbul 29 Mayıs Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(92, 'İstanbul Arel Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(93, 'İstanbul Atlas Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(94, 'İstanbul Aydın Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(95, 'İstanbul Beykent Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(96, 'İstanbul Bilgi Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(97, 'İstanbul Esenyurt Üniversitesi', 'İstanbul', 'Esenyurt', '2026-08-03 06:33:26', 'Vakıf'),
(98, 'İstanbul Galata Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(99, 'İstanbul Gedik Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(100, 'İstanbul Gelişim Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(101, 'İstanbul Kent Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(102, 'İstanbul Kültür Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(103, 'İstanbul Medeniyet Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(104, 'İstanbul Medipol Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(105, 'İstanbul Nişantaşı Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(106, 'İstanbul Okan Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(107, 'İstanbul Rumeli Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(108, 'İstanbul Sabahattin Zaim Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(109, 'İstanbul Sağlık ve Sosyal Bilimler Meslek Yüksekokulu', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(110, 'İstanbul Sağlık ve Teknoloji Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(111, 'İstanbul Şişli Meslek Yüksekokulu', 'İstanbul', 'Şişli', '2026-08-03 06:33:26', 'Devlet'),
(112, 'İstanbul Teknik Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(113, 'İstanbul Ticaret Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(114, 'İstanbul Topkapı Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(115, 'İstanbul Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(116, 'İstanbul Üniversitesi-Cerrahpaşa', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(117, 'İstanbul Yeni Yüzyıl Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(118, 'İstinye Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(119, 'İzmir Bakırçay Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Devlet'),
(120, 'İzmir Demokrasi Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Devlet'),
(121, 'İzmir Ekonomi Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Vakıf'),
(122, 'İzmir Katip Çelebi Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Devlet'),
(123, 'İzmir Konak Meslek Yüksekokulu', 'İzmir', 'Konak', '2026-08-03 06:33:26', 'Devlet'),
(124, 'İzmir Tınaztepe Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Vakıf'),
(125, 'İzmir Yüksek Teknoloji Enstitüsü', 'İzmir', 'Urla', '2026-08-03 06:33:26', 'Devlet'),
(126, 'Kadir Has Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(127, 'Kafkas Üniversitesi', 'Kars', '', '2026-08-03 06:33:26', 'Devlet'),
(128, 'Kahramanmaraş İstiklal Üniversitesi', 'Kahramanmaraş', '', '2026-08-03 06:33:26', 'Devlet'),
(129, 'Kahramanmaraş Sütçü İmam Üniversitesi', 'Kahramanmaraş', '', '2026-08-03 06:33:26', 'Devlet'),
(130, 'Kapadokya Üniversitesi', 'Nevşehir', '', '2026-08-03 06:33:26', 'Vakıf'),
(131, 'Karabük Üniversitesi', 'Karabük', '', '2026-08-03 06:33:26', 'Devlet'),
(132, 'Karadeniz Teknik Üniversitesi', 'Trabzon', '', '2026-08-03 06:33:26', 'Devlet'),
(133, 'Karamanoğlu Mehmetbey Üniversitesi', 'Karaman', '', '2026-08-03 06:33:26', 'Devlet'),
(134, 'Kastamonu Üniversitesi', 'Kastamonu', '', '2026-08-03 06:33:26', 'Devlet'),
(135, 'Kayseri Üniversitesi', 'Kayseri', '', '2026-08-03 06:33:26', 'Devlet'),
(136, 'Kırıkkale Üniversitesi', 'Kırıkkale', '', '2026-08-03 06:33:26', 'Devlet'),
(137, 'Kırklareli Üniversitesi', 'Kırklareli', '', '2026-08-03 06:33:26', 'Devlet'),
(138, 'Kırşehir Ahi Evran Üniversitesi', 'Kırşehir', '', '2026-08-03 06:33:26', 'Devlet'),
(139, 'Kilis 7 Aralık Üniversitesi', 'Kilis', '', '2026-08-03 06:33:26', 'Devlet'),
(140, 'Kocaeli Sağlık ve Teknoloji Üniversitesi', 'Kocaeli', '', '2026-08-03 06:33:26', 'Devlet'),
(141, 'Kocaeli Üniversitesi', 'Kocaeli', '', '2026-08-03 06:33:26', 'Devlet'),
(142, 'Koç Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(143, 'Konya Gıda ve Tarım Üniversitesi', 'Konya', '', '2026-08-03 06:33:26', 'Devlet'),
(144, 'Konya Teknik Üniversitesi', 'Konya', '', '2026-08-03 06:33:26', 'Devlet'),
(145, 'KTO-Karatay Üniversitesi', 'Konya', '', '2026-08-03 06:33:26', 'Devlet'),
(146, 'Kütahya Dumlupınar Üniversitesi', 'Kütahya', '', '2026-08-03 06:33:26', 'Devlet'),
(147, 'Kütahya Sağlık Bilimleri Üniversitesi', 'Kütahya', '', '2026-08-03 06:33:26', 'Devlet'),
(148, 'Lokman Hekim Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(149, 'Malatya Turgut Özal Üniversitesi', 'Malatya', '', '2026-08-03 06:33:26', 'Devlet'),
(150, 'Maltepe Üniversitesi', 'İstanbul', 'Maltepe', '2026-08-03 06:33:26', 'Vakıf'),
(151, 'Manisa Celal Bayar Üniversitesi', 'Manisa', '', '2026-08-03 06:33:26', 'Devlet'),
(152, 'Mardin Artuklu Üniversitesi', 'Mardin', '', '2026-08-03 06:33:26', 'Devlet'),
(153, 'Marmara Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(154, 'MEF Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(155, 'Mersin Üniversitesi', 'Mersin', '', '2026-08-03 06:33:26', 'Devlet'),
(156, 'Mimar Sinan Güzel Sanatlar Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(157, 'Mudanya Üniversitesi', 'Bursa', 'Mudanya', '2026-08-03 06:33:26', 'Devlet'),
(158, 'Muğla Sıtkı Koçman Üniversitesi', 'Muğla', '', '2026-08-03 06:33:26', 'Devlet'),
(159, 'Munzur Üniversitesi', 'Tunceli', '', '2026-08-03 06:33:26', 'Devlet'),
(160, 'Muş Alparslan Üniversitesi', 'Muş', '', '2026-08-03 06:33:26', 'Devlet'),
(161, 'Necmettin Erbakan Üniversitesi', 'Konya', '', '2026-08-03 06:33:26', 'Devlet'),
(162, 'Nevşehir Hacı Bektaş Veli Üniversitesi', 'Nevşehir', '', '2026-08-03 06:33:26', 'Devlet'),
(163, 'Niğde Ömer Halisdemir Üniversitesi', 'Niğde', '', '2026-08-03 06:33:26', 'Devlet'),
(164, 'Nuh Naci Yazgan Üniversitesi', 'Kayseri', '', '2026-08-03 06:33:26', 'Devlet'),
(165, 'Ondokuz Mayıs Üniversitesi', 'Samsun', '', '2026-08-03 06:33:26', 'Devlet'),
(166, 'Ordu Üniversitesi', 'Ordu', '', '2026-08-03 06:33:26', 'Devlet'),
(167, 'Orta Doğu Teknik Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(168, 'Osmaniye Korkut Ata Üniversitesi', 'Osmaniye', '', '2026-08-03 06:33:26', 'Devlet'),
(169, 'OSTİM Teknik Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(170, 'Özyeğin Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(171, 'Pamukkale Üniversitesi', 'Denizli', '', '2026-08-03 06:33:26', 'Devlet'),
(172, 'Piri Reis Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(173, 'Recep Tayyip Erdoğan Üniversitesi', 'Rize', '', '2026-08-03 06:33:26', 'Devlet'),
(174, 'Sabancı Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(175, 'Sağlık Bilimleri Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(176, 'Sakarya Uygulamalı Bilimler Üniversitesi', 'Sakarya', '', '2026-08-03 06:33:26', 'Devlet'),
(177, 'Sakarya Üniversitesi', 'Sakarya', '', '2026-08-03 06:33:26', 'Devlet'),
(178, 'Samsun Üniversitesi', 'Samsun', '', '2026-08-03 06:33:26', 'Devlet'),
(179, 'Selçuk Üniversitesi', 'Konya', '', '2026-08-03 06:33:26', 'Devlet'),
(180, 'Siirt Üniversitesi', 'Siirt', '', '2026-08-03 06:33:26', 'Devlet'),
(181, 'Sinop Üniversitesi', 'Sinop', '', '2026-08-03 06:33:26', 'Devlet'),
(182, 'Sivas Bilim Ve Teknoloji Üniversitesi', 'Sivas', '', '2026-08-03 06:33:26', 'Devlet'),
(183, 'Sivas Cumhuriyet Üniversitesi', 'Sivas', '', '2026-08-03 06:33:26', 'Devlet'),
(184, 'Süleyman Demirel Üniversitesi', 'Isparta', '', '2026-08-03 06:33:26', 'Devlet'),
(185, 'Şırnak Üniversitesi', 'Şırnak', '', '2026-08-03 06:33:26', 'Devlet'),
(186, 'Tarsus Üniversitesi', 'Mersin', 'Tarsus', '2026-08-03 06:33:26', 'Devlet'),
(187, 'TED Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(188, 'Tekirdağ Namık Kemal Üniversitesi', 'Tekirdağ', '', '2026-08-03 06:33:26', 'Devlet'),
(189, 'TOBB Ekonomi ve Teknoloji Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(190, 'Tokat Gaziosmanpaşa Üniversitesi', 'Tokat', '', '2026-08-03 06:33:26', 'Devlet'),
(191, 'Toros Üniversitesi', 'Mersin', '', '2026-08-03 06:33:26', 'Vakıf'),
(192, 'Trabzon Üniversitesi', 'Trabzon', '', '2026-08-03 06:33:26', 'Devlet'),
(193, 'Trakya Üniversitesi', 'Edirne', '', '2026-08-03 06:33:26', 'Devlet'),
(194, 'Türk-Alman Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(195, 'Türk Hava Kurumu Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(196, 'Türk-Japon Bilim ve Teknoloji Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(197, 'Ufuk Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Vakıf'),
(198, 'Uşak Üniversitesi', 'Uşak', '', '2026-08-03 06:33:26', 'Devlet'),
(199, 'Üsküdar Üniversitesi', 'İstanbul', 'Üsküdar', '2026-08-03 06:33:26', 'Vakıf'),
(200, 'Van Yüzüncü Yıl Üniversitesi', 'Van', '', '2026-08-03 06:33:26', 'Devlet'),
(201, 'Yalova Üniversitesi', 'Yalova', '', '2026-08-03 06:33:26', 'Devlet'),
(202, 'Yaşar Üniversitesi', 'İzmir', '', '2026-08-03 06:33:26', 'Vakıf'),
(203, 'Yeditepe Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Vakıf'),
(204, 'Yıldız Teknik Üniversitesi', 'İstanbul', '', '2026-08-03 06:33:26', 'Devlet'),
(205, 'Yozgat Bozok Üniversitesi', 'Yozgat', '', '2026-08-03 06:33:26', 'Devlet'),
(206, 'Yüksek İhtisas Üniversitesi', 'Ankara', '', '2026-08-03 06:33:26', 'Devlet'),
(207, 'Zonguldak Bülent Ecevit Üniversitesi', 'Zonguldak', '', '2026-08-03 06:33:26', 'Devlet'),
(208, 'Abant izzet Baysal Üniversitesi', 'Bolu', 'Merkez', '2026-08-05 13:54:03', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` enum('student','moderator','admin') DEFAULT 'student',
  `password_hash` varchar(255) DEFAULT NULL,
  `is_banned` tinyint(1) DEFAULT '0',
  `is_free_trial_used` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `password_hash`, `is_banned`, `is_free_trial_used`, `created_at`) VALUES
('test_cihaz_id', '', 'student', NULL, 0, 1, '2026-08-01 11:20:47'),
('2', '', 'student', NULL, 0, 1, '2026-08-01 15:11:03'),
('3', '', 'admin', '$2b$12$cCHRKgTB.ni2tpYO70FJtOR3W6GGzJ8eU55591It.CpeX0qJLBNC6', 0, 0, '2026-08-03 12:06:27'),
('4', '', 'student', NULL, 0, 0, '2026-08-04 13:54:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
CREATE TABLE IF NOT EXISTS `user_devices` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `device_id` varchar(100) NOT NULL,
  `fcm_token` text,
  `platform` varchar(20) NOT NULL DEFAULT 'android',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_device` (`user_id`,`device_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wallets`
--

DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `updated_at`) VALUES
(1, 'test_cihaz_id', 3000.00, '2026-08-05 14:24:31'),
(2, 'UE1A.230829.050', 108.00, '2026-08-05 14:08:53'),
(3, 'admin_test_cihazi', 0.00, '2026-08-03 12:06:27');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
CREATE TABLE IF NOT EXISTS `wallet_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('sale','withdrawal','refund') NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wallet_id` (`wallet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `wallet_id`, `amount`, `transaction_type`, `description`, `created_at`) VALUES
(1, 2, -250.00, 'withdrawal', 'Banka hesabına çekim talebi', '2026-08-03 14:53:34'),
(2, 1, -45.00, '', '\"Java Nesne Tabanlı Programlama Final Özeti\" not satın alımı', '2026-08-04 14:01:06'),
(3, 2, 36.00, 'sale', '\"Java Nesne Tabanlı Programlama Final Özeti\" not satış geliri', '2026-08-04 14:01:07'),
(4, 1, -30.00, '', '\"Veri Yapıları Vize Özet Notu\" not satın alımı', '2026-08-05 14:08:53'),
(5, 2, 24.00, 'sale', '\"Veri Yapıları Vize Özet Notu\" not satış geliri', '2026-08-05 14:08:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `withdraw_requests`
--

DROP TABLE IF EXISTS `withdraw_requests`;
CREATE TABLE IF NOT EXISTS `withdraw_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) DEFAULT NULL,
  `iban` varchar(34) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `user_id`, `iban`, `amount`, `status`, `created_at`, `resolved_at`) VALUES
(1, 'UE1A.230829.050', 'TR120006200000123456789001', 250.00, 'approved', '2026-08-03 14:53:34', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
