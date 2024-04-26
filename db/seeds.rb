# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
PostTag.delete_all
Post.delete_all
User.delete_all
Tag.delete_all

users = [
  User.create!(
    name: "Amelia Barranco", 
    email: "abarranco@gmail.com",
    password: 'clave123'
  ),
  User.create!(
    name: "Saga Goni", 
    email: "sgoni@gmail.com", 
    password: 'flores15'
  ),
  User.create!(
    name: "Trinidad Infante", 
    email: "tinfante@gmail.com", 
    password: 'porch54'
  ),
  User.create!(
    name: "Mikaela Stambuk", 
    email: "mstambuk@gmail.com", 
    password: 'clave111'
  ),
  User.create!(
    name: "Dua Lipa", 
    email: "Dlipa@gmail.com", 
    password: 'pasto000'
  )
]

tags = [
  Tag.create!(name: "Sports"),
  Tag.create!(name: "Movies"),
  Tag.create!(name: "Music"),
  Tag.create!(name: "Dogs"),
  Tag.create!(name: "Travel")
]

posts = [
  Post.create!(title: "The Best Ski Athletes of 2023", content: "A detailed look at top athletes.", user: users[0], tags: [tags[0]], published_at: Time.zone.now),
  Post.create!(title: "Netflix Hits: Summer Reviews", content: "An overview of this summer's most watched movies.", user: users[1], tags: [tags[1]], published_at: Time.zone.now),
  Post.create!(title: "Exploring Pop Music", content: "Insights into the world of pop compositions.", user: users[2], tags: [tags[1]], published_at: Time.zone.now),
  Post.create!(title: "Why Dogs Make Great Pets", content: "Understanding the benefits of having a dog in your home.", user: users[3], tags: [tags[3]], published_at: Time.zone.now),
  Post.create!(title: "Top Travel Destinations for 2023", content: "Where to go this year for vacation with your friends or family.", user: users[4], tags: [tags[4]], published_at: Time.zone.now),
  Post.create!(title: "Fitness Routines for Athletes", content: "A guide to staying in shape.", user: users[0], tags: [tags[0]], published_at: Time.zone.now),
  Post.create!(title: "Sci-Fi Cinema and Technology", content: "How movies predict tech futures.", user: users[1], tags: [tags[1]], published_at: Time.zone.now),
  Post.create!(title: "Jazz Music", content: "A look at the influence of jazz.", user: users[2], tags: [tags[3]], published_at: Time.zone.now),
  Post.create!(title: "Training Your Dog", content: "Basic commands every dog should know.", user: users[3], tags: [tags[3]], published_at: Time.zone.now),
  Post.create!(title: "Budget Travel Tips", content: "How to travel well without spending too much.", user: users[4], tags: [tags[4]], published_at: Time.zone.now)
]

"""
posts.each_with_index do |post, index|
    post.tags << tags[index % tags.size]
end

tags.each_with_index do |tag, index|
    posts[index % posts.size].tags << tag unless posts[index % posts.size].tags.include?(tag)
end
"""
"""
posts.each do |post|
  post.tags << tags.sample
end
"""