class Reply < ApplicationRecord
  belongs_to :application
  has_one :offer, dependent: :destroy
  has_many :task, dependent: :destroy
  has_many :interview, dependent: :destroy
end
