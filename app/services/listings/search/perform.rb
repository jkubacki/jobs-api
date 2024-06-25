module Listings
  module Search
    class Perform < ApplicationService
      def call(query:, page:, remote:, status:, per_page: 10) # rubocop:disable Metrics/MethodLength
        query = query.presence || "*"
        page ||= 1
        where = {}
        where = where.merge(remote_filter(remote))
        where = where.merge(status_filter(status))

        search = Listing.search(
          query,
          page:,
          per_page:,
          where:,
          order: { updated_at: :desc }
        ).includes(applications: :replies)
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

      def status_filter(status)
        return {} if status.blank?

        { status: }
      end
    end
  end
end
