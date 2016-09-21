require 'sinatra'
require 'pg'

load "./local_env.rb" if File.exists?("./local_env.rb")


db_params = {
   host: ENV['db'],
   port:ENV['port'],
   dbname:ENV['dbname'],
   user:ENV['dbuser'],
   password:ENV['dbpassword'],    
}

db = PG::Connection.new(db_params)

get '/' do
    erb :index
end