require "rails_helper"

describe "the sign out proccess" do
  before(:each) do
    User.destroy_all
    user = User.create(:email => "test@example.com", :password => "password-test", admin: true)
    visit new_user_session_url
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"  
  end

  it "signs out a user" do
    click_on "Sign out"
    expect(page).to have_content "Signed out successfully."
  end
end
