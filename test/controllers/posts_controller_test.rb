# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    # sign in to be able to do test actions
    sign_in users(:one)
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
    post_title = Faker::Lorem.sentence
    post_body = Faker::Lorem.paragraphs.join("\n")
    attrs = {
      title: post_title,
      body: post_body,
      post_category_id: post_category.id
    }
    post posts_path, params: { post: attrs }
    assert_response :redirect
    assert { Post.find_by(title: post_title) }
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
