class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
end
