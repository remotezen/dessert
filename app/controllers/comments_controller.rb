class CommentsController < ApplicationController
  before_action :logged_in_user 
  def new
  end
  
  def create
    @post = Post.find_by(id: params[:comment][:post_id])
    
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment Saved"
      redirect_to root_url
    else
      flash[:error] = "There was a problem saving your comment"
      redirect_to root_url
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def index
  end
  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment)
    end
end
