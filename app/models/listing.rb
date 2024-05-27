class Listing < ApplicationRecord
  include ListingsElasticSearch

  has_many :applications, dependent: :destroy

  validates :company, :url, :title, :product, :based_in, :stack, :compensation, :preference, presence: true
  validates :remote, inclusion: { in: [true, false] }
  validates :preference, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :glassdoor_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }, allow_nil: true
end
