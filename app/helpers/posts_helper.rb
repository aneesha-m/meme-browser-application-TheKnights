module PostsHelper
	def tag_links(tags)
		tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 

	def user_ownes?(post)
		return current_user == post.user 
	end
end
