-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jan 2023 pada 18.14
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_demografi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_agama`
--

CREATE TABLE `tab_agama` (
  `id` int(11) NOT NULL,
  `agama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_agama`
--

INSERT INTO `tab_agama` (`id`, `agama`) VALUES
(1, 'islam'),
(2, 'kristen'),
(3, 'protestan'),
(4, 'khatolik'),
(5, 'hindu'),
(6, 'budha'),
(7, 'khonguchu'),
(8, 'lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_kelurahan`
--

CREATE TABLE `tab_kelurahan` (
  `id` int(11) NOT NULL,
  `kelurahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_kelurahan`
--

INSERT INTO `tab_kelurahan` (`id`, `kelurahan`) VALUES
(1, 'semper_barat'),
(2, 'semper_timur'),
(3, 'cilincing'),
(4, 'rorotan'),
(5, 'kalibaru'),
(6, 'sukapura'),
(7, 'marunda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_pendapatan`
--

CREATE TABLE `tab_pendapatan` (
  `id` int(11) NOT NULL,
  `pendapatan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_pendapatan`
--

INSERT INTO `tab_pendapatan` (`id`, `pendapatan`) VALUES
(1, 'Dibawah UMR jakarta perbulan '),
(2, '4,6-5 Juta Perbulan'),
(3, '5-7 Juta Perbulan'),
(4, '7-10 Juta Perbulan'),
(5, 'Diatas 10 Juta Perbulan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_pendidikan`
--

CREATE TABLE `tab_pendidikan` (
  `id` int(11) NOT NULL,
  `pendidikan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_pendidikan`
--

INSERT INTO `tab_pendidikan` (`id`, `pendidikan`) VALUES
(1, 'Tidak Sekolah'),
(2, 'SD'),
(3, 'SMP'),
(4, 'SMA'),
(5, 'D-1'),
(6, 'D-3'),
(7, 'S1/D-4'),
(8, 'S2'),
(9, 'S3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_penduduk`
--

CREATE TABLE `tab_penduduk` (
  `nik` varchar(30) NOT NULL,
  `no_kk` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `pendidikan` int(11) DEFAULT NULL,
  `pendapatan` int(11) DEFAULT NULL,
  `Agama` int(11) DEFAULT NULL,
  `alamat_lengkap` varchar(255) DEFAULT NULL,
  `kelurahan` int(11) DEFAULT NULL,
  `penduduk_asli` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tab_penduduk`
--

INSERT INTO `tab_penduduk` (`nik`, `no_kk`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `pendidikan`, `pendapatan`, `Agama`, `alamat_lengkap`, `kelurahan`, `penduduk_asli`) VALUES
('3175119775514050', '3175293829275766', 'Kunia Selo', 'Banten', '1992-11-01', 'Pria', 3, 2, 5, 'Pekanbaru', 5, 'Ya'),
('3175147345622283', '3175712992511450', 'Rendra Tjajadi', 'Banten', '1996-01-31', 'Wanita', 5, 5, 3, 'Bandung', 5, 'Ya'),
('3175204857029136', '3175805784571025', 'Raka Febrian', 'Padang', '1998-03-19', 'Wanita', 3, 3, 2, 'Bogor', 5, 'Ya'),
('3175214735838901', '3175163087271575', 'Denny Christian', 'Jakarta', '2003-07-30', 'Pria', 8, 2, 6, 'Padang', 3, 'Ya'),
('3175237737657215', '3175315858064669', 'Juliana', 'Pekanbaru', '2000-11-18', 'Wanita', 7, 2, 5, 'Bogor', 3, 'Ya'),
('3175251394832863', '3175772355125121', 'Erna Susilo', 'Jogja', '2003-03-25', 'Wanita', 6, 5, 2, 'Banten', 7, 'Ya'),
('3175288242452098', '3175416261105585', 'Imam Susanti', 'Riau', '2003-09-11', 'Pria', 1, 1, 6, 'Riau', 1, 'Ya'),
('3175289848255224', '3175500820315368', 'Jundai', 'Pontianak', '2003-04-28', 'Pria', 2, 1, 3, 'Pontianak', 6, 'Ya'),
('3175293374306345', '3175125043048619', 'Yanuarius Gunawan', 'Bogor', '2001-10-11', 'Pria', 9, 1, 3, 'Jogja', 2, 'Ya'),
('3175301623411850', '3175285788231717', 'Dwi Alya', 'Bandung', '1992-06-28', 'Pria', 7, 4, 6, 'Bekasi', 5, 'Ya'),
('3175356425677755', '3175373357054927', 'Amelia Kurniawan', 'Padang', '1999-09-26', 'Wanita', 8, 2, 3, 'Pontianak', 2, 'Ya'),
('3175391917876717', '3175412624671660', 'Amesh Anand', 'Jakarta', '1991-02-13', 'Pria', 2, 4, 8, 'Jogja', 2, 'Ya'),
('3175412226862161', '3175994736504768', 'Doni Irawan', 'Riau', '1990-07-05', 'Pria', 6, 4, 7, 'Bandung', 1, 'Ya'),
('3175424763886923', '3175486073405479', 'Febriana', 'Aceh', '1994-10-07', 'Pria', 7, 2, 8, 'Pekanbaru', 3, 'Ya'),
('3175468051461697', '3175122758381834', 'Abdul Kodhir', 'Pekanbaru', '1997-12-29', 'Wanita', 9, 5, 4, 'Pontianak', 1, 'Ya'),
('3175481287123874', '3175420114577841', 'Dodi Suharto', 'Jogja', '1990-09-25', 'Pria', 8, 2, 4, 'Bogor', 4, 'Ya'),
('3175487156645636', '3175683598559860', 'Benny Hartono', 'Pontianak', '1993-11-09', 'Pria', 2, 3, 3, 'Bogor', 5, 'Ya'),
('3175504270676752', '3175755212748742', 'Bambang Kurnia', 'Bekasi', '1997-11-26', 'Pria', 6, 1, 3, 'Bogor', 2, 'Ya'),
('3175552034297185', '3175859089885027', 'Bagas Aji Prasetyo', 'Jogja', '2000-10-27', 'Wanita', 2, 3, 2, 'Bogor', 3, 'Ya'),
('3175567279924365', '3175191591743120', 'Hasanuddin', 'Aceh', '1994-05-16', 'Pria', 9, 3, 7, 'Bandung', 7, 'Ya'),
('3175595950903500', '3175122243961006', 'Eddi Sujino', 'Pekanbaru', '1996-05-26', 'Pria', 8, 3, 8, 'Padang', 6, 'Ya'),
('3175697886494759', '3175974141747432', 'Abdul Rahman', 'Bandung', '1995-12-02', 'Pria', 1, 2, 3, 'Padang', 6, 'Ya'),
('3175749899729272', '3175381553679963', 'Iqlimah hayatul', 'Aceh', '2000-07-05', 'Pria', 1, 3, 8, 'Pontianak', 3, 'Ya'),
('3175834011182701', '3175436663732486', 'Seftiana Ananda', 'Banten', '1991-09-01', 'Pria', 7, 3, 1, 'Bekasi', 3, 'Ya'),
('3175873792691636', '3175192018884745', 'Evan Dermawan', 'Pontianak', '2001-06-12', 'Wanita', 4, 3, 1, 'Bogor', 4, 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tab_user`
--

CREATE TABLE `tab_user` (
  `id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_by` varchar(15) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tab_user`
--

INSERT INTO `tab_user` (`id`, `username`, `password`, `lastlogin`, `created_by`, `created_at`, `update_by`, `update_at`) VALUES
(1, 'admin', 'admin', '2023-01-26 10:50:38', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tab_agama`
--
ALTER TABLE `tab_agama`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tab_kelurahan`
--
ALTER TABLE `tab_kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tab_pendapatan`
--
ALTER TABLE `tab_pendapatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tab_pendidikan`
--
ALTER TABLE `tab_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tab_penduduk`
--
ALTER TABLE `tab_penduduk`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `tab_user`
--
ALTER TABLE `tab_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tab_agama`
--
ALTER TABLE `tab_agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tab_kelurahan`
--
ALTER TABLE `tab_kelurahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tab_pendapatan`
--
ALTER TABLE `tab_pendapatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tab_pendidikan`
--
ALTER TABLE `tab_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tab_user`
--
ALTER TABLE `tab_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
