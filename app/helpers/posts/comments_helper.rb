# frozen_string_literal: true

module Posts
  module CommentsHelper
    def nested_comments(comments)
      return if comments.nil?

      nested_comments = comments.map do |comment|
        render(partial: 'posts/comments/comment', locals: { comment: comment }) +
          content_tag(:div, nested_comments(comment.children), class: 'nested_comments')
      end
      safe_join(nested_comments)
    end
  end
end
