# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @like = post_likes(:one)
      @user = users(:one)
      @post = posts(:two)
      # sign in to be able to do test actions
      sign_in users(:one)
    end

    test 'should like post if it isn\'t already liked by user' do
      post post_likes_path(@post.id), params: {
        post_like: {
          user_id: @user.id,
          post_id: @post.id
        }
      }
      assert { PostLike.find_by(user_id: @user.id, post_id: @post.id) }
    end

    test 'should destroy like if post is already liked by user' do
      assert_difference('PostLike.count', -1) do
        delete post_like_path(@like.post, @like)
        assert_redirected_to post_path(@like.post)
      end
    end
  end
end
