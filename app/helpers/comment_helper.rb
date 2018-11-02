module CommentHelper
	def user_ownes_comment?(comment)
		return current_user == comment.user 
	end
end
