# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  has_one :category, class_name: 'PostCategory'
end
