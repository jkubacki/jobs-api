module Seeds
  class NoRecentActivity < ApplicationService
    def call(since:)
      Listing.where(updated_at: since..Time.current).empty? &&
        Application.where(updated_at: since..Time.current).empty?
    end
  end
end
