class Chicken < ApplicationRecord
  has_many :bookings
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
  validates :egg_volume, presence: true
  validates :photo, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
