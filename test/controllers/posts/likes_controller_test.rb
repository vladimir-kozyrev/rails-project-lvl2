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
      get '/users/sign_in'
      sign_in users(:one)
      post user_session_url
      follow_redirect!
      assert_response :success
    end

    test 'should like post if it isn\'t already liked by user' do
      assert_difference('PostLike.count', +1) do
        post post_likes_path(@post.id), params: {
          post_like: {
            user_id: @user.id,
            post_id: @post.id
          }
        }
      end
    end

    test 'should destroy like if post is already liked by user' do
      assert_difference('PostLike.count', -1) do
        delete post_like_path(@like.post, @like)
        assert_redirected_to post_path(@like.post)
      end
    end
  end
end
