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
          user_id: @post.user_id,
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

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
