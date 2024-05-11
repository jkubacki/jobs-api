class Reply < ApplicationRecord
  belongs_to :application
  has_one :offer, dependent: :destroy
end
