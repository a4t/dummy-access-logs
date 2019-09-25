require 'bundler/setup'
require 'mysql2'

class Util
  def self.mysql_client
    client = Mysql2::Client.new(
      host: 'mysql',
      username: "root",
      password: 'localdocker',
      encoding: 'utf8',
      database: 'accesslog',
      port: 3306
    )
  end

  def self.path_list
    [
      '/api/v1/users',
      '/api/v1/users/1',
      '/api/v1/articles',
      '/api/v1/articles/1',
      '/api/v1/articles/1/comments',
      '/api/v1/articles/1/comments/1',
      '/api/v1/articles/1/comments/2',
    ]
  end

  def self.response_time
    response_time = Random.rand(10..50) ** 2
    response_time *= Random.rand(1..20) if Random.rand(1..10) == 1 # 1/10の確率で重いリクエスト
    response_time
  end

  def self.insert_values(hash)
    values = '('
    i = 0
    hash.each do |key, value|
      values += "'#{value}'"
      values += ', ' if i != hash.length - 1
      i += 1
    end
    values += ')'
    values
  end
end
