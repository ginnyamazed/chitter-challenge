class SessionsController < ApplicationController

  def login; end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in Successfully'
    else
      flash 'Invalid email or password'
      render :login
    end
  end
end
