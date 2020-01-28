FactoryBot.define do
  factory(:location) do
    city {Faker::Address.city}
    country {Faker::Address.country}
  end
  factory(:review) do
    5.times do
      author {Faker::TvShows::DrWho.character}
      rating {rand(1..5)}
      body {Faker::Lorem.paragraph(sentence_count: 4)}
    end
  end
end
