class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # This is the events they registered for
  has_many :events, through: :bookings, as: :registered_events
  # This is the events the organization creates
  has_many :events, as: :created_events
end
