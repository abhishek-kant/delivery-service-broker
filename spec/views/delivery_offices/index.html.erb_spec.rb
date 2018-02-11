require 'rails_helper'

RSpec.describe "delivery_offices/index", type: :view do
  before(:each) do
    assign(:delivery_offices, [
      DeliveryOffice.create!(
        :name => "Name",
        :postcode => "Postcode"
      ),
      DeliveryOffice.create!(
        :name => "Name",
        :postcode => "Postcode"
      )
    ])
  end

  it "renders a list of delivery_offices" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
  end
end
