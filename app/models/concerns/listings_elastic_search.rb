require "active_support/concern"

module ListingsElasticSearch
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data # rubocop:disable Metrics/MethodLength
      {
        company:,
        url:,
        title:,
        description:,
        product:,
        based_in:,
        timezones:,
        stack:,
        compensation:,
        pto:,
        remote:,
        glassdoor_url:,
        glassdoor_rating:,
        notes:,
        preference:
      }
    end
  end
end
