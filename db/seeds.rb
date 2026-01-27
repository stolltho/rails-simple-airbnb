# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
Flat.create!(
  name: "Sunny Loft",
  address: "12 King Street, Sydney",
  description: "Bright loft close to the city.",
  price_per_night: 180,
  number_of_guests: 2
)

Flat.create!(
  name: "Cozy Studio",
  address: "45 Brunswick Road, Melbourne",
  description: "Small but comfortable studio.",
  price_per_night: 120,
  number_of_guests: 2
)

Flat.create!(
  name: "Beachside Apartment",
  address: "8 Ocean Drive, Bondi",
  description: "Apartment with sea views.",
  price_per_night: 250,
  number_of_guests: 4
)

Flat.create!(
  name: "Family House",
  address: "22 Maple Avenue, Brisbane",
  description: "Spacious house for families.",
  price_per_night: 220,
  number_of_guests: 6
)

Flat.create!(
  name: "City Penthouse",
  address: "101 Collins Street, Melbourne",
  description: "Luxury penthouse in the CBD.",
  price_per_night: 400,
  number_of_guests: 4
)

puts "Finished! Created #{Flat.count} flats."
