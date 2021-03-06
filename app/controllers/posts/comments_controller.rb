# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create new]
    before_action :post, only: :create

    # GET /posts/:post_id/comments/new
    def new
      @comment = PostComment.new(post_id: params[:post_id], parent_id: params[:parent_id])
    end

    # POST /posts/:post_id/comments
    def create
      @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        render :new
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end

    def post
      @post ||= Post.find params[:post_id]
    end
  end
end
