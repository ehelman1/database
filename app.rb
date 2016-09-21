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
    erb :index, :locals => {:message =>""}
end

post '/input' do
    first = params[:firstname]
    last = params[:lastname]
    phone = params[:phonenumber]
    street = params[:street]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    db.exec("INSERT INTO test (first, last, phone, street, city, state, zip)
        VALUES ('#{first}','#{last}','#{phone}','#{street}','#{city}','#{state}','#{zip}')")
    erb :index, :locals => {:message =>"Thank you for submitting your information."}
end

