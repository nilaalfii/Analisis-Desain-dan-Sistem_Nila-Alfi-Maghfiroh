-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 12:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- 
-- Database: `perpustakaan`
--

CREATE DATABASE IF NOT EXISTS `perpustakaan`;
USE `perpustakaan`;

-- --------------------------------------------------------

-- 
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` INT(11) NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(255) NOT NULL,
  `alamat` TEXT NOT NULL,
  `no_telepon` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `tanggal_daftar` DATE NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` INT(11) NOT NULL AUTO_INCREMENT,
  `judul_buku` VARCHAR(255) NOT NULL,
  `pengarang` VARCHAR(255) NOT NULL,
  `penerbit` VARCHAR(255) NOT NULL,
  `tahun_terbit` YEAR(4) NOT NULL,
  `kategori` VARCHAR(100) NOT NULL,
  `jumlah_buku` INT(11) NOT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` INT(11) NOT NULL AUTO_INCREMENT,
  `id_anggota` INT(11) NOT NULL,
  `id_buku` INT(11) NOT NULL,
  `tanggal_pinjam` DATE NOT NULL,
  `tanggal_kembali` DATE,
  `status_peminjaman` ENUM('dipinjam', 'dikembalikan') DEFAULT 'dipinjam',
  `denda` DECIMAL(10, 2) DEFAULT 0.00,
  PRIMARY KEY (`id_peminjaman`),
  FOREIGN KEY (`id_anggota`) REFERENCES `anggota`(`id_anggota`) ON DELETE CASCADE,
  FOREIGN KEY (`id_buku`) REFERENCES `buku`(`id_buku`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` INT(11) NOT NULL AUTO_INCREMENT,
  `id_peminjaman` INT(11) NOT NULL,
  `tanggal_kembali` DATE NOT NULL,
  `status` ENUM('tepat waktu', 'terlambat') DEFAULT 'tepat waktu',
  `denda` DECIMAL(10, 2) DEFAULT 0.00,
  PRIMARY KEY (`id_pengembalian`),
  FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman`(`id_peminjaman`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` INT(11) NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(255) NOT NULL,
  `no_telepon` VARCHAR(15) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
