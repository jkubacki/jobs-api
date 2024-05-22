module Seeds
  class ResetWhenNoRecentActivity < ApplicationService
    def call(since:)
      if no_recent_activity?(since:) && any_changes?
        Seeds::Reset.call
        Success(true)
      else
        Success(false)
      end
    end

    private

    def no_recent_activity?(since:)
      Seeds::NoRecentActivity.call(since:)
    end

    def any_changes?
      Seeds::AnyChanges.call
    end
  end
end
