# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
User.delete_all
Comment.delete_all

# Anonymous Posts

posts_list = [
["Mickey Mouse", "https://i.imgflip.com/23d0p5.jpg", "mickey, mouse, disney, fox, star wars"],
["Willy Wonka", "https://www.dailydot.com/wp-content/uploads/e0d/d9/6bd83b6a28b3bf7da31d10f6f4fe2e2c.jpg", "willy, wonka, chocolate, great"],
["Aliens?", "https://steemitimages.com/0x0/http://cnnphilippines.com/incoming/zgzt53-aliens.jpg/ALTERNATES/FREE_720/aliens.jpg", "aliens, very, are, stupid, history, channel"],
["Old Sport", "https://www.lifewire.com/thmb/7pE__VIDaYq0OrolEZ3TBSAusbY=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/dicaprio3-583e33155f9b58d5b19e3a00.jpg", "old, sport, great, gatsby, movie"]
]

sample_tags_list_back_to_future = "back, future, doc, marty, mcfly"
sample_tags_list_rick_and_morty = "rick, morty, swifty, plumbus, shleem, c-137"

posts_list.each do |title, img, tags|
	Post.create(title: title, img: img, all_tags: tags)
end

# Creating users for posts that are not anonymous
User.create(email: "something@something.com", password: "init123")
User.create(email: "chinmay@something.com", password: "init123")
User.create(email: "aneesha@something.com", password: "init123")
User.create(email: "navjot@something.com", password: "init123")
User.create(email: "fredrick@something.com", password: "init123")
User.create(email: "siljie@something.com", password: "init123")

# Non anonymous posts
Post.create!(title: Faker::BackToTheFuture.quote, img: "https://i.imgflip.com/jntjw.jpg", all_tags: sample_tags_list_back_to_future, user_id: 2)
Post.create!(title: Faker::BackToTheFuture.quote, img: "https://i.imgflip.com/jntjw.jpg", all_tags: sample_tags_list_back_to_future, user_id: 2)

8.times do |index|
	Post.create!(title: Faker::BackToTheFuture.quote, img: "https://i.imgflip.com/jntjw.jpg", all_tags: sample_tags_list_back_to_future, user_id: rand(1..6))
end


8.times do |index|
	Post.create!(title: Faker::RickAndMorty.quote, img: "https://i.imgflip.com/rpvvq.jpg", all_tags: sample_tags_list_rick_and_morty, user_id: rand(1..6))
end



# create comments
50.times do |index|
	Comment.create!(body: Faker::FamilyGuy.quote, commentable_id: rand(1..16), commentable_type: "Post", user_id: rand(1..6))
end

50.times do |index|
	Comment.create!(body: Faker::HarryPotter.quote, commentable_id: rand(1..16), commentable_type: "Post", user_id: rand(1..6))
end

# 100.times do |index|
# 	Comment.create!(body: Faker::HarryPotter.quote, commentable_id: rand(1..100), commentable_type: "Comment", user_id: rand(1..6))
# end
