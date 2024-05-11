class Application < ApplicationRecord
  belongs_to :job

  validates :preference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
