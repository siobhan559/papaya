class Event < ApplicationRecord
  CATEGORY = %w[Health Education Animals Community Children Environment Faith Women Shelter LGBT Food Sport Other]
  DATE = ['Earliest Date', 'Latest Date']

  include PgSearch::Model

  pg_search_scope :search, against: %i[address name category],
                  using: { tsearch: {
                    prefix: true,
                    any_word: true
                                    }
                  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { minimum: 10 }
  validates :name, presence: true
  validates :address, presence: true
  # validates :latitude, :longitude, numericality: true
  validates :start_time, :end_time, presence: true
  validate :past?, :positive_time?

  private

  def past?
    errors.add(:start_time, 'cannot be in the past') if start_time.present? && start_time.to_datetime < DateTime.now
  end

  def positive_time?
    errors.add(:end_time, 'cannot be before start time') if end_time.present? && start_time.present? && end_time.to_datetime < start_time.to_datetime
  end
end
