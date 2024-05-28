class Reply < ApplicationRecord
  belongs_to :application
  has_one :offer, dependent: :destroy
  has_many :task, dependent: :destroy
  has_many :interview, dependent: :destroy

  after_save { application.listing.reindex }
  after_destroy { application.listing.reindex }

  validates :sent_at, :body, :preference, presence: true
  validates :by_me, inclusion: { in: [true, false] }
end
