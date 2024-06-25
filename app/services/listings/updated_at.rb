module Listings
  class UpdatedAt < ApplicationService
    def call(listing:)
      records = [listing] + listing.applications + listing.applications.flat_map(&:replies)
      records.map(&:updated_at).max
    end
  end
end
