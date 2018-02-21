class Review < ApplicationRecord
  has_one :booking
  validates :content, :booking_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }
end

