# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  PostCategory.create(
    name: Faker::Emotion.unique.noun
  )
end

user = User.create(
  email: 'test@test.com',
  password: 'testtest123'
)

3.times do |index|
  post = Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    post_category_id: rand(1..5),
    creator_id: user.id
  )
  post.save

  next unless index.zero?

  comment1 = post.comments.build(content: 'comment 1', user_id: post.creator.id)
  comment1.save
  comment21 = post.comments.build(content: 'comment 21', parent: comment1, user_id: post.creator.id)
  comment21.save
  comment22 = post.comments.build(content: 'comment 22', parent: comment1, user_id: post.creator.id)
  comment22.save
  comment31 = post.comments.build(content: 'comment 31', parent: comment21, user_id: post.creator.id)
  comment31.save
end
