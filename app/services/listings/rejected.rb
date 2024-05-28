module Listings
  class Rejected < ApplicationService
    def call(listing:)
      listing.applications.all? { |application| Applications::Rejected.call(application:) }
    end
  end
end
