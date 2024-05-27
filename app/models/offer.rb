class Offer < ApplicationRecord
  belongs_to :reply

  validates :compensation, :notes, :preference, presence: true
  validates :by_me, :accepted, inclusion: { in: [true, false] }
end
