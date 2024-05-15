module Listings
  module Search
    class Metadata < ApplicationService
      def call(search:)
        {
          total: search.total_count,
          page: search.current_page,
          from: search.offset_value,
          to: search.offset_value + search.limit_value
        }
      end
    end
  end
end
