
class DeliveryOffice < ApplicationRecord

  validates_presence_of :postcode, :name
  validates_uniqueness_of :postcode

  before_save :fetch_and_save_lon_lat

  scope :search_in_radius, -> (longitude, latitude, distance) {
    where(%{
      ST_DWithin(
        lonlat,
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, distance])
  }


  def fetch_and_save_lon_lat
    pio = Postcodes::IO.new
    postcode_response = pio.lookup(postcode)
    self.lonlat = "POINT(#{postcode_response.longitude} #{postcode_response.latitude})"
  end


end
