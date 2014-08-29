class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    # to get an array and then get first
    #user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # this data is save in browser cookie
      flash[:notice] = "You Logged in"
      redirect_to root_path

    else
      flash[:error] = "Problems with username or password"
      #redirect_to register_path -- this works too
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You Logged out"
    redirect_to root_path


  end
end
