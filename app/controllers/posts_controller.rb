class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		#render plain: params[:post].inspect
		@post = Post.new(post_params)

		#calling method to save into db table
		@post.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		#this will redirect to the root_path which is set as path to posts#index
		redirect_to root_path 
	end

	private def post_params
		params.require(:post).permit(:title, :img)
	end
end
