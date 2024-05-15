module Listings
  module Search
    class Perform < ApplicationService
      PER_PAGE = 10

      def call(query:, page:, remote:)
        query ||= "*"
        page ||= 1
        where = {}
        where = where.merge(remote_filter(remote))

        search = Listing.search(query || "*", page: page || 1, per_page: PER_PAGE, where:).execute
        Success(search)
      rescue Elastic::Transport::Transport::Error => e
        Failure(e)
      end

      private

      def remote_filter(remote)
        return {} if remote.blank?

        { remote: remote == "true" }
      end
    end
  end
end
