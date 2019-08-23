class Chicken < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
  validates :egg_volume, presence: true
  validates :photo, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
