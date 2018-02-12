require 'rails_helper'

RSpec.describe DeliveryOffice, type: :model do
  let(:new_delivery_office) { build(:delivery_office, :office_1) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:postcode) }
    it { expect(create(:delivery_office, :office_1)).to validate_uniqueness_of(:postcode) }
  end

  describe "callbacks" do
    it "executes fetch_and_save_lon_lat after save" do
      expect(new_delivery_office).to receive(:fetch_and_save_lon_lat)
      new_delivery_office.run_callbacks :save
    end
  end

  describe "fetch_and_save_lon_lat" do
    it "saves lonlat after save" do
      expect(new_delivery_office.lonlat).to be(nil)
      new_delivery_office.run_callbacks :save
      pio = Postcodes::IO.new
      postcode_response = pio.lookup(new_delivery_office.postcode)
      expected_lonlat = "POINT(#{postcode_response.longitude} #{postcode_response.latitude})"
      expect(new_delivery_office.lonlat.as_text.gsub(" ","")).to eq(expected_lonlat.strip.gsub(" ",""))
    end
  end




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
