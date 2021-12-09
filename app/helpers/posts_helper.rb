# frozen_string_literal: true

module PostsHelper
  def days_ago_since(created_at)
    time_now = Time.now
    creaton_on_date = Date.parse("#{created_at.day}/#{created_at.month}/#{created_at.year}")
    current_date = Date.parse("#{time_now.day}/#{time_now.month}/#{time_now.year}")
    current_date.mjd - creaton_on_date.mjd
  end
end
