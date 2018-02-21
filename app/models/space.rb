  class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :owner_bookings, class_name: 'Booking'
  has_many :reviews, through: :bookings

  validates :address, :name, :user_id, :price, presence: true

end