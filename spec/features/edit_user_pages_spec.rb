require "rails_helper"

describe "the edit user proccess" do
  before(:each) do
    User.destroy_all
    user = User.create(:email => "test@example.com", :password => "password-test", admin: true)
    visit new_user_session_url
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "password-test"
    click_on "Log in"  
    click_on "test@example.com"
    fill_in "Current password", :with => "password-test"
  end

  it "renders an edit page" do
    expect(page).to have_content "Edit User"
  end
  
  it "updates an email" do
    fill_in "Email", :with => "newemail@example.com"
    click_on "Update"
    expect(page).to have_content "newemail@example.com"
  end
  
  it "updates a password" do 
    fill_in "Password", :with => "new-password"
    fill_in "Password confirmation", :with => "new-password"
    click_on "Update"
    expect(page).to have_content "Your account has been updated successfully."
  end

  it "deletes an account" do
    click_on "Cancel my account"
    expect(page). to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end
