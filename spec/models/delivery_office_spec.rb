require 'rails_helper'

RSpec.describe DeliveryOffice, type: :model do
  describe "search_in_radius" do
    before(:each) do
      @office_1 = create(:delivery_office, :office_1)
      @office_2 = create(:delivery_office, :office_2)
      @office_3 = create(:delivery_office, :office_3)

      longitude = @office_1.lonlat.x
      latitude = @office_1.lonlat.y
      two_hundred_miles_in_meters = 200 * 1609
      @searched_delivery_offices = DeliveryOffice.search_in_radius(longitude, latitude, two_hundred_miles_in_meters)
    end

    it "returns delivery office with in radius" do
      expect(@searched_delivery_offices).to include(@office_2)
    end

    it "doesn't return delivery office outside of given radius" do
      expect(@searched_delivery_offices).to_not include(@office_3)
    end

  end
end
