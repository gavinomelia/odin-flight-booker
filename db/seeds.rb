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
  'JFK', 'LAX', 'ORD', 'ATL', 'SFO',
  'DFW', 'DEN', 'SEA', 'MIA', 'BOS'
]

airports.each do |code|
  Airport.find_or_create_by!(code: code)
end

airports = Airport.all
dates = (Date.today..(Date.today + 2)).to_a
durations = [ 60, 90, 120, 150, 180, 210, 240 ]

airports.each do |departure|
  airports.each do |arrival|
    next if departure == arrival

    dates.each do |date|
      3.times do |i|
        hour = 8 + (i * 4)  # 8am, 12pm, 4pm
        start_datetime = date.to_datetime.change(hour: hour)
        duration = durations.sample

        Flight.find_or_create_by!(
          departure_airport: departure,
          arrival_airport: arrival,
          start_datetime: start_datetime,
          duration: duration
        )
      end
    end
  end
end
