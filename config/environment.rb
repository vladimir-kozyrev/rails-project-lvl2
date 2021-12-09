# frozen_string_literal: true

# https://docs.rollbar.com/docs/rails
# rubocop:disable Style/ExpandPathArguments
# rubocop:disable Style/Lambda
# rubocop:disable Style/RescueStandardError
# rubocop:disable Lint/RescueException
# rubocop:disable Style/LambdaCall
require File.expand_path('../application', __FILE__)
require File.expand_path('../rollbar', __FILE__)

notify = ->(e) do
  begin
    Rollbar.with_config(use_async: false) do
      Rollbar.error(e)
    end
  rescue
    Rails.logger.error 'Synchronous Rollbar notification failed. Sending async to preserve info.'
    Rollbar.error(e)
  end
end

begin
  Rails.application.initialize!
rescue Exception => e
  notify.(e)
  raise
end
# rubocop:enable Style/ExpandPathArguments
# rubocop:enable Style/Lambda
# rubocop:enable Style/RescueStandardError
# rubocop:enable Lint/RescueException
# rubocop:enable Style/LambdaCall
