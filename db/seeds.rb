# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create airports
airports = [
  { code: 'JFK', name: 'John F. Kennedy International Airport', location: 'New York' },
  { code: 'LAX', name: 'Los Angeles International Airport', location: 'Los Angeles' },
  { code: 'ORD', name: 'O\'Hare International Airport', location: 'Chicago' },
  { code: 'ATL', name: 'Hartsfield-Jackson Atlanta International Airport', location: 'Atlanta' },
  { code: 'SFO', name: 'San Francisco International Airport', location: 'San Francisco' },
  { code: 'DFW', name: 'Dallas/Fort Worth International Airport', location: 'Dallas' },
  { code: 'DEN', name: 'Denver International Airport', location: 'Denver' },
  { code: 'SEA', name: 'Seattle-Tacoma International Airport', location: 'Seattle' },
  { code: 'MIA', name: 'Miami International Airport', location: 'Miami' },
  { code: 'BOS', name: 'Boston Logan International Airport', location: 'Boston' }
]

airports.each do |airport_data|
  Airport.find_or_create_by!(code: airport_data[:code]) do |airport|
    airport.name = airport_data[:name]
    airport.location = airport_data[:location]
  end
end
