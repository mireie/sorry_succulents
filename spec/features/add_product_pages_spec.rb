require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Pokey Friend'
    fill_in 'Cost', :with => 13
    fill_in 'Price', :with => 14
    fill_in 'Description', :with => "This needs to be fairly long so I will add a couple more words and we should be there."
    fill_in 'Country of origin', :with => "United States of America"
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Pokey Friend'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end