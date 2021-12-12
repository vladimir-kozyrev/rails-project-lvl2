# frozen_string_literal: true

module CommentsHelper
  def nested_comments(comments)
    return if comments.nil?

    comments.map do |comment|
      render(partial: 'posts/comments/comment', locals: { comment: comment }) +
        content_tag(:div, nested_comments(comment.children), class: 'nested_comments')
    end.join.html_safe
  end
end
