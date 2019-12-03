require 'sinatra'

get '/' do
  'Hello World'
end

get '/health_check' do
  'ok'
end
