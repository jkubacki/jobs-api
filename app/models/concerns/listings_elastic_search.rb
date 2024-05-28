require "active_support/concern"

module ListingsElasticSearch
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      {
        id:,
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
        preference:,
        applications_cover_letters: applications.map(&:cover_letter).join(" "),
        applications_notes: applications.map(&:notes).join(" "),
        rejected: Listings::Rejected.call(listing: self)
      }
    end
  end
end
