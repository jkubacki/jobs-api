module Seeds
  class AnyChanges < ApplicationService
    def call(expected_listings_count: 13, expected_applications_count: 4)
      Listing.count != expected_listings_count ||
        Application.count != expected_applications_count ||
        Listing.where("created_at != updated_at").any? ||
        Application.where("created_at != updated_at").any?
    end
  end
end
