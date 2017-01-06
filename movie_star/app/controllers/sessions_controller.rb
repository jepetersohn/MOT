class SessionsController < ApplicationController

  def create
    @user = User.find_by(:username => params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_url
      else
        flash[:error] = "Email or password is invalid"
        render 'new'
      end
  end


  def new

  end

  def destroy
    session[:user_id] = nil
    redirect_to :action => 'new'
  end

end


