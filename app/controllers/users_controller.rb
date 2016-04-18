class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path
      flash[:success] = "start thinking, #{current_user.email}"
    else
      redirect_to new_user_path
      flash[:error] = "email is already taken"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
