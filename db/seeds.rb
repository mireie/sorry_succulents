puts "Cleaning up after the last mess, please wait a moment..."
User.destroy_all
Product.destroy_all
Review.destroy_all
puts "Generating Products"
100.times do
  Product.create!(
    name: Faker::Hipster.words(number: 3, spaces_allowed: true).join(" "),
    description: Faker::Hipster.paragraph,
    cost: Faker::Number.decimal(r_digits: 2),
    price: Faker::Number.decimal(r_digits: 2),
    country_of_origin: Faker::Address.country,
  )
  print "."
end
# Ensure USA products are created
10.times do
  Product.create!(
    name: Faker::Hipster.words(number: 3, spaces_allowed: true).join(" "),
    description: Faker::Hipster.paragraph,
    cost: Faker::Number.decimal(r_digits: 2),
    price: Faker::Number.decimal(r_digits: 2),
    country_of_origin: "United States of America",
  )
  print "."
end

puts "\nCreated #{Product.count} products, now generating reviews for each product:\n"

@products = Product.all

@products.each do |product|
  print "\n -#{product.name}"
  
  rand(0..30).times do
    content_body_text = Faker::Hipster.sentences(number: 3).join(" ")
    until content_body_text.length >= 50 && content_body_text.length <= 250
      content_body_text = Faker::Hipster.sentences(number: 3).join(" ")
    end
    Review.create!(
      author: Faker::Name.name,
      rating: rand(1..5),
      content_body: content_body_text,
      product_id: product.id,
    )
    print "."
  end
end

puts "\nCreated #{Review.count} Reviews for #{Product.count} products."

User.create!({ :email => "admin@example.com", :password => "password", :admin => true })
User.create!({ :email => "customer@example.com", :password => "password", :admin => false })

puts "Created example accounts admin@example.com and customer@example.com with password == 'password'"
