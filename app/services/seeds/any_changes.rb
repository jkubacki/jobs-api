module Seeds
  class AnyChanges < ApplicationService
    def call
      Listing.count != 13 ||
        Application.count != 4 ||
        Listing.where("created_at != updated_at").any? ||
        Application.where("created_at != updated_at").any?
    end
  end
end
