class Interview < ApplicationRecord
  belongs_to :reply

  validates :scheduled_at, :medium, presence: true
end
