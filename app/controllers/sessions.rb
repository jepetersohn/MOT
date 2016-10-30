get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect '/entries'
    else
      @message = "Invalid username or password. Please try again."
      erb :"sessions/new"
    end

end

get '/sessions/logout' do
  session.delete(:user_id)
  redirect '/entries'
end