require 'time'
require './util'

sql = 'INSERT INTO response_time_calculated_logs VALUES'
start_date = Date.parse('2019-01-01')
request_count = 100

i = 0
(start_date..Date.today).each do |date|
  Util.path_list.each do |path|
    path_group = path
    response_times = []
    request_count.times do |i|
      response_times.push(Util.response_time)
    end
    response_times.sort!

    values_hash = {
      'path_group': path_group,
      'date': date,
      'avg': response_times.inject(:+) / response_times.length,
      'max': response_times[request_count - 1],
      'min': response_times[0],
      'p90': response_times[request_count / 100 * 90 - 1],
      'p80': response_times[request_count / 100 * 80 - 1],
      'p50': response_times[request_count / 100 * 50 - 1],
      'p20': response_times[request_count / 100 * 20 - 1],
      'p10': response_times[request_count / 100 * 10 - 1]
    }
    values = Util.insert_values(values_hash)
    sql += i != 0 ? ',' : ''
    sql += values
    i += 1
  end
end

sql += ';'
Util.mysql_client.query(sql)
