module Listings
  module Search
    class Perform < ApplicationService
      def call(query:, page:, remote:, rejected:, per_page: 10)
        query = query.presence || "*"
        page ||= 1
        where = {}
        where = where.merge(remote_filter(remote))
        where = where.merge(rejected_filter(rejected))

        search = Listing.search(query, page:, per_page:, where:, order: { id: :desc }).includes(applications: :replies)
        search.total_count # Eager load to handle errors. #execute prints a warning.
        Success(search)
      rescue Elastic::Transport::Transport::Error => e
        Failure(e)
      end

      private

      def remote_filter(remote)
        return {} if remote.blank?

        { remote: remote == "true" }
      end

      def rejected_filter(rejected)
        return { rejected: false } if rejected.blank?

        {}
      end
    end
  end
end
