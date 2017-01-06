class SessionsController < ApplicationController

  def create
    p "HELLO WORLD!"
    @user = User.find_by(:username => params[:session][:username])
    @user
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Logged in!"
      else
        flash.now.alert = "Email or password is invalid"
        render 'new'
      end
  end


  def new

  end

  def destroy
    session[:user_id] = nil
    redirect_to :action => 'sessions#new'
  end

end


