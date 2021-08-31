class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # This is the events they registered for
  has_many :events, through: :bookings, as: :registered_events
  # This is the events the organization creates
  has_many :events, as: :created_events, dependent: :destroy

  validate :volunteer?, :organization?

  private

  def volunteer?
    if organization?.present? && !organization?
      errors.add(:first_name, 'field required') unless first_name.present? && last_name.present?
    end
  end

  def organization?
    if organization?.present? && organization?
      errors.add(:company_name, 'field required') unless company_name.present?
      errors.add(:bio, 'field required') unless bio.present?
    end
  end
end
