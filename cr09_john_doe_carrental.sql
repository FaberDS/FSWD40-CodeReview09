-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2018 at 02:45 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cr09_denis_schuele_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_expense`
--

CREATE TABLE `add_expense` (
  `add_expense_id` int(11) NOT NULL,
  `add_on_price` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_expense`
--

INSERT INTO `add_expense` (`add_expense_id`, `add_on_price`, `type`) VALUES
(1, 50, 'empty Tank'),
(2, 180, 'realy dirty'),
(3, 5000, 'a lot of scratches'),
(4, 30000, 'total Damage');

-- --------------------------------------------------------

--
-- Table structure for table `add_invoice`
--

CREATE TABLE `add_invoice` (
  `add_invoice_id` int(11) NOT NULL,
  `fk_add_expense_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_invoice`
--

INSERT INTO `add_invoice` (`add_invoice_id`, `fk_add_expense_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_license_id` int(11) DEFAULT NULL,
  `fk_customer_address_id` int(11) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `second_name` varchar(25) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `nationality` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_license_id`, `fk_customer_address_id`, `first_name`, `second_name`, `birth_date`, `nationality`) VALUES
(7, 1, 0, 'Fritz', 'Walter', '1992-01-03', 'German'),
(8, 2, 6, 'Sabie', 'Dettenw', '1984-02-05', 'GB'),
(9, 3, 5, 'Rüdiger', 'Eberling', '1975-02-02', 'France'),
(10, 4, 7, 'Erdoan', 'Ceylen', '1962-09-30', 'German'),
(11, 5, 8, 'Jochen', 'Harrich', '1971-09-29', 'Austria'),
(12, 6, 10, 'Philip', 'Lang', '1985-04-09', 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_address_id` int(11) NOT NULL,
  `zip` mediumint(9) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_address_id`, `zip`, `city`, `street`, `country`) VALUES
(0, 86234, 'Karlsbrun', 'Kaiser 345', 'Germany'),
(1, 8624, 'Thörl', 'Wiesengasse 181', 'Austria'),
(2, 8625, 'Turnau', 'Göriach 10', 'Austria'),
(3, 86000, 'Mutterstadt', 'Raistrasse 3', 'Germany'),
(4, 86244, 'Tegernseer', 'Freut 5', 'Germany'),
(5, 6634, 'Bergun', 'Weg 5', 'Switzerland'),
(6, 5622, 'Ascona', 'Largostraße 122', 'Switzerland'),
(7, 44556, 'Koblenz', 'Sackgasse 5', 'Germany'),
(8, 1010, 'Wien', 'Wilstrasse 9', 'Austria'),
(9, 86564, 'Sevilla', 'Via Albarelle 33', 'Spain'),
(10, 48624, 'Malaga', 'Sun Street 5', 'Spain');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `second_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `second_name`) VALUES
(1, 'Otto', 'Eberhart'),
(2, 'Werner', 'Fischer'),
(3, 'Karlheinz', 'Winkler'),
(4, 'Rudi', 'Wimmer');

-- --------------------------------------------------------

--
-- Table structure for table `final_location`
--

CREATE TABLE `final_location` (
  `final_location_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `final_location`
--

INSERT INTO `final_location` (`final_location_id`, `fk_location_id`) VALUES
(3, 1),
(2, 2),
(4, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `final_status`
--

CREATE TABLE `final_status` (
  `final_status_id` int(11) NOT NULL,
  `fk_vehicle_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `final_status`
--

INSERT INTO `final_status` (`final_status_id`, `fk_vehicle_status_id`) VALUES
(4, 1),
(6, 1),
(3, 4),
(5, 4),
(1, 5),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `insurance_price_per_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `insurance_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `insurance_price_per_day`, `insurance_name`) VALUES
(1, 15, 'Minimal Safetypaket'),
(2, 25, 'Medium Safepaket'),
(3, 45, 'fully comprehensive insur'),
(4, 65, 'Safetypaket DELUXE');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_add_invoice_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `payment_option` enum('Credit Card','Cash') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_add_invoice_id`, `price`, `invoice_date`, `payment_option`) VALUES
(1, 1, 500, '2018-03-05', 'Credit Card'),
(2, 2, 890, '2018-06-14', 'Cash'),
(3, 4, 100, '2018-06-03', 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `license_id` int(11) NOT NULL,
  `photo` char(1) DEFAULT NULL,
  `license_type` enum('A','B','A, B') DEFAULT NULL,
  `from_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`license_id`, `photo`, `license_type`, `from_date`) VALUES
(1, 'i', 'A', '2001-09-12'),
(2, 'b', 'B', '2007-02-01'),
(3, 'c', 'A', '2015-04-16'),
(4, 'd', 'A', '2016-06-22'),
(5, 'e', 'B', '2015-05-20'),
(6, 'f', 'A', '2015-12-15'),
(7, 'i', 'A, B', '2017-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_location_address` int(11) DEFAULT NULL,
  `location_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `fk_location_address`, `location_name`) VALUES
(1, 8, 'Vienna Airport Pick-Up St'),
(2, 10, 'Malaga Airport Pick-Up St'),
(3, 1, 'Kufstein Train Pick-Up St');

-- --------------------------------------------------------

--
-- Table structure for table `location_address`
--

CREATE TABLE `location_address` (
  `location_address_id` int(11) NOT NULL,
  `zip` mediumint(9) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `street` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_address`
--

INSERT INTO `location_address` (`location_address_id`, `zip`, `city`, `street`, `country`) VALUES
(1, 9624, 'Kufstein', 'Jägerstrasse 5', 'Austria'),
(2, 8625, 'Turnau', 'Göriach 10', 'Austria'),
(3, 86000, 'Mutterstadt', 'Raistrasse 3', 'Germany'),
(4, 86244, 'Tegernseer', 'Freut 5', 'Germany'),
(5, 6634, 'Bergun', 'Weg 5', 'Switzerland'),
(6, 5622, 'Ascona', 'Largostraße 122', 'Switzerland'),
(7, 44556, 'Koblenz', 'Sackgasse 5', 'Germany'),
(8, 1010, 'Wien', 'Wilstrasse 9', 'Austria'),
(9, 86564, 'Sevilla', 'Via Albarelle 33', 'Spain'),
(10, 48624, 'Malaga', 'Sun Street 5', 'Spain'),
(11, 86234, 'Karlsbrun', 'Kaiser 345', 'Germany'),
(12, 8624, 'Thörl', 'Wiesengasse 181', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `rents`
--

CREATE TABLE `rents` (
  `rents_id` int(11) NOT NULL,
  `fk_vehicle_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rents`
--

INSERT INTO `rents` (`rents_id`, `fk_vehicle_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_rents_id` int(11) DEFAULT NULL,
  `fk_insurance_id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_invoice_id`, `fk_rents_id`, `fk_insurance_id`, `reservation_date`, `from_date`, `to_date`, `fk_customer_id`) VALUES
(1, 2, 1, 3, '2018-03-01', '2018-06-13', '2018-06-16', 10),
(2, 1, 4, 2, '2017-08-14', '2018-04-17', '2018-06-06', 9),
(3, 3, 3, 1, '2017-10-17', '2018-02-14', '2018-03-14', 7),
(4, 1, 4, 4, '2017-05-09', '2017-10-17', '2017-11-17', 12),
(5, 3, 2, 1, '2017-06-05', '2017-07-05', '2017-08-05', 8),
(6, 1, 1, 1, '2017-01-05', '2017-04-05', '2017-04-15', 11);

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `start_location_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`start_location_id`, `fk_location_id`) VALUES
(4, 1),
(2, 2),
(1, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `start_status`
--

CREATE TABLE `start_status` (
  `start_status_id` int(11) NOT NULL,
  `fk_vehicle_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_status`
--

INSERT INTO `start_status` (`start_status_id`, `fk_vehicle_status_id`) VALUES
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(12, 1),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `fk_vehicle_details_id` int(11) DEFAULT NULL,
  `fk_start_status_id` int(11) DEFAULT NULL,
  `fk_final_status_id` int(11) DEFAULT NULL,
  `fk_start_location_id` int(11) DEFAULT NULL,
  `fk_final_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `fk_vehicle_details_id`, `fk_start_status_id`, `fk_final_status_id`, `fk_start_location_id`, `fk_final_location_id`) VALUES
(1, 2, 5, 1, 3, 2),
(2, 3, 6, 3, 3, 4),
(3, 7, 6, 3, 3, 3),
(4, 6, 7, 3, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `vehicle_details_id` int(11) NOT NULL,
  `fuel_type` enum('Diesel','Petrol') DEFAULT NULL,
  `registration` date DEFAULT NULL,
  `aircondition` enum('YES','NO') DEFAULT NULL,
  `vehicle_type` enum('SUV','Cabrio','Van','Bus','Motorbycicle','Limousine') DEFAULT NULL,
  `color` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_details`
--

INSERT INTO `vehicle_details` (`vehicle_details_id`, `fuel_type`, `registration`, `aircondition`, `vehicle_type`, `color`) VALUES
(1, 'Petrol', '0000-00-00', 'YES', 'SUV', 'blue'),
(2, 'Diesel', '0000-00-00', 'YES', 'SUV', 'blue'),
(3, 'Diesel', '0000-00-00', 'YES', 'Cabrio', 'white'),
(4, 'Diesel', '0000-00-00', 'YES', 'Van', 'grey metalic'),
(5, 'Petrol', '0000-00-00', 'NO', 'Cabrio', 'cyan'),
(6, 'Petrol', '0000-00-00', 'NO', 'Bus', 'green'),
(7, 'Petrol', '0000-00-00', 'NO', 'Motorbycicle', 'orange');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_status`
--

CREATE TABLE `vehicle_status` (
  `vehicle_status_id` int(11) NOT NULL,
  `body` varchar(25) DEFAULT NULL,
  `ties` enum('new','bit used','used','done') DEFAULT NULL,
  `fuel_level` enum('full','almost full','medium','almost empty','empty') DEFAULT NULL,
  `inside` enum('no issues','any issues','a lot issues') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle_status`
--

INSERT INTO `vehicle_status` (`vehicle_status_id`, `body`, `ties`, `fuel_level`, `inside`) VALUES
(1, 'all fine', 'new', 'full', 'no issues'),
(2, 'all fine', 'new', 'medium', ''),
(3, 'one scratch', 'bit used', 'almost empty', 'any issues'),
(4, 'dirty', 'used', 'full', 'any issues'),
(5, 'a lot of scratches', 'done', 'empty', 'a lot issues');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_expense`
--
ALTER TABLE `add_expense`
  ADD PRIMARY KEY (`add_expense_id`);

--
-- Indexes for table `add_invoice`
--
ALTER TABLE `add_invoice`
  ADD PRIMARY KEY (`add_invoice_id`),
  ADD KEY `fk_add_expense_id` (`fk_add_expense_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_license_id` (`fk_license_id`),
  ADD KEY `fk_customer_address_id` (`fk_customer_address_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_address_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `final_location`
--
ALTER TABLE `final_location`
  ADD PRIMARY KEY (`final_location_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `final_status`
--
ALTER TABLE `final_status`
  ADD PRIMARY KEY (`final_status_id`),
  ADD KEY `fk_vehicle_status_id` (`fk_vehicle_status_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_add_invoice_id` (`fk_add_invoice_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`license_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_location_address` (`fk_location_address`);

--
-- Indexes for table `location_address`
--
ALTER TABLE `location_address`
  ADD PRIMARY KEY (`location_address_id`);

--
-- Indexes for table `rents`
--
ALTER TABLE `rents`
  ADD PRIMARY KEY (`rents_id`),
  ADD KEY `fk_vehicle_id` (`fk_vehicle_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_insurance_id` (`fk_insurance_id`),
  ADD KEY `fk_rents_id` (`fk_rents_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_location_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `start_status`
--
ALTER TABLE `start_status`
  ADD PRIMARY KEY (`start_status_id`),
  ADD KEY `fk_vehicle_status_id` (`fk_vehicle_status_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `fk_vehicle_details_id` (`fk_vehicle_details_id`),
  ADD KEY `fk_start_status_id` (`fk_start_status_id`),
  ADD KEY `fk_final_status_id` (`fk_final_status_id`),
  ADD KEY `fk_start_location_id` (`fk_start_location_id`),
  ADD KEY `fk_final_location_id` (`fk_final_location_id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`vehicle_details_id`);

--
-- Indexes for table `vehicle_status`
--
ALTER TABLE `vehicle_status`
  ADD PRIMARY KEY (`vehicle_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_expense`
--
ALTER TABLE `add_expense`
  MODIFY `add_expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `add_invoice`
--
ALTER TABLE `add_invoice`
  MODIFY `add_invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `customer_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `final_location`
--
ALTER TABLE `final_location`
  MODIFY `final_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `final_status`
--
ALTER TABLE `final_status`
  MODIFY `final_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `license_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location_address`
--
ALTER TABLE `location_address`
  MODIFY `location_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rents`
--
ALTER TABLE `rents`
  MODIFY `rents_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `start_location`
--
ALTER TABLE `start_location`
  MODIFY `start_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `start_status`
--
ALTER TABLE `start_status`
  MODIFY `start_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  MODIFY `vehicle_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vehicle_status`
--
ALTER TABLE `vehicle_status`
  MODIFY `vehicle_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_invoice`
--
ALTER TABLE `add_invoice`
  ADD CONSTRAINT `add_invoice_ibfk_1` FOREIGN KEY (`fk_add_expense_id`) REFERENCES `add_expense` (`add_expense_id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `company_ibfk_4` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_license_id`) REFERENCES `license` (`license_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_customer_address_id`) REFERENCES `customer_address` (`customer_address_id`);

--
-- Constraints for table `final_location`
--
ALTER TABLE `final_location`
  ADD CONSTRAINT `final_location_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `final_status`
--
ALTER TABLE `final_status`
  ADD CONSTRAINT `final_status_ibfk_1` FOREIGN KEY (`fk_vehicle_status_id`) REFERENCES `vehicle_status` (`vehicle_status_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_add_invoice_id`) REFERENCES `add_invoice` (`add_invoice_id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_location_address`) REFERENCES `location_address` (`location_address_id`);

--
-- Constraints for table `rents`
--
ALTER TABLE `rents`
  ADD CONSTRAINT `rents_ibfk_1` FOREIGN KEY (`fk_vehicle_id`) REFERENCES `vehicle` (`vehicle_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_insurance_id`) REFERENCES `insurance` (`insurance_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_rents_id`) REFERENCES `rents` (`rents_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `start_status`
--
ALTER TABLE `start_status`
  ADD CONSTRAINT `start_status_ibfk_1` FOREIGN KEY (`fk_vehicle_status_id`) REFERENCES `vehicle_status` (`vehicle_status_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`fk_vehicle_details_id`) REFERENCES `vehicle_details` (`vehicle_details_id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`fk_start_status_id`) REFERENCES `start_status` (`start_status_id`),
  ADD CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`fk_final_status_id`) REFERENCES `final_status` (`final_status_id`),
  ADD CONSTRAINT `vehicle_ibfk_4` FOREIGN KEY (`fk_start_location_id`) REFERENCES `start_location` (`start_location_id`),
  ADD CONSTRAINT `vehicle_ibfk_5` FOREIGN KEY (`fk_final_location_id`) REFERENCES `final_location` (`final_location_id`);
