require 'rails_helper'

RSpec.describe "delivery_offices/new", type: :view do
  before(:each) do
    assign(:delivery_office, DeliveryOffice.new(
      :name => "MyString",
      :postcode => "MyString"
    ))
  end

  it "renders new delivery_office form" do
    render

    assert_select "form[action=?][method=?]", delivery_offices_path, "post" do

      assert_select "input[name=?]", "delivery_office[name]"

      assert_select "input[name=?]", "delivery_office[postcode]"
    end
  end
end
