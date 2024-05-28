module Listings
  class Rejected < ApplicationService
    def call(listing:)
      listing.applications.size.positive? && listing.applications.all? do |application|
        Applications::Rejected.call(application:)
      end
    end
  end
end
