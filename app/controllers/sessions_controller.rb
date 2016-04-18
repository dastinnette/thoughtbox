class SessionsController < ApplicationController

  def new
  end

  def create
  user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to links_path
      flash[:success] = "start thinking, #{current_user.email}"
    else
      redirect_to login_path
      flash[:error] = "invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
