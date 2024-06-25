require "active_support/concern"

module ListingsElasticSearch
  extend ActiveSupport::Concern

  included do
    searchkick

    scope :search_import, -> { includes(applications: [:replies]) }

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
        rejected: Listings::Rejected.call(listing: self),
        status: Listings::Status.call(listing: self)
      }
    end
  end
end
