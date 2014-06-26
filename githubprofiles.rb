require 'sinatra'

get '/' do
  erb :index
end

get '/javascript/:name.js' do |name|
  coffee "coffee/#{name}".to_sym
end
