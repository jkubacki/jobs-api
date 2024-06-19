require "active_support/concern"

module ListingsElasticSearch
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data # rubocop:disable Metrics/MethodLength
      {
        id:,
        company:,
        url:,
        title:,
        based_in:,
        timezones:,
        stack:,
        pto:,
        remote:,
        rejected: Listings::Rejected.call(listing: self)
      }
    end
  end
end
