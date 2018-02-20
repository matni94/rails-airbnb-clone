class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :review, dependent: :destroy

  validates :arrival, :departure, :user_id, :space_id, presence: true
  validate :validate_schedule

  private

  def validate_schedule
    # Check
    # If not valid, add an error
    # arrival
    # departure
    # Booking.where('arrival < ? AND departure > ? OR ', arrival, departure)

    # errors.add(:arrival, 'Impossible')
  end
end
