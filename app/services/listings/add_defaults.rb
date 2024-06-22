module Listings
  class AddDefaults < ApplicationService
    def call(listing:) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/AbcSize
      listing.product = listing.product.presence || "Unknown"
      listing.glassdoor_url = listing.glassdoor_url.presence || build_glassdoor_url(listing.company)
      listing.compensation = listing.compensation.presence || "Unknown"
      listing.based_in = listing.based_in.presence || "USA"
      listing.timezones = listing.timezones.presence || listing.based_in.presence || "USA"
      listing.stack = listing.stack.presence || "Rails"
      listing
    end

    private

    def build_glassdoor_url(company)
      company_url_encoded = URI.encode_uri_component(company)
      "https://www.glassdoor.com/Search/results.htm?keyword=#{company_url_encoded}"
    end
  end
end
