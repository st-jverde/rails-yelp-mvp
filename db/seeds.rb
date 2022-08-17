# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Clearing the db...'
Restaurant.destroy_all

puts 'Creating restaurants...'

category = %w[chinese italian japanese french belgian]

10.times do
  resto = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: category.sample
  )
  resto.save!
  puts 'Done! Created restaurants'

  puts 'Creating reviews...'

  rand(2..5).times do
    review = Review.new(
      rating: rand(1..5),
      content: Faker::Lorem.paragraph,
      restaurant: resto
    )
    review.save!
  end

  puts 'Done! Created reviews'
end
