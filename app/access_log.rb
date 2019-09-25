require 'time'
require './util'

request_success_factor = 200
http_status_list = [404, 403, 503]
request_success_factor.times do |i| http_status_list.push(200) end
method_list = ['GET', 'POST', 'PUT', 'DELETE']

sql = 'INSERT INTO access_logs VALUES'
10000.times do |i|
  values_hash = {
    'date': Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    'method': method_list[Random.rand(0..method_list.length - 1)],
    'path': Util.path_list[Random.rand(0..Util.path_list.length - 1)],
    'status_code': http_status_list[Random.rand(0..http_status_list.length - 1)],
    'response_time': Util.response_time
  }
  values = Util.insert_values(values_hash)
  sql += ',' if i != 0
  sql += values
end
sql += ';'
Util.mysql_client.query(sql)
