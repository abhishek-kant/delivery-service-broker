require 'rails_helper'

RSpec.describe "delivery_offices/index", type: :view do
  before(:each) do
    assign(:delivery_offices, [
      DeliveryOffice.create!(
        :name => "post code 1",
        :postcode => "OX49 5NU"
      ),
      DeliveryOffice.create!(
        :name => "post code 2",
        :postcode => "M32 0JG"
      )
    ])
  end

  it "renders a list of delivery_offices" do
    render
    [{:name => "post code 1",:postcode => "OX49 5NU" }, {:name => "post code 2", :postcode => "M32 0JG"}].each do |postcode_attributes|
      assert_select "tr>td", :text => postcode_attributes[:name].to_s, :count => 1
      assert_select "tr>td", :text => postcode_attributes[:postcode].to_s, :count => 1
    end
  end
end
