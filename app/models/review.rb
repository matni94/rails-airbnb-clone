class Review < ApplicationRecord
  has_one :booking
  validates :content, :booking_id, presence: true
end
