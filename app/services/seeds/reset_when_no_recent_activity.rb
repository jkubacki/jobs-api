module Seeds
  class ResetWhenNoRecentActivity < ApplicationService
    def call
      if inactive?
        Seeds::Reset.call
        Success(true)
      else
        Success(false)
      end
    end

    private

    def inactive?
      Listing.where(updated_at: 10.minutes.ago..Time.current).empty? &&
        Application.where(updated_at: 10.minutes.ago..Time.current).empty?
    end
  end
end
