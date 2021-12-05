# frozen_string_literal: true

class PostComment < ApplicationRecord
  validates :content, presence: true
end
