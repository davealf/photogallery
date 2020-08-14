class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  class MyJob
  include Sidekiq::Worker

  def perform(args)
    # block that will be retried in case of failure
  end
end

end
