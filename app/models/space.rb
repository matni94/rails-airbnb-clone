class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :address, :name, :user_id, presence: true
  validates :name, uniqueness: true

end
