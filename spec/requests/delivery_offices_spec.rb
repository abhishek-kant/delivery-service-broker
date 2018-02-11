require 'rails_helper'

RSpec.describe "DeliveryOffices", type: :request do
  describe "GET /delivery_offices" do
    it "works! (now write some real specs)" do
      get delivery_offices_path
      expect(response).to have_http_status(200)
    end
  end
end
