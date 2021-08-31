class Event < ApplicationRecord
  belongs_to :user, as: :organization
  has_many :users, through: :bookings
end
