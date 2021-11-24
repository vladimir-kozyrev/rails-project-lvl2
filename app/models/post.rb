# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :post_category
  belongs_to :user
end
