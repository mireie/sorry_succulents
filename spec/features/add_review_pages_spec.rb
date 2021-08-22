require "rails_helper"

describe "the add review process" do
  before(:each) do
    admin = User.create(:email => "testadmin@example.com", :password => "password-test", admin: true)
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
  end
  
  it "adds a new review" do
    fill_in "Author", :with => "Pokey Reviewer"
    fill_in "Rating", :with => "5"
    fill_in "Content body", :with => "Pokey Reviewer Content body. I'm content with my pokey reviewer body. I need another sentence."
    click_on "Create Review"
    expect(page).to have_content "Review successfully added!"
    
  end

  it "gives an error when fields are left blank" do
    click_on "Create Review"
    expect(page).to have_content "Please fix these errors:"
  end

  it "only allows logged-in accounts to add reviews" do
    click_on "Sign out"
    visit ('/products/')
    click_on "Pokey Friend"
    click_on "Add New Review"
    expect(page).to have_content "Please sign-in to continue."
  end
end