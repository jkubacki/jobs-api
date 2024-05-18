class Application < ApplicationRecord
  belongs_to :listing
  has_many :replies, dependent: :destroy
  has_many :interviews, through: :replies
  has_many :tasks, through: :replies
  has_many :offers, through: :replies

  default_scope { order(applied_at: :desc, created_at: :desc) }

  validates :preference, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
