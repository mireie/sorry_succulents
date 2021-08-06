require "rails_helper"

describe Product do
  it { should have_many(:reviews) }
  [:name, :cost, :price, :description, :country_of_origin].each do |field|
    it { should validate_presence_of(field) }
  end
  it { should validate_length_of(:name).is_at_most(50) }

end
