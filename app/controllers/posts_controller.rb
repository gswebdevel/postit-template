class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show] # to resc
  #1. for set up of instance variable in action
  #2. for redirect based on some condition like not authenticated

  def index
    @posts = Post.all.sort_by { |x| x.total_votes }.reverse
  end

  def show

    @comment = Comment.new

    #  for api
    respond_to do |format|
      format.html # just do normal
      format.json do
        render json: @post
        # this calls and returns @post.to_json
        # check it out with http://localhost:3000/posts/testte.json
      end
      format.xml do
        render xml: @post
      end
    end
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
    @post = Post.find_by(slug: params[:id])
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

  # not normal CRUD but normal request response
  # def vote
  #   @vote = Vote.create(voteable: set_post, user: current_user, vote: params[:vote])
  #   if @vote.valid?
  #     flash[:notice] = "Your vote was counted"
  #   elsif
  #   flash[:error] = "Vote error, you may only vote one time"
  #   end
  #   redirect_to :back
  # end

  # via ajax
  def vote

    @vote = Vote.create(voteable: set_post, user: current_user, vote: params[:vote])
    respond_to do |format|
      format.html {
        if @vote.valid?
          flash[:notice] = "Your vote was counted"
        elsif flash[:error] = "Vote error, you may only vote one time"
        end
        redirect_to :back }
      format.js {

      }
    end
  end

# private methods next
  
  private

  def post_params
    params.require(:post).permit! # to do all
    #params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find_by(slug: params[:id])

  end

end
