class Application < ApplicationRecord
  belongs_to :job
  has_many :replies, dependent: :destroy
  has_many :interviews, through: :replies
  has_many :tasks, through: :replies
  has_many :offers, through: :replies

  validates :preference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
