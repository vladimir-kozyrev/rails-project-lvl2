# frozen_string_literal: true

module Posts
  class LikesController < Posts::ApplicationController
    before_action :authenticate_user!, only: :create
    before_action :resource_post, only: :create

    def create
      like = @resource_post.likes.build(user_id: current_user.id)
      if helpers.user_liked_this_post?(params[:post_id])
        remove_likes_from_post(params[:post_id])
      else
        like.save
      end
      redirect_to @resource_post
    end

    private

    def remove_likes_from_post(post_id)
      current_user.likes.where(post_id: post_id).delete_all
    end
  end
end
