class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in Successfully'
    else
      flash[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    Current.user = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
