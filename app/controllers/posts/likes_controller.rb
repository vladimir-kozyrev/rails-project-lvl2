# frozen_string_literal: true

module Posts
  class LikesController < Posts::ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    before_action :post, only: %i[create destroy]
    before_action :set_like, only: :destroy

    def create
      like = @post.likes.build(user_id: current_user.id)
      like.save
      redirect_to @post
    end

    def destroy
      @like.destroy
      redirect_to @post
    end

    private

    def set_like
      @like = PostLike.find(params[:id])
    end

    def remove_likes_from_post(post_id)
      current_user.likes.where(post_id: post_id).delete_all
    end
  end
end
