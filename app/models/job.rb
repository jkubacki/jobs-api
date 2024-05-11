class Job < ApplicationRecord
  validates :preference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :glassdoor_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
end
