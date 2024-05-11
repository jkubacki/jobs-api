class Application < ApplicationRecord
  belongs_to :job
  has_many :replies, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :interviews, dependent: :destroy
  has_many :offers, through: :replies

  validates :preference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
