class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id # this data is save in browser cookie

      flash[:notice] = "You are registered!!!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end


  def update


    if @user.update(user_params)
      flash[:notice] = "Your Profile was updated!!!"
      #redirect_to posts_path
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show

  end


  private

  def user_params
    params.require(:user).permit!  # to do all
    #params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You are not the correct user for this."
      redirect_to root_path
    end
  end

  end
