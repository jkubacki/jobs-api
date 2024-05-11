class Reply < ApplicationRecord
  belongs_to :application
  has_one :offer, dependent: :destroy
  has_one :task, dependent: :destroy
end
