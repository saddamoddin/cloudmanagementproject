-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2022 at 06:06 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cloudmanagement`
--
CREATE DATABASE IF NOT EXISTS `cloudmanagement` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cloudmanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user register model', 7, 'add_userregistermodel'),
(26, 'Can change user register model', 7, 'change_userregistermodel'),
(27, 'Can delete user register model', 7, 'delete_userregistermodel'),
(28, 'Can view user register model', 7, 'view_userregistermodel'),
(29, 'Can add file upload model', 8, 'add_fileuploadmodel'),
(30, 'Can change file upload model', 8, 'change_fileuploadmodel'),
(31, 'Can delete file upload model', 8, 'delete_fileuploadmodel'),
(32, 'Can view file upload model', 8, 'view_fileuploadmodel'),
(33, 'Can add access control model', 9, 'add_accesscontrolmodel'),
(34, 'Can change access control model', 9, 'change_accesscontrolmodel'),
(35, 'Can delete access control model', 9, 'delete_accesscontrolmodel'),
(36, 'Can view access control model', 9, 'view_accesscontrolmodel'),
(37, 'Can add user request right model', 10, 'add_userrequestrightmodel'),
(38, 'Can change user request right model', 10, 'change_userrequestrightmodel'),
(39, 'Can delete user request right model', 10, 'delete_userrequestrightmodel'),
(40, 'Can view user request right model', 10, 'view_userrequestrightmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cloud_access_control`
--

CREATE TABLE IF NOT EXISTS `cloud_access_control` (
  `access_control_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_upload` varchar(120) NOT NULL,
  `user_download` varchar(120) NOT NULL,
  `user_update` varchar(120) NOT NULL,
  `posted_date` date NOT NULL,
  PRIMARY KEY (`access_control_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `cloud_access_control`
--

INSERT INTO `cloud_access_control` (`access_control_id`, `user_id`, `user_name`, `user_email`, `user_upload`, `user_download`, `user_update`, `posted_date`) VALUES
(8, 9, 'Abhi', 'Abhistone98@gmail.com', 'YES', 'YES', 'YES', '2022-05-16'),
(9, 10, 'saddamoddin', 'saddamoddin18@gmail.com', 'YES', 'YES', 'YES', '2022-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'userapp', 'accesscontrolmodel'),
(8, 'userapp', 'fileuploadmodel'),
(7, 'userapp', 'userregistermodel'),
(10, 'userapp', 'userrequestrightmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-14 11:25:37.502721'),
(2, 'auth', '0001_initial', '2022-05-14 11:25:38.230286'),
(3, 'admin', '0001_initial', '2022-05-14 11:25:38.390751'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-14 11:25:38.405700'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-14 11:25:38.421646'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-14 11:25:38.558191'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-14 11:25:38.634933'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-14 11:25:38.717657'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-14 11:25:38.730614'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-14 11:25:38.806360'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-14 11:25:38.811344'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-14 11:25:38.824300'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-14 11:25:38.900047'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-14 11:25:38.965826'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-14 11:25:39.040576'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-14 11:25:39.055527'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-14 11:25:39.129283'),
(18, 'sessions', '0001_initial', '2022-05-14 11:25:39.199046'),
(19, 'userapp', '0001_initial', '2022-05-14 11:26:53.973202'),
(20, 'userapp', '0002_userrequestrightmodel', '2022-05-14 13:00:32.115135'),
(21, 'userapp', '0003_remove_accesscontrolmodel_token_no_and_more', '2022-05-15 09:21:43.111243'),
(22, 'userapp', '0004_fileuploadmodel_user_name', '2022-05-15 12:56:31.568951'),
(23, 'userapp', '0005_alter_fileuploadmodel_file_and_more', '2022-05-16 07:04:20.984492');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1zy6wfh5hyngckcvo5oi8afzoiz18q6b', 'eyJ1c2VyX2lkIjo5fQ:1ns1CV:3KDiTlT8dVUMUror-qMHVTL9dhVahLrJeMR5UwN1ues', '2022-06-03 11:53:47.701813'),
('3bt0pu9ga130hof7t3snd4l36434voj8', 'eyJ1c2VyX2lkIjoxMH0:1o14Fd:J0VDOHlhJuI4gan9zFpQo_Y2nKuGzr5TDpgPkqoR7UE', '2022-06-28 10:58:25.415046'),
('4rbd968t58iffc4qkltp7uvxt7fhm6ee', 'eyJ1c2VyX2lkIjoxfQ:1nqOLG:vPRxe9psqxZesM7gAmIP5lQZjwNv7HINoBYCEWLm8oQ', '2022-05-30 00:12:06.574513'),
('67xxa0x2oiwogh97zgi7vtva6zob9aul', 'eyJ1c2VyX2lkIjo5fQ:1nvBom:h5AW4KTdz6mrtM4A4kYIeTEcN2y9ohPlwMYJbw61YGs', '2022-06-12 05:50:24.240734'),
('7gum7lpjixhpimdjrhchjwh11gy3s5fr', 'eyJ1c2VyX2lkIjoxMH0:1nuowG:5UygPGpHw3dtjUm29v1RvQUQMPnDByBIpbTSAJSYG1s', '2022-06-11 05:24:36.024078'),
('8k6r15vvui8zr0kmjsx6u30mrmzxbg0x', 'eyJ1c2VyX2lkIjo5fQ:1nu9nz:7wMSkh9VpK2FrhCMCuxq7oN94LtnangqnIunHvLzXOE', '2022-06-09 09:29:19.354757'),
('ad05l46hqdsypuvztbio8t1pju44yzhk', 'eyJ1c2VyX2lkIjo5fQ:1nxWFs:1LjgMQVzhHB7q0cCXuvtciIfQjF2wkWF43PC5mKz9Ns', '2022-06-18 16:04:00.542307'),
('f9or8qkcz95v5ejw2zo6osgo2mmtum1n', 'eyJ1c2VyX2lkIjo5fQ:1nrcEj:eFdmHUWx6kFc7d9LsqF2bAX6VZkDxNn8BN_oFR14gC0', '2022-06-02 09:14:25.060957'),
('feeg81z2ru1s7oe4ed0v6fvn0ctmgh57', 'eyJ1c2VyX2lkIjoxMH0:1nvCKI:ai2saH7f-mJupjijNtZe_5Nsy9giH0l3nE8v7b_ZMDA', '2022-06-12 06:22:58.268562'),
('i27znttl5xhbxe7zlhmwmxlsro06bdtc', 'eyJ1c2VyX2lkIjoxMH0:1nrYo2:xdjvY112PD3k6qVIkA2IXYxWPS08E8Zba6rqr0ek6C0', '2022-06-02 05:34:38.243699'),
('lmddyigklpspwv1joujrrfjpcx9mtl57', 'eyJ1c2VyX2lkIjo5fQ:1nupd7:D5Cmo3y17htBVrrM4OKSd0p88oEppQT8MFo74Y_s4iQ', '2022-06-11 06:08:53.506223'),
('nkeotv6nx67ey7cx2lv508884khzstlw', 'eyJ1c2VyX2lkIjoxLCJ1c2VyIjoyfQ:1nq91t:ngeGQEFGjhJz-nG1p7gNge720X-82vNNNG2ZsR6BIPY', '2022-05-29 07:51:05.535255'),
('ny4x0taq1zl9ur4el1qgp631jfbb9jqh', 'eyJ1c2VyX2lkIjoxMH0:1nurzL:c4zOKjYueOQCJ9O6V0zY643Ohb5NIqnaW0cxzItF3Ps', '2022-06-11 08:39:59.242702'),
('pm1hedm9jt9ybgnbk95zsp3hu2uhhjdm', 'eyJ1c2VyX2lkIjoxMH0:1nul98:WxTHAW0WPu_JYkIuU342IILQ0Lg7EVUCcKfrHvFtJAU', '2022-06-11 01:21:38.488170'),
('vu8rac4pxn68p51npapfn76o3w6lb9cc', 'eyJ1c2VyX2lkIjoxMCwidXNlciI6MTB9:1nqtqC:7aXMrkST2gIep0LplMr7Xl0K-0IUhZ2UUcMgQMBJ1Fc', '2022-05-31 09:50:08.356654'),
('y8giv0frvyh7h06yjo21lcpyw0cl7ivu', 'eyJ1c2VyX2lkIjoxMH0:1ntR3s:KUf4zBajLwu4dZ6RabgRRloHD6CqKofvcVnwAnbRH4A', '2022-06-07 09:42:44.481443');

-- --------------------------------------------------------

--
-- Table structure for table `file_details`
--

CREATE TABLE IF NOT EXISTS `file_details` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `file_type` varchar(300) NOT NULL,
  `file_uploded_date` date NOT NULL,
  `user_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `file_details`
--

INSERT INTO `file_details` (`file_id`, `user_id`, `file`, `file_name`, `file_size`, `file_type`, `file_uploded_date`, `user_name`) VALUES
(7, 10, 'files/test.txt', 'test.txt', 36, 'text/plain', '2022-05-16', 'saddamoddin'),
(8, 9, 'files/test.txt', 'saddam.txt', 39, 'text/plain', '2022-05-16', 'Abhi '),
(9, 9, 'files/popup.txt', 'popup.txt', 9090, 'text/plain', '2022-05-16', 'Abhi '),
(10, 10, 'files/saddam.txt.txt', 'saddam.txt.txt', 55, 'text/plain', '2022-05-19', 'saddamoddin'),
(11, 10, 'files/cloud-computing-technology-cartoon-characters-vector-23748874.jpg', 'cloud-computing-technology-cartoon-characters-vector-23748874.jpg', 80777, 'image/jpeg', '2022-05-20', 'saddamoddin'),
(12, 9, 'files/access-cloud-computing-service-animation-included-alpha-53768422.jpg', 'access-cloud-computing-service-animation-included-alpha-53768422.jpg', 30373, 'image/jpeg', '2022-05-20', 'Abhi '),
(13, 9, 'files/rm373-15.jpg', 'rm373-15.jpg', 3507342, 'image/jpeg', '2022-05-26', 'Abhi '),
(14, 9, 'files/amazon-aws-migration.jpg', 'amazon-aws-migration.jpg', 28525, 'image/jpeg', '2022-05-26', 'Abhi '),
(15, 10, 'files/21841.jpg', '21841.jpg', 2094399, 'image/jpeg', '2022-06-14', 'saddamoddin');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_contact` bigint(20) NOT NULL,
  `user_state` varchar(120) NOT NULL,
  `user_dob` date NOT NULL,
  `user_profile` varchar(100) DEFAULT NULL,
  `user_password` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `token_no` int(11) DEFAULT NULL,
  `reg_date` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `user_email`, `user_contact`, `user_state`, `user_dob`, `user_profile`, `user_password`, `status`, `otp`, `token_no`, `reg_date`) VALUES
(9, 'Abhi ', 'Abhistone98@gmail.com', 9573970379, 'Madhya Pradesh', '1999-04-18', 'images/face5_GWB60SM.jpg', 'Abhi@18', 'Accepted', 1982, 31595438, '2022-05-16'),
(10, 'saddamoddin', 'saddamoddin18@gmail.com', 9573970379, 'Andhra Pradesh', '1999-04-30', 'images/face8_ON0fHr1.jpg', 'Saddam@18', 'Accepted', 2279, 58586393, '2022-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_rights`
--

CREATE TABLE IF NOT EXISTS `user_request_rights` (
  `rights_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_request` varchar(120) NOT NULL,
  `status` varchar(50) NOT NULL,
  `posted_date` date NOT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`rights_request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `user_request_rights`
--

INSERT INTO `user_request_rights` (`rights_request_id`, `user_id`, `user_name`, `user_request`, `status`, `posted_date`, `user_email`) VALUES
(12, 10, 'saddamoddin', 'UPDATE', 'Accepted', '2022-05-16', 'saddamoddin18@gmail.com'),
(13, 9, 'Abhi ', 'UPDATE', 'Pending', '2022-05-16', 'Abhistone98@gmail.com'),
(14, 10, 'saddamoddin', 'DOWNLOAD', 'Pending', '2022-05-16', 'saddamoddin18@gmail.com'),
(15, 10, 'saddamoddin', 'DOWNLOAD', 'Pending', '2022-05-16', 'saddamoddin18@gmail.com'),
(16, 10, 'saddamoddin', 'DOWNLOAD', 'Pending', '2022-05-16', 'saddamoddin18@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
