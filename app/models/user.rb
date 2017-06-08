class User < ApplicationRecord
  has_many :pledges
  has_many :events, through: :pledges
end
