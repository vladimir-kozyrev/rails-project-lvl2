# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :resource_post, only: :create

  # POST /posts/:post_id/comments
  def create
    comment = @resource_post.comments.build(comment_params)
    if comment.save
      redirect_to post_path(@resource_post), notice: 'Comment was successfully created.'
    else
      render post_path(@resource_post)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
