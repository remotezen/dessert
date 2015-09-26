class HomePagesController < ApplicationController
	def index
		@post = Post.first					
    @comments = @post.comments 
    
    
	end
end
