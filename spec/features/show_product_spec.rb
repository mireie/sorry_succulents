require 'rails_helper'

describe "visit pages" do
  it "shows a product when clicked from the product" do
    visit products_path
    click_on 'Create New Product'
    fill_in 'Name', :with => 'Pokey Friend'
    fill_in 'Cost', :with => 13
    fill_in 'Price', :with => 14
    fill_in 'Description', :with => "This needs to be fairly long so I will add a couple more words and we should be there."
    fill_in 'Country of origin', :with => "United States of America"
    click_on 'Create Product'
    within '.main-content' do
      click_on 'Pokey Friend'
    end
      expect(page).to have_content 'fairly long'
  end

end