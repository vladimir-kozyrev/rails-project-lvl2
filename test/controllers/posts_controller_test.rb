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
    post_category = post_categories(:one)
    attrs = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs.join("\n"),
      post_category_id: post_category.id
    }
    assert_difference('Post.count', +1) do
      post posts_path, params: { post: attrs }
    end
    assert_response :redirect

    post = Post.find_by(attrs)
    assert { post }
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
