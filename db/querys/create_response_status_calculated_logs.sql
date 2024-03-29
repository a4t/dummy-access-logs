CREATE TABLE `response_status_calculated_logs` (
  `path_group` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `req_count` int(11) NOT NULL,
  `req_success_count` int(11) NOT NULL,
  `availability` float NOT NULL,
  `res_time_avg` float NOT NULL,
  `size_avg` float NOT NULL,
  UNIQUE KEY `path_group` (`path_group`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
