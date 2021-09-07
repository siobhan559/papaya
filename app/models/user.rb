class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_favoritor

  has_one_attached :photo, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :registered_events, through: :bookings, source: :event
  has_many :chatrooms

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  validate :volunteer, :organization?

  def name
    organization ? company_name.capitalize : "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
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
