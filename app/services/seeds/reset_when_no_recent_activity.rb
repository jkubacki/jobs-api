module Seeds
  class ResetWhenNoRecentActivity < ApplicationService
    def call(since: 10.minutes.ago)
      if inactive?(since:)
        Seeds::Reset.call
        Success(true)
      else
        Success(false)
      end
    end

    private

    def inactive?(since:)
      Listing.where(updated_at: since..Time.current).empty? &&
        Application.where(updated_at: since..Time.current).empty?
    end
  end
end
