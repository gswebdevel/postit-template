class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show] # to resrict only if there is a user login
  #1. for set up of instance variable in action
  #2. for redirect based on some condition like not authenticated

  def index
    @posts = Post.all
  end

  def show

    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create

    @post = Post.new(post_params)
    #test_id =  rand(0..3).to_i
    #if test_id == nil
    #  test_id =1
    #end
    #@post.user = User.find_by id: test_id
    # above not needed any more
    @post.user = current_user
    if @post.save
      flash[:notice] = "Your Posts was Created!!!"
      redirect_to posts_path
    else
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update

    if @post.update(post_params)
      flash[:notice] = "Your Posts was Updated!!!"
      #redirect_to posts_path
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
     params.require(:post).permit!  # to do all
    #params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])

  end

end
