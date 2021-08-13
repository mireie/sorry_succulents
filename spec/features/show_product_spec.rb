require "rails_helper"

describe "visit pages" do
  it "shows a product when clicked from the product" do
    product = Product.create(
      :name => "Pokey Friend",
      :cost => 13, :price => 14,
      :description => "This needs to be fairly long so I will add a couple more words and we should be there.",
      :country_of_origin => "United States of America",
    )
    visit ('/')
    within ".main-content" do
      click_on "Pokey Friend"
    end
    expect(page).to have_content "fairly long"
  end
end
