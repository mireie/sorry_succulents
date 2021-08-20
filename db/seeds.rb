# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

100.times do
  Product.create!(
    name: Faker::Hipster.words(number: 3, spaces_allowed: true).join(" "),
    description: Faker::Hipster.paragraph,
    cost: Faker::Number.decimal(r_digits: 2),
    price: Faker::Number.decimal(r_digits: 2),
    country_of_origin: Faker::Address.country,
  )
end

p "Created #{Product.count} products."

@products = Product.all

@products.each do |product|
  rand(0..20).times do
    Review.create!(
      author: Faker::Name.name,
      rating: rand(1..5),
      content_body: Faker::Hipster.sentences(number: 3).join(" "),
      product_id: product.id,
    )
  end
end

p "Created #{Review.count} Reviews for #{Product.count} products."
