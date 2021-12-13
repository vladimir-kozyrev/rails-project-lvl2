# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :creator_id, :post_category_id)
  end
end
