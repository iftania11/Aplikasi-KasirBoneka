-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 08:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_kasirtania`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailpenjualan`
--

CREATE TABLE `tbl_detailpenjualan` (
  `id_detail` varchar(30) NOT NULL,
  `kode_produk` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `qty` int(15) NOT NULL,
  `status` varchar(30) NOT NULL,
  `total_harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_detailpenjualan`
--

INSERT INTO `tbl_detailpenjualan` (`id_detail`, `kode_produk`, `harga_jual`, `qty`, `status`, `total_harga`) VALUES
('1', 765, 345, 9, 'Belum lunas', 3105),
('2', 765, 345, 2, 'Belum lunas', 690);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(15) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(12344, 'boneka doraemonnn'),
(1234567, 'Boneka cakki');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `id_penjualan` int(15) NOT NULL,
  `nama_user` varchar(15) NOT NULL,
  `no_faktur` varchar(30) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `cash` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`id_penjualan`, `nama_user`, `no_faktur`, `tgl_penjualan`, `cash`) VALUES
(1, 'tania', '123', '2024-02-26', 20000),
(2, 'tania', '2345', '2024-02-26', 3666);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `kode_produk` varchar(50) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `stok` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`kode_produk`, `nama_produk`, `harga_jual`, `harga_beli`, `nama_kategori`, `stok`) VALUES
('123', 'Boneka doraemon', 1000000, 10000, 'boneka doraemonnn', 100),
('765', 'Boneka hello kitty', 10000, 100, '345', 4),
('766', 'boneka ', 1000, 1500, '120', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `id_satuan` int(15) NOT NULL,
  `nama_satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `tgl_transaksi` date NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `kode_barang` int(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_barang` int(10) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(15) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('admin','kasir') NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `password`, `level`, `email`) VALUES
(2, 'ifta', '123', 'admin', 'iftania@gmail.com'),
(123, 'tania', '111', 'kasir', 'tania@gmail.com'),
(567, 'iip', '897', 'admin', 'iip@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_detailpenjualan`
--
ALTER TABLE `tbl_detailpenjualan`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_user` (`nama_user`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`kode_produk`),
  ADD KEY `id_kategori` (`nama_kategori`);

--
-- Indexes for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234568;

--
-- AUTO_INCREMENT for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  MODIFY `id_penjualan` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `id_satuan` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=988;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
