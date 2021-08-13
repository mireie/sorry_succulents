require "rails_helper"

describe "visit pages" do
  it "shows a product when clicked from the product" do
    Product.create(
      :name => "Pokey Friend",
      :cost => 13, :price => 14,
      :description => "This needs to be fairly long so I will add a couple more words and we should be there.",
      :country_of_origin => "United States of America",
    )
    visit ("/")
    within ".main-content" do
      click_on "Pokey Friend"
    end
    expect(page).to have_content "fairly long"
  end
  it "should allow an admin to delete" do
    user = User.create(:email => "test@example.com", :password => "password-test", admin: true)
    visit new_user_session_url
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    Product.create(
      :name => "Pokey Friend",
      :cost => 13, :price => 14,
      :description => "This needs to be fairly long so I will add a couple more words and we should be there.",
      :country_of_origin => "United States of America",
    )
    visit ("/")
    within ".main-content" do
      click_on "Pokey Friend"
    end
    click_on "Delete product"
    expect(page).to have_content "Product successfully deleted!"
  end
end
