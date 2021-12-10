# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :category, class_name: 'PostCategory'
  belongs_to :user
  has_many :comments, class_name: 'PostComment', dependent: :destroy
end
