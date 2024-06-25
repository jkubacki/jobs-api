module Listings
  class Status < ApplicationService
    PENDING = "pending".freeze
    APPLIED = "applied".freeze
    REJECTED = "rejected".freeze
    IN_PROGRESS = "in_progress".freeze

    def call(listing:)
      applications = listing.applications

      return PENDING if applications.empty?
      return APPLIED if applications.all? { |application| application.replies.empty? }
      return REJECTED if applications.any? { |application| application.replies.any?(&:rejected?) }

      IN_PROGRESS
    end
  end
end
