  class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :owner_bookings, class_name: 'Booking'
  has_many :reviews, through: :bookings

  validates :address, :name, :user_id, :price, presence: true

  include PgSearch
  pg_search_scope :search_by_city,
    against: [ :address, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


 def self.perform_search(keyword)
    if keyword.present?
    then Space.search_by_city(keyword)
    else Space.all
    end.sort
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
