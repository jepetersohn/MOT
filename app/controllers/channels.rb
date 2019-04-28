get '/channels' do
  @channels = Channel.all
  erb :index
end

get '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  erb :"channels/show"
end