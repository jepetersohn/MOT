get '/channels' do
  @channels = Channel.all
  erb :index
end