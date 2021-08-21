require "rails_helper"

describe "the sign up proccess" do
  before(:each) do
    User.destroy_all
  end

  it "creates a new user" do
    visit new_user_registration_url
    fill_in "Email", :with => "example@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    within "#new_user" do
      click_on "Sign up"
    end
    expect(page).to have_content "You have signed up successfully."
  end
end
