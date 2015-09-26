class PostsController < ApplicationController	
	before_action :logged_in_user
	before_action  :is_admin
  def index
    @posts = Post.paginate(page: params[:page])
  end
	
	def new
		@post = Post.new
	end
	def create
		@post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
		end
	end

  def show
    @post = Post.friendly.find(params[:id])
    end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      flash[:success] = "Post Updated"
      redirect_to @post 
    else
      render 'edit'
    end
  end

  def destroy 
    Post.find(params[:id]).destroy
    flash[:success] = "Post has been delete"
    redirect_to posts_url
  end
	private
		def post_params
			params.require(:post).permit(:content, :picture, :title)
		end
end
