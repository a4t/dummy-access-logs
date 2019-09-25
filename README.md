# dummy-access-logs

## Usage

```
$ make init
$ make build
$ mysql -h127.0.0.1 -uroot -plocaldocker -P23306 accesslog -e 'SHOW TABLES;'
mysql: [Warning] Using a password on the command line interface can be insecure.
+---------------------------------+
| Tables_in_accesslog             |
+---------------------------------+
| access_logs                     |
| response_status_calculated_logs |
| response_time_calculated_logs   |
+---------------------------------+
```
