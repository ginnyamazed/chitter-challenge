class MainController < ApplicationController

  def index;
    session[:user_id] = nil
  end
end
