# frozen_string_literal: true

module Posts
  class ApplicationController < ApplicationController
    def post
      @post ||= Post.find params[:post_id]
    end
  end
end
