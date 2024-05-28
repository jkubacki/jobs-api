module Applications
  class Rejected < ApplicationService
    def call(application:)
      application.replies.any?(&:rejected?)
    end
  end
end
