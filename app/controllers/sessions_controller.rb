class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to quacks_path, notice: 'Logged in successfully'
    else
      flash[:alert] = 'Invalid email or password'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end