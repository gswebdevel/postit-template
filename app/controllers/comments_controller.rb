class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find_by_slug(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    # next 2 lines are compressed to the above line
    # @comment = Comments.new(params.require(:comment).permit(:body))
    # @comment.post = @post
    #@comment.user = User.first
    #test_id =  rand(0..3).to_i
    #if test_id == nil
    #  test_id =1
    #end
    #@comment.user = User.find_by id: test_id
    # above not needed any more

    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your Comment was Added!!!"
      # redirect_to post_path(@post)
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end


  # not normal CRUD
  def vote
    @one_comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @one_comment, user: current_user, vote: params[:vote])
    respond_to do |format|
      format.html {
        if @vote.valid?
          flash[:notice] = "Your vote was counted"
        elsif flash[:error] = "Vote error, you may only vote one time"
        end
        redirect_to :back }
      format.js {
        render 'posts/vote.js.erb'
      }
    end

  end
end
