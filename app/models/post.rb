class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	has_many :comments, as: :commentable

	acts_as_votable

	def all_tags=(names)
		# names can look like this "cute, animal, dog"
		self.tags = names.split(',').map do |name|
			Tag.where(name: name).first_or_create!
		end
	end

	def all_tags
		tags.map(&:name).join(", ")
	end

end
