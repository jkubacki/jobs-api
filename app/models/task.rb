class Task < ApplicationRecord
  belongs_to :reply
  validates :preference, presence: true
  validates :done, inclusion: { in: [true, false] }
end
