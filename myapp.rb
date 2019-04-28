# myapp.rb
require 'sinatra'

get '/' do
  'Hello world!'
end

get '/about' do
  'A little about me.'
end

get '/hello/:name' do
  params[:name]
  "Hello there, #{params[:name]}."
  "Hello there #{params[:name].upcase}."
end

get '/hello/:name/:city' do
  "Hey there #{params[:name]} from #{params[:city]}."
end

get '/more/*' do
  params[:splat]
end

get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end

get '/secret' do
  erb :secret
end

not_found do
  status 404
  'not found'
end