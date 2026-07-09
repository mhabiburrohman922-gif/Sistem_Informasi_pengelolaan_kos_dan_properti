-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2026 at 09:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_manajemen_kos`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_tunggu_kamar`
--

CREATE TABLE `daftar_tunggu_kamar` (
  `id_daftar_tunggu` int NOT NULL,
  `nama_peminat` varchar(100) NOT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tipe_kamar` int DEFAULT NULL,
  `tanggal_daftar` date NOT NULL,
  `status_tunggu` enum('Menunggu','Dihubungi','Batal') DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `denda_keterlambatan`
--

CREATE TABLE `denda_keterlambatan` (
  `id_denda` int NOT NULL,
  `id_tagihan` int DEFAULT NULL,
  `hari_terlambat` int NOT NULL,
  `tarif_denda_harian` decimal(10,2) NOT NULL,
  `total_denda` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_kamar`
--

CREATE TABLE `fasilitas_kamar` (
  `id_fasilitas` int NOT NULL,
  `id_kamar` int DEFAULT NULL,
  `nama_fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int NOT NULL,
  `id_properti` int DEFAULT NULL,
  `id_tipe` int DEFAULT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `status_kamar` enum('Tersedia','Terisi','Perbaikan') DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `id_properti`, `id_tipe`, `nomor_kamar`, `status_kamar`) VALUES
(6, NULL, 4, '1', 'Terisi'),
(7, NULL, 6, '2', 'Terisi'),
(8, NULL, 4, '3', 'Tersedia'),
(9, NULL, 5, '4', 'Terisi');

-- --------------------------------------------------------

--
-- Table structure for table `kontak_darurat_penyewa`
--

CREATE TABLE `kontak_darurat_penyewa` (
  `id_kontak` int NOT NULL,
  `id_penyewa` int DEFAULT NULL,
  `nama_kontak` varchar(100) NOT NULL,
  `hubungan` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_sewa`
--

CREATE TABLE `kontrak_sewa` (
  `id_kontrak` int NOT NULL,
  `id_penyewa` int DEFAULT NULL,
  `id_kamar` int DEFAULT NULL,
  `tanggal_mulai_kontrak` date NOT NULL,
  `tanggal_akhir_kontrak` date NOT NULL,
  `status_kontrak` enum('Aktif','Selesai','Batal') DEFAULT 'Aktif',
  `tanggal_mulai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kontrak_sewa`
--

INSERT INTO `kontrak_sewa` (`id_kontrak`, `id_penyewa`, `id_kamar`, `tanggal_mulai_kontrak`, `tanggal_akhir_kontrak`, `status_kontrak`, `tanggal_mulai`) VALUES
(7, 2, 9, '2026-07-15', '2026-12-06', 'Aktif', '2026-07-10'),
(8, 3, 6, '2026-07-06', '2026-12-30', 'Aktif', '2026-07-06'),
(9, 4, 7, '2026-07-06', '2026-07-30', 'Aktif', '2026-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_sewa`
--

CREATE TABLE `pembayaran_sewa` (
  `id_pembayaran` int NOT NULL,
  `id_tagihan` int DEFAULT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran_sewa`
--

INSERT INTO `pembayaran_sewa` (`id_pembayaran`, `id_tagihan`, `tanggal_bayar`, `jumlah_bayar`) VALUES
(1, 12, '2026-07-06', '3900000.00');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` int NOT NULL,
  `nama_penyewa` varchar(100) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `no_ktp`, `no_telp`, `email`) VALUES
(2, 'Agung Tri Kurniawan', '2452353235352', '06876378742', 'agungtrikurniawan936@gmail.com'),
(3, 'Alwi', '42343245325236', '08767242432', 'alwi@gmail.com'),
(4, 'Mas doni', '343532523525', '0687637874232', 'agungtrikurniawan936@gmail.com'),
(5, 'Aabian', '32443256325326', '087456436', 'abian@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_perbaikan`
--

CREATE TABLE `permintaan_perbaikan` (
  `id_perbaikan` int NOT NULL,
  `id_kamar` int DEFAULT NULL,
  `id_teknisi` int DEFAULT NULL,
  `tanggal_permintaan` date NOT NULL,
  `deskripsi` text NOT NULL,
  `status_perbaikan` enum('Menunggu','Proses','Selesai') DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan_perbaikan`
--

INSERT INTO `permintaan_perbaikan` (`id_perbaikan`, `id_kamar`, `id_teknisi`, `tanggal_permintaan`, `deskripsi`, `status_perbaikan`) VALUES
(1, 6, NULL, '2026-07-06', 'kramik mbledos', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `properti`
--

CREATE TABLE `properti` (
  `id_properti` int NOT NULL,
  `nama_properti` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properti`
--

INSERT INTO `properti` (`id_properti`, `nama_properti`, `alamat`) VALUES
(1, 'Kos Berkah Mandiri', 'Jl. Raya No. 123');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_sewa`
--

CREATE TABLE `tagihan_sewa` (
  `id_tagihan` int NOT NULL,
  `id_kontrak` int DEFAULT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` int NOT NULL,
  `jumlah_tagihan` decimal(10,2) NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `status_bayar` enum('Lunas','Belum Lunas') DEFAULT 'Belum Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan_sewa`
--

INSERT INTO `tagihan_sewa` (`id_tagihan`, `id_kontrak`, `bulan`, `tahun`, `jumlah_tagihan`, `tanggal_jatuh_tempo`, `status_bayar`) VALUES
(9, 7, 'July', 2026, '332222.00', '2026-07-20', 'Lunas'),
(10, 8, 'July', 2026, '500000.00', '2026-07-13', 'Lunas'),
(12, 9, 'July', 2026, '3900000.00', '2026-07-20', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `teknisi_properti`
--

CREATE TABLE `teknisi_properti` (
  `id_teknisi` int NOT NULL,
  `nama_teknisi` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `keahlian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teknisi_properti`
--

INSERT INTO `teknisi_properti` (`id_teknisi`, `nama_teknisi`, `no_telp`, `keahlian`) VALUES
(1, 'Mas ear', '087686284', 'Teknisi AC ');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kamar`
--

CREATE TABLE `tipe_kamar` (
  `id_tipe` int NOT NULL,
  `nama_tipe` varchar(50) NOT NULL,
  `tarif_bulanan` decimal(10,2) NOT NULL,
  `fasilitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipe_kamar`
--

INSERT INTO `tipe_kamar` (`id_tipe`, `nama_tipe`, `tarif_bulanan`, `fasilitas`) VALUES
(4, 'Deluxe class', '500000.00', 'BER AC KOMPOR'),
(5, 'eksekutif', '332222.00', 'ac'),
(6, 'eksekutif', '3900000.00', 'ac');

-- --------------------------------------------------------

--
-- Table structure for table `uang_deposit`
--

CREATE TABLE `uang_deposit` (
  `id_deposit` int NOT NULL,
  `id_kontrak` int DEFAULT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `status_kembali` enum('Belum','Sudah','Hangus') DEFAULT 'Belum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tunggakan_sewa`
-- (See below for the actual view)
--
CREATE TABLE `view_tunggakan_sewa` (
`bulan_tunggak` varchar(69)
,`id_penyewa` int
,`nomor_kamar` varchar(10)
,`total_tunggakan` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Structure for view `view_tunggakan_sewa`
--
-- CREATE VIEW dihapus karena InfinityFree tidak mengizinkan privilege CREATE VIEW
-- di hosting gratis (error #1142). Tabel stand-in di atas (baris 299) dibiarkan
-- sebagai tabel kosong. Ganti query "SELECT * FROM view_tunggakan_sewa" di dashboard.php
-- dengan query JOIN langsung (lihat kode penggantinya dari Claude).

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_tunggu_kamar`
--
ALTER TABLE `daftar_tunggu_kamar`
  ADD PRIMARY KEY (`id_daftar_tunggu`),
  ADD KEY `id_tipe_kamar` (`id_tipe_kamar`);

--
-- Indexes for table `denda_keterlambatan`
--
ALTER TABLE `denda_keterlambatan`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `id_tagihan` (`id_tagihan`);

--
-- Indexes for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_properti` (`id_properti`),
  ADD KEY `id_tipe` (`id_tipe`),
  ADD KEY `idx_status_kamar` (`status_kamar`);

--
-- Indexes for table `kontak_darurat_penyewa`
--
ALTER TABLE `kontak_darurat_penyewa`
  ADD PRIMARY KEY (`id_kontak`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- Indexes for table `kontrak_sewa`
--
ALTER TABLE `kontrak_sewa`
  ADD PRIMARY KEY (`id_kontrak`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `pembayaran_sewa`
--
ALTER TABLE `pembayaran_sewa`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_tagihan` (`id_tagihan`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD UNIQUE KEY `no_ktp` (`no_ktp`);

--
-- Indexes for table `permintaan_perbaikan`
--
ALTER TABLE `permintaan_perbaikan`
  ADD PRIMARY KEY (`id_perbaikan`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_teknisi` (`id_teknisi`);

--
-- Indexes for table `properti`
--
ALTER TABLE `properti`
  ADD PRIMARY KEY (`id_properti`);

--
-- Indexes for table `tagihan_sewa`
--
ALTER TABLE `tagihan_sewa`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `id_kontrak` (`id_kontrak`),
  ADD KEY `idx_jatuh_tempo` (`tanggal_jatuh_tempo`);

--
-- Indexes for table `teknisi_properti`
--
ALTER TABLE `teknisi_properti`
  ADD PRIMARY KEY (`id_teknisi`);

--
-- Indexes for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indexes for table `uang_deposit`
--
ALTER TABLE `uang_deposit`
  ADD PRIMARY KEY (`id_deposit`),
  ADD KEY `id_kontrak` (`id_kontrak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_tunggu_kamar`
--
ALTER TABLE `daftar_tunggu_kamar`
  MODIFY `id_daftar_tunggu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `denda_keterlambatan`
--
ALTER TABLE `denda_keterlambatan`
  MODIFY `id_denda` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  MODIFY `id_fasilitas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kontak_darurat_penyewa`
--
ALTER TABLE `kontak_darurat_penyewa`
  MODIFY `id_kontak` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontrak_sewa`
--
ALTER TABLE `kontrak_sewa`
  MODIFY `id_kontrak` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_sewa`
--
ALTER TABLE `pembayaran_sewa`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `id_penyewa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permintaan_perbaikan`
--
ALTER TABLE `permintaan_perbaikan`
  MODIFY `id_perbaikan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `properti`
--
ALTER TABLE `properti`
  MODIFY `id_properti` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tagihan_sewa`
--
ALTER TABLE `tagihan_sewa`
  MODIFY `id_tagihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teknisi_properti`
--
ALTER TABLE `teknisi_properti`
  MODIFY `id_teknisi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  MODIFY `id_tipe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uang_deposit`
--
ALTER TABLE `uang_deposit`
  MODIFY `id_deposit` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_tunggu_kamar`
--
ALTER TABLE `daftar_tunggu_kamar`
  ADD CONSTRAINT `daftar_tunggu_kamar_ibfk_1` FOREIGN KEY (`id_tipe_kamar`) REFERENCES `tipe_kamar` (`id_tipe`);

--
-- Constraints for table `denda_keterlambatan`
--
ALTER TABLE `denda_keterlambatan`
  ADD CONSTRAINT `denda_keterlambatan_ibfk_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan_sewa` (`id_tagihan`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`id_properti`) REFERENCES `properti` (`id_properti`),
  ADD CONSTRAINT `kamar_ibfk_2` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_kamar` (`id_tipe`);

--
-- Constraints for table `kontak_darurat_penyewa`
--
ALTER TABLE `kontak_darurat_penyewa`
  ADD CONSTRAINT `kontak_darurat_penyewa_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`);

--
-- Constraints for table `kontrak_sewa`
--
ALTER TABLE `kontrak_sewa`
  ADD CONSTRAINT `kontrak_sewa_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`);

--
-- Constraints for table `pembayaran_sewa`
--
ALTER TABLE `pembayaran_sewa`
  ADD CONSTRAINT `pembayaran_sewa_ibfk_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan_sewa` (`id_tagihan`);

--
-- Constraints for table `permintaan_perbaikan`
--
ALTER TABLE `permintaan_perbaikan`
  ADD CONSTRAINT `permintaan_perbaikan_ibfk_2` FOREIGN KEY (`id_teknisi`) REFERENCES `teknisi_properti` (`id_teknisi`);

--
-- Constraints for table `tagihan_sewa`
--
ALTER TABLE `tagihan_sewa`
  ADD CONSTRAINT `tagihan_sewa_ibfk_1` FOREIGN KEY (`id_kontrak`) REFERENCES `kontrak_sewa` (`id_kontrak`);

--
-- Constraints for table `uang_deposit`
--
ALTER TABLE `uang_deposit`
  ADD CONSTRAINT `uang_deposit_ibfk_1` FOREIGN KEY (`id_kontrak`) REFERENCES `kontrak_sewa` (`id_kontrak`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;