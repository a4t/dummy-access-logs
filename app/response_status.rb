require 'time'
require './util'

sql = 'INSERT INTO response_status_calculated_logs VALUES'
start_date = Date.today - 100

i = 0
(start_date..Date.today).each do |date|
  Util.path_list.each do |path|
    req_count = Random.rand(1000..10000)
    req_success_count = req_count - Random.rand(0..100)
    values_hash = {
      'path_group': path,
      'date': date,
      'req_count': req_count,
      'req_success_count': req_success_count,
      'availability': req_success_count.to_f / req_count * 100,
      'res_time_avg': Random.rand(50..5000).to_f / 1000,
      'size_avg': Random.rand(10000..1000000)
    }
    values = Util.insert_values(values_hash)
    sql += i != 0 ? ',' : ''
    sql += values
    i += 1
  end
end

sql += ';'
Util.mysql_client.query(sql)
