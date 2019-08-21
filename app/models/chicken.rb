class Chicken < ApplicationRecord
  has_many :bookings
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :age, presence: true, length: { in: 0..30 }
  validates :egg_volume, presence: true, length: { in: 0..5 }
  validates :photo, presence: true
  validates :description, presence: true
  validates :price, presence: true, length: { in: 10..500 }
end
