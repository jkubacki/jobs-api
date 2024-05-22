module Seeds
  class Reset < ApplicationService
    def call
      ActiveRecord::Base.transaction do
        remove_records
        Seeds::Seed.call
      end
    end

    private

    def remove_records
      Listing.destroy_all
    end
  end
end
