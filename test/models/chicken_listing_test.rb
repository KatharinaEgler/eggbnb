require 'test_helper'

class ChickenListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  class FlatsController < ApplicationController
  def index
    @flats = Flat.geocoded #returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
end
