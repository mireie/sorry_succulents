require "rails_helper"

describe "the edit product process" do
  before(:each) do
    visit products_path
    click_on "Create New Product"
    fill_in "Name", :with => "Pokey Friend"
    fill_in "Cost", :with => 13
    fill_in "Price", :with => 14
    fill_in "Description", :with => "This needs to be fairly long so I will add a couple more words and we should be there."
    fill_in "Country of origin", :with => "United States of America"
    click_on "Create Product"
    within ".main-content" do
      click_on "Pokey Friend"
    end
    click_on "Edit"
  end

  it "edits a product" do
    fill_in "Name", :with => "Super Pokey Friend"
    click_on "Update Product"
    expect(page).to have_content "Super"
  end

  it "gives an error when no name is entered" do
    fill_in "Name", :with => ""
    click_on "Update Product"
    expect(page).to have_content "Name can't be blank"
  end

  it "deletes a product" do
    visit products_path
    within ".main-content" do
      click_on "Pokey Friend"
    end
  end
end
