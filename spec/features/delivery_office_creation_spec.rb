require 'rails_helper'

feature "delivery office creation" do
  given(:valid_attributes) { attributes_for(:delivery_office, :office_1) }

  scenario "Creating delivery office with valid fields" do
    visit new_delivery_office_path

    within "#delivery-form" do
      fill_in "delivery_office[name]", with: valid_attributes[:name]
      fill_in "delivery_office[postcode]", with: valid_attributes[:postcode]
    end

    click_button "Create Delivery office"
    expect(page).to have_content "Delivery office was successfully created"
  end


  scenario "Creating delivery office with invalid fields" do
    visit new_delivery_office_path

    within "#delivery-form" do
      fill_in "delivery_office[name]", with: ""
      fill_in "delivery_office[postcode]", with: ""
    end

    click_button "Create Delivery office"
    expect(page).to have_content "errors prohibited this delivery_office from being saved"
  end

end