require 'rails_helper'

RSpec.describe "delivery_offices/edit", type: :view do
  before(:each) do
    @delivery_office = assign(:delivery_office, DeliveryOffice.create!(
      :name => "post code 1",
      :postcode => "OX49 5NU"
    ))
  end

  it "renders the edit delivery_office form" do
    render

    assert_select "form[action=?][method=?]", delivery_office_path(@delivery_office), "post" do

      assert_select "input[name=?]", "delivery_office[name]"

      assert_select "input[name=?]", "delivery_office[postcode]"
    end
  end
end
