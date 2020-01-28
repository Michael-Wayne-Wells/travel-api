# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_locations
  end

  def generate_locations
    20.times do |i|
      location = Location.create!(
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      puts "Location #{i}: City is #{location.city} and country is '#{location.country}'."
    end
  end
end

Seed.begin
