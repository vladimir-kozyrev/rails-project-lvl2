# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    # sign in to be able to do test actions
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    follow_redirect!
    assert_response :success
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: {
        post: {
          body: @post.body,
          title: @post.title,
          creator_id: @post.creator_id,
          post_category_id: @post.post_category_id
        }
      }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
