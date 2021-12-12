# frozen_string_literal: true

module Posts
  module LikesHelper
    def user_liked_this_post?(post_id)
      current_user.likes.where(post_id: post_id).any?
    end
  end
end
