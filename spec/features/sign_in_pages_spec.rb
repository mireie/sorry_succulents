require "rails_helper"

describe "the sign in proccess" do
  before(:each) do
    User.destroy_all
    User.create!({ :email => "customer@example.com", :password => "password", :admin => false })
  end

  it "signs in a user" do
    visit new_user_session_url
    fill_in "Email", :with => "customer@example.com"
    fill_in "Password", :with => "password"
    within "#new_user" do
      click_on "Log in"
    end
    expect(page).to have_content "Signed in successfully."
  end

end
