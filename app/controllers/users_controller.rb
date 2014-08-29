class UsersController < ApplicationController


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

    if @user.update(post_params)
      flash[:notice] = "Your Posts was Updated!!!"
      #redirect_to posts_path
      redirect_to post_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit!  # to do all
    #params.require(:user).permit(:username, :password)
  end


  end
