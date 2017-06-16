class Event < ApplicationRecord
  belongs_to :location
  has_many :pledges, dependent: :destroy
  has_many :users, through: :pledges
  validates :name, presence: true
end
