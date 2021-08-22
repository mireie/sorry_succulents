require "rails_helper"

describe "the edit product process" do
  before(:each) do
    user = User.create(:email => "test@example.com", :password => "password-test", admin: true)
    visit new_user_session_url
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    visit new_product_path
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
    click_on "Delete product"
    expect(page).to have_content "Product successfully deleted!"
  end
end
