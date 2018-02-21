class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :spaces
  has_many :owner_bookings, through: :spaces
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true
  phony_normalize :phone_number, default_country_code: 'FR'

end
