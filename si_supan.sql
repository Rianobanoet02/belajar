-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2024 at 09:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_supan`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int UNSIGNED NOT NULL,
  `kode_akun` varchar(50) NOT NULL,
  `uraian_akun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `kode_akun`, `uraian_akun`) VALUES
(1, '1', 'akun');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_urusan`
--

CREATE TABLE `bidang_urusan` (
  `id` int UNSIGNED NOT NULL,
  `id_urusan` int UNSIGNED NOT NULL,
  `kode_bidang_urusan` varchar(50) NOT NULL,
  `nama_bidang_urusan` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bidang_urusan`
--

INSERT INTO `bidang_urusan` (`id`, `id_urusan`, `kode_bidang_urusan`, `nama_bidang_urusan`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'bidang urusan', '2024-05-06 02:30:54', '2024-05-06 02:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `data_rekening`
--

CREATE TABLE `data_rekening` (
  `id` int UNSIGNED NOT NULL,
  `akun` int NOT NULL,
  `kelompok` varchar(10) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `objek` varchar(10) NOT NULL,
  `rincian_object` varchar(10) NOT NULL,
  `sub_rincian_objek` varchar(10) NOT NULL,
  `uraian_akun` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `detail2_penatausahaan`
--

CREATE TABLE `detail2_penatausahaan` (
  `id` int UNSIGNED NOT NULL,
  `id_penatausahaan` int UNSIGNED NOT NULL,
  `id_karyawan` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail2_penatausahaan`
--

INSERT INTO `detail2_penatausahaan` (`id`, `id_penatausahaan`, `id_karyawan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_dpa`
--

CREATE TABLE `detail_dpa` (
  `id` int UNSIGNED NOT NULL,
  `id_dpa` int UNSIGNED NOT NULL,
  `id_subkegiatan` int UNSIGNED NOT NULL,
  `id_rekening` int UNSIGNED NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `jumlah_perubahan` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail_dpa`
--

INSERT INTO `detail_dpa` (`id`, `id_dpa`, `id_subkegiatan`, `id_rekening`, `jumlah`, `jumlah_perubahan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '222222222', '', '2024-05-06 02:56:22', '2024-05-06 02:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `detail_dpa_subkegiatan`
--

CREATE TABLE `detail_dpa_subkegiatan` (
  `id` int UNSIGNED NOT NULL,
  `id_detail_dpa` int UNSIGNED NOT NULL,
  `uraian` varchar(255) NOT NULL,
  `koefisien` varchar(20) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `ppn` varchar(20) NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `keterangan` longtext NOT NULL,
  `koefisien_perubahan` varchar(20) NOT NULL,
  `satuan_perubahan` varchar(20) NOT NULL,
  `harga_perubahan` varchar(20) NOT NULL,
  `ppn_perubahan` varchar(20) NOT NULL,
  `jumlah_perubahan` varchar(20) NOT NULL,
  `keterangan_perubahan` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail_dpa_subkegiatan`
--

INSERT INTO `detail_dpa_subkegiatan` (`id`, `id_detail_dpa`, `uraian`, `koefisien`, `satuan`, `harga`, `ppn`, `jumlah`, `keterangan`, `koefisien_perubahan`, `satuan_perubahan`, `harga_perubahan`, `ppn_perubahan`, `jumlah_perubahan`, `keterangan_perubahan`, `created_at`, `updated_at`) VALUES
(1, 1, 'uraian', 'koefisien', 'laporan', '9000000', '10000', '8990000', 'keterangan', '', '', '', '', '', '', '2024-05-06 02:56:47', '2024-05-06 02:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penatausahaan`
--

CREATE TABLE `detail_penatausahaan` (
  `id` int UNSIGNED NOT NULL,
  `id_penatausahaan` int UNSIGNED NOT NULL,
  `id_detail_dpa` int UNSIGNED NOT NULL,
  `id_rekening` int UNSIGNED NOT NULL,
  `no_bk_umum` varchar(50) NOT NULL,
  `no_bk_pembantu` varchar(50) NOT NULL,
  `asli_123` varchar(50) NOT NULL,
  `sudah_terima_dari` varchar(50) NOT NULL,
  `uang_sebanyak` varchar(50) NOT NULL,
  `untuk_pembayaran` varchar(50) NOT NULL,
  `pajak_daerah` varchar(20) NOT NULL,
  `pph21` varchar(50) NOT NULL,
  `terbilang` varchar(100) NOT NULL,
  `status_kwitansi` varchar(2) NOT NULL,
  `status_verifikasi` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail_penatausahaan`
--

INSERT INTO `detail_penatausahaan` (`id`, `id_penatausahaan`, `id_detail_dpa`, `id_rekening`, `no_bk_umum`, `no_bk_pembantu`, `asli_123`, `sudah_terima_dari`, `uang_sebanyak`, `untuk_pembayaran`, `pajak_daerah`, `pph21`, `terbilang`, `status_kwitansi`, `status_verifikasi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'wss', 'sdsd', 'sdsd', 'sdsd', '22222222222222', 'sdsds', '1111', '111', 'dsdsdsdsds', '0', 'MENUNGGU', NULL, NULL),
(2, 1, 1, 1, '11', '11', '11', 'xszx', '2000000', 'sx', '10000', '1000', 'sdsss', '0', 'DITERIMA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_rakbelanja`
--

CREATE TABLE `detail_rakbelanja` (
  `id` int UNSIGNED NOT NULL,
  `id_rakbelanja` int UNSIGNED NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `nilai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `detail_rakbelanja`
--

INSERT INTO `detail_rakbelanja` (`id`, `id_rakbelanja`, `bulan`, `nilai`) VALUES
(1, 1, 'Februari', 111111111);

-- --------------------------------------------------------

--
-- Table structure for table `dpa`
--

CREATE TABLE `dpa` (
  `id` int UNSIGNED NOT NULL,
  `nomor_dpa` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dpa`
--

INSERT INTO `dpa` (`id`, `nomor_dpa`, `created_at`, `updated_at`) VALUES
(1, 'DPA.ajaja/1222', '2024-05-06 02:56:12', '2024-05-06 02:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` int UNSIGNED NOT NULL,
  `id_kelompok` int UNSIGNED NOT NULL,
  `kode_jenis` varchar(20) NOT NULL,
  `uraian_jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `id_kelompok`, `kode_jenis`, `uraian_jenis`) VALUES
(1, 1, '3', 'jenis');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int UNSIGNED NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `status_ttd` varchar(10) NOT NULL,
  `file` varchar(100) NOT NULL,
  `kategori_pegawai` varchar(100) NOT NULL,
  `norek` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `jabatan`, `nip`, `nama`, `status_ttd`, `file`, `kategori_pegawai`, `norek`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'sekretaris', '9999', 'Ratna Dewi', 'Tidak', '1714963767_6193c063073c87d067e9.png', 'PTT', '2222', 'sss', '2024-05-06 02:49:27', '2024-05-09 04:08:06'),
(2, 'Kepala Dinas', '2222222', 'siska', 'Ya', '1715227552_90fb2f410903764bac71.jpg', 'PTT', '33333333', 'ddd', '2024-05-09 04:05:52', '2024-05-09 04:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int UNSIGNED NOT NULL,
  `id_urusan` int UNSIGNED NOT NULL,
  `id_bidang_urusan` int UNSIGNED NOT NULL,
  `id_program` int UNSIGNED NOT NULL,
  `kode_kegiatan` varchar(50) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `id_urusan`, `id_bidang_urusan`, `id_program`, `kode_kegiatan`, `nama_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '4', 'kegiatan', '2024-05-06 02:40:06', '2024-05-06 02:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE `kelompok` (
  `id` int UNSIGNED NOT NULL,
  `id_akun` int UNSIGNED NOT NULL,
  `kode_kelompok` varchar(20) NOT NULL,
  `uraian_kelompok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kelompok`
--

INSERT INTO `kelompok` (`id`, `id_akun`, `kode_kelompok`, `uraian_kelompok`) VALUES
(1, 1, '2', 'kelompok');

-- --------------------------------------------------------

--
-- Table structure for table `keterangan_penatausahaan`
--

CREATE TABLE `keterangan_penatausahaan` (
  `id` int UNSIGNED NOT NULL,
  `id_detail_penatausahaan` int UNSIGNED NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `harga` int NOT NULL,
  `jumlah` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `keterangan_penatausahaan`
--

INSERT INTO `keterangan_penatausahaan` (`id`, `id_detail_penatausahaan`, `keperluan`, `harga`, `jumlah`) VALUES
(1, 1, 'sdsdsd', 11111111, 1111111);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(93, '2024-04-01-120235', 'App\\Database\\Migrations\\UserTable', 'default', 'App', 1714961998, 1),
(94, '2024-04-01-120336', 'App\\Database\\Migrations\\RolesTable', 'default', 'App', 1714961998, 1),
(95, '2024-04-11-115629', 'App\\Database\\Migrations\\KaryawanTable', 'default', 'App', 1714961998, 1),
(96, '2024-04-12-111340', 'App\\Database\\Migrations\\DataRekeningTable', 'default', 'App', 1714961998, 1),
(97, '2024-04-12-142759', 'App\\Database\\Migrations\\RakBelanja', 'default', 'App', 1714961998, 1),
(98, '2024-04-12-143248', 'App\\Database\\Migrations\\DetailRakBelanja', 'default', 'App', 1714961998, 1),
(99, '2024-04-16-090707', 'App\\Database\\Migrations\\AkunTable', 'default', 'App', 1714961998, 1),
(100, '2024-04-16-090721', 'App\\Database\\Migrations\\KelompokTable', 'default', 'App', 1714961998, 1),
(101, '2024-04-16-090730', 'App\\Database\\Migrations\\JenisTable', 'default', 'App', 1714961998, 1),
(102, '2024-04-16-090738', 'App\\Database\\Migrations\\ObjekTable', 'default', 'App', 1714961998, 1),
(103, '2024-04-16-090749', 'App\\Database\\Migrations\\RincianObjekTable', 'default', 'App', 1714961998, 1),
(104, '2024-04-16-090758', 'App\\Database\\Migrations\\SubRincianObjekTable', 'default', 'App', 1714961998, 1),
(105, '2024-04-21-153157', 'App\\Database\\Migrations\\UrusanTable', 'default', 'App', 1714961998, 1),
(106, '2024-04-21-153432', 'App\\Database\\Migrations\\BidangUrusanTable', 'default', 'App', 1714961998, 1),
(107, '2024-04-21-153705', 'App\\Database\\Migrations\\ProgramTable', 'default', 'App', 1714961998, 1),
(108, '2024-04-21-153755', 'App\\Database\\Migrations\\KegiatanTable', 'default', 'App', 1714961998, 1),
(109, '2024-04-21-153927', 'App\\Database\\Migrations\\SubkegiatanTable', 'default', 'App', 1714961998, 1),
(110, '2024-04-21-154543', 'App\\Database\\Migrations\\DPATable', 'default', 'App', 1714961998, 1),
(111, '2024-04-21-154902', 'App\\Database\\Migrations\\DetailDPATable', 'default', 'App', 1714961998, 1),
(112, '2024-04-21-155556', 'App\\Database\\Migrations\\DetailDPASubkegiatanTable', 'default', 'App', 1714961999, 1),
(113, '2024-04-21-170135', 'App\\Database\\Migrations\\PenatausahaanTable', 'default', 'App', 1714961999, 1),
(114, '2024-04-28-133123', 'App\\Database\\Migrations\\DetailPenataushaanTable', 'default', 'App', 1714961999, 1),
(115, '2024-04-28-133200', 'App\\Database\\Migrations\\KeteranganDPATable', 'default', 'App', 1714961999, 1),
(116, '2024-04-28-140447', 'App\\Database\\Migrations\\Detail2PenatausahaanTable', 'default', 'App', 1714961999, 1),
(117, '2024-05-05-112242', 'App\\Database\\Migrations\\VerifikasiTable', 'default', 'App', 1714961999, 1);

-- --------------------------------------------------------

--
-- Table structure for table `objek`
--

CREATE TABLE `objek` (
  `id` int UNSIGNED NOT NULL,
  `id_jenis` int UNSIGNED NOT NULL,
  `kode_objek` varchar(20) NOT NULL,
  `uraian_objek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `objek`
--

INSERT INTO `objek` (`id`, `id_jenis`, `kode_objek`, `uraian_objek`) VALUES
(1, 1, '9', 'objek');

-- --------------------------------------------------------

--
-- Table structure for table `penatausahaan`
--

CREATE TABLE `penatausahaan` (
  `id` int UNSIGNED NOT NULL,
  `link_google` varchar(200) NOT NULL,
  `karyawan_1` int UNSIGNED NOT NULL,
  `karyawan_2` int UNSIGNED NOT NULL,
  `karyawan_3` int UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `penatausahaan`
--

INSERT INTO `penatausahaan` (`id`, `link_google`, `karyawan_1`, `karyawan_2`, `karyawan_3`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, '2222222', 1, 1, 1, '2024-05-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int UNSIGNED NOT NULL,
  `id_urusan` int UNSIGNED NOT NULL,
  `id_bidang_urusan` int UNSIGNED NOT NULL,
  `kode_program` varchar(50) NOT NULL,
  `nama_program` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `id_urusan`, `id_bidang_urusan`, `kode_program`, `nama_program`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '3', 'program', '2024-05-06 02:31:04', '2024-05-06 02:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `rak_belanja`
--

CREATE TABLE `rak_belanja` (
  `id` int UNSIGNED NOT NULL,
  `nm_subkegiatan` varchar(100) NOT NULL,
  `id_rekening` int UNSIGNED NOT NULL,
  `nilai_rincian` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rak_belanja`
--

INSERT INTO `rak_belanja` (`id`, `nm_subkegiatan`, `id_rekening`, `nilai_rincian`) VALUES
(1, 'kjkkjk', 1, 32222);

-- --------------------------------------------------------

--
-- Table structure for table `rincian_objek`
--

CREATE TABLE `rincian_objek` (
  `id` int UNSIGNED NOT NULL,
  `id_objek` int UNSIGNED NOT NULL,
  `kode_rincian_objek` varchar(20) NOT NULL,
  `uraian_rincian_objek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rincian_objek`
--

INSERT INTO `rincian_objek` (`id`, `id_objek`, `kode_rincian_objek`, `uraian_rincian_objek`) VALUES
(1, 1, '3', 'rincian objek');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-05-06 02:20:07', '2024-05-06 02:20:07'),
(2, 'kasubbag', '2024-05-06 02:20:07', '2024-05-06 02:20:07'),
(3, 'staff', '2024-05-06 02:20:07', '2024-05-06 02:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `subkegiatan`
--

CREATE TABLE `subkegiatan` (
  `id` int UNSIGNED NOT NULL,
  `id_urusan` int UNSIGNED NOT NULL,
  `id_bidang_urusan` int UNSIGNED NOT NULL,
  `id_program` int UNSIGNED NOT NULL,
  `id_kegiatan` int UNSIGNED NOT NULL,
  `kode_subkegiatan` varchar(50) NOT NULL,
  `nomenklatur_urusan_provinsi` varchar(100) NOT NULL,
  `kinerja` longtext NOT NULL,
  `indikator` longtext NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `subkegiatan`
--

INSERT INTO `subkegiatan` (`id`, `id_urusan`, `id_bidang_urusan`, `id_program`, `id_kegiatan`, `kode_subkegiatan`, `nomenklatur_urusan_provinsi`, `kinerja`, `indikator`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '4', 'Nomenklatur Urusan Provinsi', 'sss', 'ssss', 'orang', '2024-05-06 02:40:25', '2024-05-06 02:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `sub_rincian_objek`
--

CREATE TABLE `sub_rincian_objek` (
  `id` int UNSIGNED NOT NULL,
  `id_akun` int UNSIGNED NOT NULL,
  `id_kelompok` int UNSIGNED NOT NULL,
  `id_jenis` int UNSIGNED NOT NULL,
  `id_objek` int UNSIGNED NOT NULL,
  `id_rincian_objek` int UNSIGNED NOT NULL,
  `kode_sub_rincian_objek` varchar(20) NOT NULL,
  `uraian_sub_rincian_objek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sub_rincian_objek`
--

INSERT INTO `sub_rincian_objek` (`id`, `id_akun`, `id_kelompok`, `id_jenis`, `id_objek`, `id_rincian_objek`, `kode_sub_rincian_objek`, `uraian_sub_rincian_objek`) VALUES
(1, 1, 1, 1, 1, 1, '3', 'sub rincian baru');

-- --------------------------------------------------------

--
-- Table structure for table `urusan`
--

CREATE TABLE `urusan` (
  `id` int UNSIGNED NOT NULL,
  `kode_urusan` varchar(50) NOT NULL,
  `nama_urusan` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `urusan`
--

INSERT INTO `urusan` (`id`, `kode_urusan`, `nama_urusan`, `created_at`, `updated_at`) VALUES
(1, '1', 'urusan', '2024-05-06 02:30:47', '2024-05-06 02:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `email`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '$2y$10$qS6F1p4hgZYggZIrpbr9zOcUw2RifycYv5BIccSl87Cyl0qLK9JDi', 'admin@example.com', 1, '2024-05-06 02:20:03', '2024-05-06 02:20:03'),
(2, 'kasubbag', 'kasubbag', '$2y$10$CtxhL7nfGPIuGnGURbxqR.lxnpogkqc3eca7c4OPpnpBxv3D6dUNu', 'kasubbag@gmail.com', 3, '2024-05-06 02:20:03', '2024-05-06 02:20:03'),
(3, 'staff', 'staff', '$2y$10$8gy8/23lSU2hC6O1gEkV/e.1n7SkFwI1dvoMAyLM9W/x/Xcox03Ee', 'staff@gmail.com', 4, '2024-05-06 02:20:03', '2024-05-06 02:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `verifikasi`
--

CREATE TABLE `verifikasi` (
  `id` int UNSIGNED NOT NULL,
  `id_detail_penatausahaan` int UNSIGNED NOT NULL,
  `nomor_bku` varchar(100) NOT NULL,
  `tanggal` varchar(30) NOT NULL,
  `uraian` varchar(255) NOT NULL,
  `nilai_spj` varchar(30) NOT NULL,
  `ppn` varchar(30) NOT NULL,
  `pph_psl_23` varchar(30) NOT NULL,
  `pph_psl_22` varchar(30) NOT NULL,
  `pph_psl_21` varchar(30) NOT NULL,
  `pajak_daerah` varchar(30) NOT NULL,
  `diterima` varchar(100) NOT NULL,
  `file_spj` varchar(100) NOT NULL,
  `file_kwitansi` varchar(100) NOT NULL,
  `status_bendahara` varchar(10) NOT NULL,
  `status_kasubbag` varchar(10) NOT NULL,
  `status_pptik` varchar(10) NOT NULL,
  `status_verifikator_keuangan` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `verifikasi`
--

INSERT INTO `verifikasi` (`id`, `id_detail_penatausahaan`, `nomor_bku`, `tanggal`, `uraian`, `nilai_spj`, `ppn`, `pph_psl_23`, `pph_psl_22`, `pph_psl_21`, `pajak_daerah`, `diterima`, `file_spj`, `file_kwitansi`, `status_bendahara`, `status_kasubbag`, `status_pptik`, `status_verifikator_keuangan`, `created_at`, `updated_at`) VALUES
(8, 1, 'sdsdsdsd', '2024-05-07', 's', 'ss', '4', '9', '9', '9', '1111111111111111111', '999', 'Edaran Zakat.pdf', 'Hukum Menzalimi Anak Yatim.pdf', 'DITOLAK', 'MENUNGGU', 'MENUNGGU', 'MENUNGGU', '2024-05-08 22:57:59', '2024-05-09 10:33:43'),
(9, 1, '14753321', '2013-02-15', 'tidak perlu diisi', '90000000', '4', '12', '3', '8', '6', '9000000', 'Edaran Zakat_1.pdf', 'Edaran Zakat.pdf', 'MENUNGGU', 'MENUNGGU', 'MENUNGGU', 'MENUNGGU', '2024-05-09 12:18:40', '2024-05-09 12:18:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidang_urusan`
--
ALTER TABLE `bidang_urusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rekening`
--
ALTER TABLE `data_rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail2_penatausahaan`
--
ALTER TABLE `detail2_penatausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_dpa`
--
ALTER TABLE `detail_dpa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_dpa_subkegiatan`
--
ALTER TABLE `detail_dpa_subkegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_penatausahaan`
--
ALTER TABLE `detail_penatausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_rakbelanja`
--
ALTER TABLE `detail_rakbelanja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dpa`
--
ALTER TABLE `dpa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keterangan_penatausahaan`
--
ALTER TABLE `keterangan_penatausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `objek`
--
ALTER TABLE `objek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penatausahaan`
--
ALTER TABLE `penatausahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rak_belanja`
--
ALTER TABLE `rak_belanja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rincian_objek`
--
ALTER TABLE `rincian_objek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subkegiatan`
--
ALTER TABLE `subkegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_rincian_objek`
--
ALTER TABLE `sub_rincian_objek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `urusan`
--
ALTER TABLE `urusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifikasi`
--
ALTER TABLE `verifikasi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bidang_urusan`
--
ALTER TABLE `bidang_urusan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_rekening`
--
ALTER TABLE `data_rekening`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail2_penatausahaan`
--
ALTER TABLE `detail2_penatausahaan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_dpa`
--
ALTER TABLE `detail_dpa`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_dpa_subkegiatan`
--
ALTER TABLE `detail_dpa_subkegiatan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_penatausahaan`
--
ALTER TABLE `detail_penatausahaan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_rakbelanja`
--
ALTER TABLE `detail_rakbelanja`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dpa`
--
ALTER TABLE `dpa`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `keterangan_penatausahaan`
--
ALTER TABLE `keterangan_penatausahaan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `objek`
--
ALTER TABLE `objek`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penatausahaan`
--
ALTER TABLE `penatausahaan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rak_belanja`
--
ALTER TABLE `rak_belanja`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rincian_objek`
--
ALTER TABLE `rincian_objek`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subkegiatan`
--
ALTER TABLE `subkegiatan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_rincian_objek`
--
ALTER TABLE `sub_rincian_objek`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `urusan`
--
ALTER TABLE `urusan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `verifikasi`
--
ALTER TABLE `verifikasi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
