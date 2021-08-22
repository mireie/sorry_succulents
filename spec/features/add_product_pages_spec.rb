require "rails_helper"

describe "the admin add a product process" do
  before(:each) do
    admin = User.create(:email => "testadmin@example.com", :password => "password-test", admin: true)
    visit new_user_session_url
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    visit new_product_path
  end
  
  it "adds a new product" do
    fill_in "Name", :with => "Pokey Friend"
    fill_in "Cost", :with => 13
    fill_in "Price", :with => 14
    fill_in "Description", :with => "This needs to be fairly long so I will add a couple more words and we should be there."
    fill_in "Country of origin", :with => "United States of America"
    click_on "Create Product"
    expect(page).to have_content "Product successfully added!"
    expect(page).to have_content "Pokey Friend"
  end
  
  it "gives an error when no name is entered" do
    click_on "Create Product"
    expect(page).to have_content "Name can't be blank"
  end
  
  it "only allows logged-in admins to add products" do
    click_on "Sign out"
    visit new_product_path
    expect(page).to have_content "Please sign-in to continue."
    customer = User.create(:email => "testcustomer@example.com", :password => "password-test", admin: false)
    visit new_user_session_url
    fill_in "Email", :with => customer.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    visit new_product_path
    expect(page).to have_content "You aren't authorized to perform that action."
  end
end