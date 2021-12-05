class PostComment < ApplicationRecord
  validates :content, presence: true
end
