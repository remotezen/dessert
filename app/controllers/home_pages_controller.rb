class HomePagesController < ApplicationController
	def index
		@post = Post.first					
	end
end
