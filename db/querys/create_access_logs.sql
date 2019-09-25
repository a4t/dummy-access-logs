CREATE TABLE `access_logs` (
  `date` datetime NOT NULL,
  `method` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status_code` int(11) NOT NULL,
  `response_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
