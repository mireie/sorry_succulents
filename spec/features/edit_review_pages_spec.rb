require "rails_helper"

describe "the edit review process" do
  before(:each) do
    admin = User.create(:email => "testadmin@example.com", :password => "password-test", admin: true)
    User.create(:email => "testcustomer@example.com", :password => "password-test", admin: false)
    visit new_user_session_url
    fill_in "Email", :with => admin.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    product = Product.create(
      :name => "Pokey Friend",
      :cost => 13,
      :price => 15,
      :description => "This needs to be fairly long so I will add a couple more words and we should be there.",
      :country_of_origin => "The Moon"
    )
    visit ("/products/")
    click_on product.name
    click_on "Add New Review"
    fill_in "Author", :with => "Pokey Reviewer"
    fill_in "Rating", :with => "5"
    fill_in "Content body", :with => "Pokey Reviewer Content body. I'm content with my pokey reviewer body. I need another sentence."
    click_on "Create Review"
    click_on "Pokey Reviewer"
    click_on "Edit Review"
  end
  
  it "edits a review" do
    fill_in "Author", :with => "Pokey Edited Reviewer"
    click_on "Update Review"
    expect(page).to have_content "Pokey Edited Reviewer"
  end

  it "gives an error when fields are left blank" do
    fill_in "Author", :with => ""
    click_on "Update Review"
    expect(page).to have_content "Please fix these errors:"
  end

  it "deletes a review" do
    test_product = Product.all.first
    visit ("/products/#{test_product.id}")
    click_on "Pokey Reviewer"
    click_on "Delete Review"
    expect(page).to have_content "Review successfully deleted!"
  end

  it "only allows admins to edit reviews" do
    test_product = Product.all.first
    review = test_product.reviews.first
    click_on "Sign out"
    click_on "Sign in"
    fill_in "Email", :with => "testcustomer@example.com"
    fill_in "Password", :with => "password-test"
    click_on "Log in"
    visit ("/products/#{test_product.id}/reviews/#{review.id}/edit")
    expect(page).to have_content "You aren't authorized to perform that action."
  end
end