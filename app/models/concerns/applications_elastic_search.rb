require "active_support/concern"

module ApplicationsElasticSearch
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data
      {
        id:,
        listing_id:,
        cv:,
        cover_letter:,
        notes:,
        preference:
      }
    end
  end
end
