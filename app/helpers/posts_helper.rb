module PostsHelper
	def user_ownes?(post)
		return current_user == post.user 
	end
end
