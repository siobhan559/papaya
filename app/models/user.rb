class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :registered_events, through: :bookings, source: :event
  has_many :chatrooms

  validate :volunteer, :organization?

  def name
    organization ? company_name.capitalize : "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def volunteer
    if organization.present? && !organization
      errors.add(:first_name, 'field required') unless first_name.present? && last_name.present?
    end
  end

  def organization?
    if organization.present? && organization
      errors.add(:company_name, 'field required') unless company_name.present?
      errors.add(:bio, 'field required') unless bio.present?
    end
  end
end
