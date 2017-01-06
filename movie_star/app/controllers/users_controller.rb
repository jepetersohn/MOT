class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    p user_params
    @user = User.new(user_params)
    auth_key = params[:user][:trusted_reviewer]
    if @user.save
      session[:user_id] = @user.id
      current_user
      if auth_key != nil
        trusted_reviewer(auth_key)
      end
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :trusted_reviewer)
  end
end
