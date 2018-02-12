require 'rails_helper'
feature "delivery office index" do

  background do
    @office_1 = create(:delivery_office, :office_1)
    @office_2 = create(:delivery_office, :office_2)
    @office_3 = create(:delivery_office, :office_3)
  end

  scenario "Shows all the delivery offices when not searched by postcode" do
    visit delivery_offices_path
    [@office_1, @office_2, @office_3].each do |office|
      expect(page).to have_content office.postcode
    end

  end


  scenario "Shows delivery offices within the radius when not searched by postcode and radius" do
    visit delivery_offices_path

    within "#filter-form" do
      fill_in "postcode", with: @office_1.postcode
      fill_in "distance", with: 200
    end

    click_button "Search"

    [@office_1, @office_2].each do |office|
      expect(page).to have_content office.postcode
    end

    expect(page).not_to have_content @office_3.postcode

  end

end