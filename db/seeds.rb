
class Seed

  def self.begin
    Location.destroy_all
    Review.destroy_all
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
      rand(3..5).times do |i|
        review = location.reviews.create( author: Faker::TvShows::DrWho.character, rating: rand(1..5), body: Faker::Lorem.paragraph(sentence_count: 4))
        puts "review id: #{review.id} created!"
      end
    end
  end
end

Seed.begin
