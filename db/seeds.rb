# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts_list = [
["Mickey Mouse", "https://i.imgflip.com/23d0p5.jpg", "mickey, mouse, disney, fox, star wars"],
["Willy Wonka", "https://www.dailydot.com/wp-content/uploads/e0d/d9/6bd83b6a28b3bf7da31d10f6f4fe2e2c.jpg", "willy, wonka, chocolate, great"],
["Aliens?", "https://steemitimages.com/0x0/http://cnnphilippines.com/incoming/zgzt53-aliens.jpg/ALTERNATES/FREE_720/aliens.jpg", "aliens, very, are, stupid, history, channel"],
["Old Sport", "https://www.lifewire.com/thmb/7pE__VIDaYq0OrolEZ3TBSAusbY=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/dicaprio3-583e33155f9b58d5b19e3a00.jpg", "old, sport, great, gatsby, movie"]
]

sample_tags_list = "back, future, doc, marty, mcfly"

posts_list.each do |title, img, tags|
	Post.create(title: title, img: img, all_tags: tags)
end

50.times do |index|
	Post.create!(title: Faker::BackToTheFuture.quote, img: "https://i.imgflip.com/jntjw.jpg", all_tags: sample_tags_list)
end