class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    auth_key = params[:user][:trusted_reviewer]
    if auth_key != nil
        is_trusted_reviewer?(auth_key, @user)
    end
    if @user.save
      session[:user_id] = @user.id
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
