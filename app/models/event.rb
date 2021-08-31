class Event < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings

  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { minimum: 10 }
  validates :name, presence: true
  validates :recurrence_times, numericality: { only_integer: true, greater_than: 0 }
  validate :recurrence?
  validates :address, presence: true
  validates :lat, :long, numericality: true
  validates :start_time, :end_time, presence: true
  validate :past?, :positive_time?

  private

  def recurrence?
    errors.add(:recurrence_frequency, 'field required if recurring event') if recurrence_times.present? && recurrence_times > 1 && !recurrence_frequency.present?
  end

  def past?
    errors.add(:start_time, 'cannot be in the past') if start_time.present? && start_time.to_datetime < DateTime.now
  end

  def positive_time?
    errors.add(:end_time, 'cannot be before start time') if end_time.present? && start_time.present? && end_time.to_datetime < start_time.to_datetime
  end
end
