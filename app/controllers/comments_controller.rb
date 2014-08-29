class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
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

end
