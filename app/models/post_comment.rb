# frozen_string_literal: true

class PostComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :post
  belongs_to :user
  has_ancestry
end
