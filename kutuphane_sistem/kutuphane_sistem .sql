-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Oca 2025, 20:34:17
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kutuphane_sistem`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ceza`
--

CREATE TABLE `ceza` (
  `cezaID` int(11) NOT NULL,
  `uyeID` int(11) NOT NULL,
  `tur` varchar(50) NOT NULL,
  `gun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ceza`
--

INSERT INTO `ceza` (`cezaID`, `uyeID`, `tur`, `gun`) VALUES
(1, 1, 'Geç Teslim', 0),
(2, 3, 'Geç Teslim', 7),
(3, 4, 'Hasarlı Kitap', 10),
(4, 5, 'Kitap Kaybı', 14),
(5, 2, 'Geç Teslim', 3),
(6, 2, 'Geç Teslim', 3),
(7, 6, 'Geç Teslim', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `izin`
--

CREATE TABLE `izin` (
  `izinID` int(11) NOT NULL,
  `personelID` int(11) NOT NULL,
  `izinBaslangicTarihi` date NOT NULL,
  `izinBitisTarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `izin`
--

INSERT INTO `izin` (`izinID`, `personelID`, `izinBaslangicTarihi`, `izinBitisTarihi`) VALUES
(1, 1, '2025-01-01', '2025-01-10'),
(2, 2, '2025-02-01', '2025-02-05'),
(3, 1, '2025-01-01', '2025-01-03'),
(4, 5, '2025-01-03', '2025-01-06'),
(5, 2, '2025-01-08', '2025-01-14'),
(6, 19, '2025-01-08', '2025-01-08'),
(7, 4, '2025-01-13', '2025-01-14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaplar`
--

CREATE TABLE `kitaplar` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `tur` varchar(50) NOT NULL,
  `yazar` varchar(100) NOT NULL,
  `yayinevi` varchar(100) NOT NULL,
  `durum` enum('Mevcut','Ödünç Verildi') DEFAULT 'Mevcut'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kitaplar`
--

INSERT INTO `kitaplar` (`id`, `ad`, `tur`, `yazar`, `yayinevi`, `durum`) VALUES
(1, 'Suç ve Ceza', 'Roman', 'Fyodor Dostoyevski', 'İthaki Yayınları', 'Mevcut'),
(2, 'Sefiller', 'Roman', 'Victor Hugo', 'İş Bankası Yayınları', 'Ödünç Verildi'),
(3, 'Simyacı', 'Roman', 'Paulo Coelho', 'Can Yayınları', 'Ödünç Verildi'),
(4, 'Körlük', 'Roman', 'José Saramago', 'Kırmızı Kedi Yayınları', 'Mevcut'),
(5, 'Hayvan Çiftliği', 'Roman', 'George Orwell', 'Can Yayınları', 'Mevcut'),
(6, '1984', 'Roman', 'George Orwell', 'Can Yayınları', 'Mevcut'),
(7, 'Karamazov Kardeşler', 'Roman', 'Fyodor Dostoyevski', 'İthaki Yayınları', 'Mevcut'),
(8, 'Anna Karenina', 'Roman', 'Lev Tolstoy', 'İş Bankası Yayınları', 'Mevcut'),
(9, 'İki Şehrin Hikayesi', 'Roman', 'Charles Dickens', 'İş Bankası Yayınları', 'Mevcut'),
(10, 'Vadideki Zambak', 'Roman', 'Honoré de Balzac', 'Can Yayınları', 'Mevcut'),
(11, 'Yeraltından Notlar', 'Roman', 'Fyodor Dostoyevski', 'İthaki Yayınları', 'Mevcut'),
(12, 'Küçük Prens', 'Masal', 'Antoine de Saint-Exupéry', 'Can Yayınları', 'Mevcut'),
(13, 'Savaş ve Barış', 'Roman', 'Lev Tolstoy', 'İş Bankası Yayınları', 'Mevcut'),
(14, 'Şeker Portakalı', 'Roman', 'José Mauro de Vasconcelos', 'Can Yayınları', 'Mevcut'),
(15, 'Çavdar Tarlasında Çocuklar', 'Roman', 'J.D. Salinger', 'Yapı Kredi Yayınları', 'Mevcut'),
(16, 'Uçurtma Avcısı', 'Roman', 'Khaled Hosseini', 'Everest Yayınları', 'Mevcut'),
(17, 'Yüzyıllık Yalnızlık', 'Roman', 'Gabriel García Márquez', 'Can Yayınları', 'Mevcut'),
(18, 'Aylak Adam', 'Roman', 'Yusuf Atılgan', 'Yapı Kredi Yayınları', 'Mevcut'),
(19, 'Anayurt Oteli', 'Roman', 'Yusuf Atılgan', 'Yapı Kredi Yayınları', 'Mevcut'),
(20, 'Saatleri Ayarlama Enstitüsü', 'Roman', 'Ahmet Hamdi Tanpınar', 'Dergah Yayınları', 'Mevcut');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzemeler`
--

CREATE TABLE `malzemeler` (
  `id` int(11) NOT NULL,
  `urun_adi` varchar(100) NOT NULL,
  `stok_miktari` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `malzemeler`
--

INSERT INTO `malzemeler` (`id`, `urun_adi`, `stok_miktari`) VALUES
(1, 'Sandalye', 50),
(2, 'Masa', 30),
(3, 'Bilgisayar', 10),
(4, 'Kitaplık', 20),
(5, 'Projektör', 5),
(6, 'Yazıcı', 7),
(7, 'Beyaz Tahta', 15),
(8, 'Klima', 3),
(9, 'Su Sebili', 2),
(10, 'Kablo', 100),
(11, 'Lamba', 25),
(12, 'Kalem', 200),
(13, 'Silgi', 150),
(14, 'Defter', 49),
(15, 'Çöp Kutusu', 10),
(16, 'Perde', 9),
(17, 'Raf', 40),
(18, 'Şarj Aleti', 15),
(19, 'Mouse', 12),
(20, 'Klavye', 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzeme_hareketler`
--

CREATE TABLE `malzeme_hareketler` (
  `id` int(11) NOT NULL,
  `malzeme_id` int(11) DEFAULT NULL,
  `personel_id` int(11) DEFAULT NULL,
  `islem_turu` enum('Giriş','Çıkış') DEFAULT NULL,
  `miktar` int(11) DEFAULT NULL,
  `tarih` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `malzeme_hareketler`
--

INSERT INTO `malzeme_hareketler` (`id`, `malzeme_id`, `personel_id`, `islem_turu`, `miktar`, `tarih`) VALUES
(1, 1, 1, 'Giriş', 10, '2024-12-15 08:45:00'),
(2, 2, 2, 'Giriş', 5, '2024-12-16 09:00:00'),
(3, 3, 3, 'Çıkış', 2, '2024-12-17 10:30:00'),
(4, 4, 4, 'Giriş', 8, '2024-12-18 11:45:00'),
(5, 5, 5, 'Çıkış', 1, '2024-12-19 13:00:00'),
(6, 6, 6, 'Giriş', 3, '2024-12-20 14:15:00'),
(7, 7, 7, 'Çıkış', 7, '2024-12-21 15:30:00'),
(8, 8, 8, 'Giriş', 6, '2024-12-22 16:45:00'),
(9, 9, 9, 'Çıkış', 4, '2024-12-23 17:00:00'),
(10, 10, 10, 'Giriş', 12, '2024-12-24 08:30:00'),
(11, 11, 11, 'Çıkış', 3, '2024-12-25 09:45:00'),
(12, 12, 12, 'Giriş', 9, '2024-12-26 11:00:00'),
(13, 13, 13, 'Çıkış', 5, '2024-12-27 13:15:00'),
(14, 14, 14, 'Giriş', 4, '2024-12-28 14:30:00'),
(15, 15, 15, 'Çıkış', 6, '2024-12-29 15:45:00'),
(16, 16, 16, 'Giriş', 7, '2024-12-30 16:00:00'),
(17, 17, 17, 'Çıkış', 2, '2024-12-31 17:15:00'),
(18, 18, 18, 'Giriş', 10, '2025-01-01 08:45:00'),
(19, 19, 19, 'Çıkış', 3, '2025-01-02 09:00:00'),
(20, 20, 20, 'Giriş', 5, '2025-01-03 10:30:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mola`
--

CREATE TABLE `mola` (
  `MolaID` int(11) NOT NULL,
  `MolaAdi` varchar(50) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `mola`
--

INSERT INTO `mola` (`MolaID`, `MolaAdi`, `aktif`) VALUES
(1, 'Mola 1', 0),
(2, 'Mola 2', 0),
(3, 'Mola 3', 1),
(4, 'Mola 4', 0),
(5, 'Mola 5', 0),
(6, 'Mola 6', 0),
(7, 'Mola 7', 0),
(8, 'Mola 8', 0),
(9, 'Mola 9', 0),
(10, 'Mola 10', 0),
(11, 'Mola 1', 0),
(12, 'Mola 2', 0),
(13, 'Mola 3', 0),
(14, 'Mola 4', 0),
(15, 'Mola 5', 0),
(16, 'Mola 6', 0),
(17, 'Mola 7', 0),
(18, 'Mola 8', 0),
(19, 'Mola 9', 0),
(20, 'Mola 10', 0),
(21, 'Mola 11', 0),
(22, 'Mola 12', 0),
(23, 'Mola 13', 1),
(24, 'Mola 14', 0),
(25, 'Mola 15', 0),
(26, 'Mola 16', 0),
(27, 'Mola 17', 0),
(28, 'Mola 18', 0),
(29, 'Mola 19', 0),
(30, 'Mola 20', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odunc_kayitlar`
--

CREATE TABLE `odunc_kayitlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) DEFAULT NULL,
  `kitap_id` int(11) DEFAULT NULL,
  `alim_tarihi` datetime DEFAULT current_timestamp(),
  `teslim_tarihi` datetime DEFAULT NULL,
  `durum` enum('Devam Ediyor','Teslim Edildi') DEFAULT 'Devam Ediyor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `odunc_kayitlar`
--

INSERT INTO `odunc_kayitlar` (`id`, `uye_id`, `kitap_id`, `alim_tarihi`, `teslim_tarihi`, `durum`) VALUES
(1, 1, 3, '2024-12-25 14:30:00', '2025-01-02 10:00:00', 'Teslim Edildi'),
(2, 2, 1, '2024-12-20 10:00:00', NULL, 'Devam Ediyor'),
(3, 3, 4, '2024-12-18 15:00:00', '2024-12-30 11:00:00', 'Teslim Edildi'),
(4, 4, 2, '2024-12-27 11:15:00', NULL, 'Devam Ediyor'),
(5, 5, 5, '2024-12-19 16:30:00', '2025-01-01 09:45:00', 'Teslim Edildi'),
(6, 6, 6, '2024-12-23 09:00:00', NULL, 'Devam Ediyor'),
(7, 7, 7, '2024-12-21 13:30:00', NULL, 'Devam Ediyor'),
(8, 8, 8, '2024-12-24 14:45:00', '2024-12-31 16:00:00', 'Teslim Edildi'),
(9, 9, 9, '2024-12-26 12:00:00', NULL, 'Devam Ediyor'),
(10, 10, 10, '2024-12-28 10:30:00', NULL, 'Devam Ediyor'),
(11, 11, 11, '2024-12-15 08:45:00', '2024-12-22 14:00:00', 'Teslim Edildi'),
(12, 12, 12, '2024-12-17 11:30:00', '2024-12-29 09:00:00', 'Teslim Edildi'),
(13, 13, 13, '2024-12-16 14:00:00', NULL, 'Devam Ediyor'),
(14, 14, 14, '2024-12-19 15:30:00', NULL, 'Devam Ediyor'),
(15, 15, 15, '2024-12-22 09:45:00', '2024-12-30 12:00:00', 'Teslim Edildi'),
(16, 16, 16, '2024-12-24 14:00:00', '2025-01-02 13:00:00', 'Teslim Edildi'),
(17, 17, 17, '2024-12-25 10:15:00', NULL, 'Devam Ediyor'),
(18, 18, 18, '2024-12-26 11:30:00', NULL, 'Devam Ediyor'),
(19, 19, 19, '2024-12-28 14:45:00', NULL, 'Devam Ediyor'),
(20, 20, 20, '2024-12-29 16:00:00', NULL, 'Devam Ediyor');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personeller`
--

CREATE TABLE `personeller` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `sifre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `personeller`
--

INSERT INTO `personeller` (`id`, `ad`, `soyad`, `email`, `telefon`, `sifre`) VALUES
(1, 'Murat', 'Taş', 'murat.tas@example.com', '05001234567', 'MuratStaff1*'),
(2, 'Selin', 'Çetin', 'selin.cetin@example.com', '05002345678', 'SelinStaff2*'),
(3, 'Burak', 'Koç', 'burak.koc@example.com', '05003456789', 'BurakStaff3*'),
(4, 'Leyla', 'Kaya', 'leyla.kaya@example.com', '05004567890', 'LeylaStaff4*'),
(5, 'Deniz', 'Özer', 'deniz.ozer@example.com', '05005678901', 'DenizStaff5*'),
(6, 'Hakan', 'Demir', 'hakan.demir@example.com', '05006789012', 'HakanStaff6*'),
(7, 'Canan', 'Aksoy', 'canan.aksoy@example.com', '05007890123', 'CananStaff7*'),
(8, 'Cemil', 'Eren', 'cemil.eren@example.com', '05008901234', 'CemilStaff8*'),
(9, 'Seda', 'Korkmaz', 'seda.korkmaz@example.com', '05009123456', 'SedaStaff9*'),
(10, 'Halil', 'Yıldız', 'halil.yildiz@example.com', '05001237890', 'HalilStaff10*'),
(11, 'Nihal', 'Arslan', 'nihal.arslan@example.com', '05004567891', 'NihalStaff11*'),
(12, 'Kemal', 'Şahin', 'kemal.sahin@example.com', '05007894561', 'KemalStaff12*'),
(13, 'Fikret', 'Aydın', 'fikret.aydin@example.com', '05009875671', 'FikretStaff13*'),
(14, 'Meliha', 'Güneş', 'meliha.gunes@example.com', '05003456781', 'MelihaStaff14*'),
(15, 'Ebru', 'Kılıç', 'ebru.kilic@example.com', '05002134567', 'EbruStaff15*'),
(16, 'Orhan', 'Bilir', 'orhan.bilir@example.com', '05005678123', 'OrhanStaff16*'),
(17, 'Aslı', 'Koçak', 'asli.kocak@example.com', '05006781234', 'AsliStaff17*'),
(18, 'Tamer', 'Uzun', 'tamer.uzun@example.com', '05003450123', 'TamerStaff18*'),
(19, 'Hülya', 'Erdoğan', 'hulya.erdogan@example.com', '05007891456', 'HulyaStaff19*'),
(20, 'Oğuz', 'Çelik', 'oguz.celik@example.com', '05008912345', 'OguzStaff20*');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `adres` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `sifre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`id`, `ad`, `soyad`, `adres`, `email`, `sifre`) VALUES
(1, 'Ahmet', 'Yılmaz', 'Ankara', 'ahmet@example.com', 'Ahmet123!'),
(2, 'Ayşe', 'Demir', 'İstanbul', 'ayse@example.com', 'Ayse456!'),
(3, 'Mehmet', 'Kaya', 'İzmir', 'mehmet@example.com', 'Mehmet789!'),
(4, 'Fatma', 'Çelik', 'Bursa', 'fatma@example.com', 'Fatma234!'),
(5, 'Hasan', 'Aydın', 'Antalya', 'hasan@example.com', 'Hasan567!'),
(6, 'Emine', 'Şahin', 'Konya', 'emine@example.com', 'Emine890!'),
(7, 'Ali', 'Öztürk', 'Gaziantep', 'ali@example.com', 'Ali345!'),
(8, 'Zeynep', 'Arslan', 'Adana', 'zeynep@example.com', 'Zeynep678!'),
(9, 'Murat', 'Aksoy', 'Trabzon', 'murat@example.com', 'Murat901!'),
(10, 'Elif', 'Eren', 'Diyarbakır', 'elif@example.com', 'Elif123!'),
(11, 'Cem', 'Polat', 'Samsun', 'cem@example.com', 'Cem456!'),
(12, 'Ebru', 'Erdoğan', 'Eskişehir', 'ebru@example.com', 'Ebru789!'),
(13, 'Deniz', 'Korkmaz', 'Mersin', 'deniz@example.com', 'Deniz234!'),
(14, 'Hüseyin', 'Duman', 'Kayseri', 'huseyin@example.com', 'Huseyin567!'),
(15, 'Ceren', 'Güneş', 'Hatay', 'ceren@example.com', 'Ceren890!'),
(16, 'Onur', 'Akın', 'Van', 'onur@example.com', 'Onur345!'),
(17, 'Seda', 'Çalışkan', 'Erzurum', 'seda@example.com', 'Seda678!'),
(18, 'Can', 'Sezer', 'Kocaeli', 'can@example.com', 'Can901!'),
(19, 'Melek', 'Yıldırım', 'Balıkesir', 'melek@example.com', 'Melek123!'),
(20, 'Gökhan', 'Uzun', 'Malatya', 'gokhan@example.com', 'Gokhan456!');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoneticiler`
--

CREATE TABLE `yoneticiler` (
  `id` int(11) NOT NULL,
  `ad_soyad` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `sifre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yoneticiler`
--

INSERT INTO `yoneticiler` (`id`, `ad_soyad`, `email`, `telefon`, `sifre`) VALUES
(1, 'Serkan Öztürk', 'serkan.ozturk@example.com', '05001234567', 'SerkanAdmin1#'),
(2, 'Zehra Kılıç', 'zehra.kilic@example.com', '05002345678', 'ZehraAdmin2#'),
(3, 'Onur Demir', 'onur.demir@example.com', '05003456789', 'OnurAdmin3#'),
(4, 'Merve Çetin', 'merve.cetin@example.com', '05004567890', 'MerveAdmin4#'),
(5, 'Burak Yılmaz', 'burak.yilmaz@example.com', '05005678901', 'BurakAdmin5#'),
(6, 'Selin Kaya', 'selin.kaya@example.com', '05006789012', 'SelinAdmin6#'),
(7, 'Cemal Arslan', 'cemal.arslan@example.com', '05007890123', 'CemalAdmin7#'),
(8, 'Halime Taş', 'halime.tas@example.com', '05008901234', 'HalimeAdmin8#'),
(9, 'Fatih Koç', 'fatih.koc@example.com', '05009123456', 'FatihAdmin9#'),
(10, 'Sibel Erdoğan', 'sibel.erdogan@example.com', '05001237890', 'SibelAdmin10#'),
(11, 'Ali Şahin', 'ali.sahin@example.com', '05004567891', 'AliAdmin11#'),
(12, 'Nazan Güneş', 'nazan.gunes@example.com', '05007894561', 'NazanAdmin12#'),
(13, 'Tuna Aksoy', 'tuna.aksoy@example.com', '05009875671', 'TunaAdmin13#'),
(14, 'Meltem Yıldız', 'meltem.yildiz@example.com', '05003456781', 'MeltemAdmin14#'),
(15, 'Berk Özer', 'berk.ozer@example.com', '05002134567', 'BerkAdmin15#'),
(16, 'Zeki Çelik', 'zeki.celik@example.com', '05005678123', 'ZekiAdmin16#'),
(17, 'Cansu Demir', 'cansu.demir@example.com', '05006781234', 'CansuAdmin17#'),
(18, 'Kerem Aydın', 'kerem.aydin@example.com', '05003450123', 'KeremAdmin18#'),
(19, 'Hande Bilir', 'hande.bilir@example.com', '05007891456', 'HandeAdmin19#'),
(20, 'Volkan Uzun', 'volkan.uzun@example.com', '05008912345', 'VolkanAdmin20#');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ceza`
--
ALTER TABLE `ceza`
  ADD PRIMARY KEY (`cezaID`),
  ADD KEY `uyeID` (`uyeID`);

--
-- Tablo için indeksler `izin`
--
ALTER TABLE `izin`
  ADD PRIMARY KEY (`izinID`),
  ADD KEY `personelID` (`personelID`);

--
-- Tablo için indeksler `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `malzemeler`
--
ALTER TABLE `malzemeler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `malzeme_hareketler`
--
ALTER TABLE `malzeme_hareketler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `malzeme_id` (`malzeme_id`),
  ADD KEY `personel_id` (`personel_id`);

--
-- Tablo için indeksler `odunc_kayitlar`
--
ALTER TABLE `odunc_kayitlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uye_id` (`uye_id`),
  ADD KEY `kitap_id` (`kitap_id`);

--
-- Tablo için indeksler `personeller`
--
ALTER TABLE `personeller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `yoneticiler`
--
ALTER TABLE `yoneticiler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ceza`
--
ALTER TABLE `ceza`
  MODIFY `cezaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `izin`
--
ALTER TABLE `izin`
  MODIFY `izinID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `kitaplar`
--
ALTER TABLE `kitaplar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `malzemeler`
--
ALTER TABLE `malzemeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `malzeme_hareketler`
--
ALTER TABLE `malzeme_hareketler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `odunc_kayitlar`
--
ALTER TABLE `odunc_kayitlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `personeller`
--
ALTER TABLE `personeller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `yoneticiler`
--
ALTER TABLE `yoneticiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ceza`
--
ALTER TABLE `ceza`
  ADD CONSTRAINT `ceza_ibfk_1` FOREIGN KEY (`uyeID`) REFERENCES `uyeler` (`id`);

--
-- Tablo kısıtlamaları `izin`
--
ALTER TABLE `izin`
  ADD CONSTRAINT `izin_ibfk_1` FOREIGN KEY (`personelID`) REFERENCES `personeller` (`id`);

--
-- Tablo kısıtlamaları `malzeme_hareketler`
--
ALTER TABLE `malzeme_hareketler`
  ADD CONSTRAINT `malzeme_hareketler_ibfk_1` FOREIGN KEY (`malzeme_id`) REFERENCES `malzemeler` (`id`),
  ADD CONSTRAINT `malzeme_hareketler_ibfk_2` FOREIGN KEY (`personel_id`) REFERENCES `personeller` (`id`);

--
-- Tablo kısıtlamaları `odunc_kayitlar`
--
ALTER TABLE `odunc_kayitlar`
  ADD CONSTRAINT `odunc_kayitlar_ibfk_1` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`id`),
  ADD CONSTRAINT `odunc_kayitlar_ibfk_2` FOREIGN KEY (`kitap_id`) REFERENCES `kitaplar` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
