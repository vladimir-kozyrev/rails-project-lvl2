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

# 3.times do
#   post = Post.create(
#     title: Faker::Lorem.sentence,
#     body: Faker::Lorem.paragraph
#   )
#   3.times do
#     comment = post.comments.build(
#       body: Faker::Lorem.paragraph
#     )
#     comment.save
#   end
# end
