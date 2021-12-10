# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = post_comments(:one)
    # sign in to be able to do test actions
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    follow_redirect!
    assert_response :success
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(@comment.post), params: {
        post_comment: {
          content: @comment.content,
          post_id: @comment.post_id
        }
      }
    end
  end
end
