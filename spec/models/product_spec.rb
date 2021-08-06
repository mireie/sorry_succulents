require "rails_helper"

describe Product do
  it { should have_many(:reviews) }
  [:name, :cost, :price, :description, :country_of_origin].each do |field|
    it { should validate_presence_of(field) }
  end
  it { should validate_length_of(:name).is_at_most(100) }

  it("titleizes the name of a product") do 
    product = Product.create({name: "pokey pokey stabby plant", cost: 20, price: 50, description: "A long description goes here.", country_of_origin: "United States of Cacti"})
    expect(product.name).to(eq("Pokey Pokey Stabby Plant"))
  end
end
