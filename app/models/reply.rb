class Reply < ApplicationRecord
  belongs_to :application
  has_one :offer, dependent: :destroy
  has_many :task, dependent: :destroy
  has_many :interview, dependent: :destroy

  validates :sent_at, :body, :preference, presence: true
  validates :by_me, inclusion: { in: [true, false] }
end
