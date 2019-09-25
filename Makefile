MYSQL_CONNECTION=mysql -p$${MYSQL_ROOT_PASSWORD}

init:
	docker-compose up -d mysql
	while true; do docker-compose exec mysql sh -c '${MYSQL_CONNECTION} $${MYSQL_DATABASE} -e "show databases;"' && break ; sleep 1; done
	docker-compose exec mysql sh -c '${MYSQL_CONNECTION} $${MYSQL_DATABASE} < /db/querys/create_access_logs.sql'
	docker-compose exec mysql sh -c '${MYSQL_CONNECTION} $${MYSQL_DATABASE} < /db/querys/create_response_status_calculated_logs.sql'
	docker-compose exec mysql sh -c '${MYSQL_CONNECTION} $${MYSQL_DATABASE} < /db/querys/create_response_time_calculated_logs.sql'

build:
	docker-compose build app
	docker-compose run app ruby /app/response_status.rb
	docker-compose run app ruby /app/response_time.rb
	docker-compose run app ruby /app/access_log.rb

clean:
	docker-compose down
