require 'rails_helper'

RSpec.describe "delivery_offices/show", type: :view do
  before(:each) do
    @delivery_office = assign(:delivery_office, DeliveryOffice.create!(
      :name => "Name",
      :postcode => "Postcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Postcode/)
  end
end
