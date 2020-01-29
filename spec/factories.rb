FactoryBot.define do

  factory(:location) do
    city { Faker::Address.city }
    country {Faker::Address.country}
  end
  factory(:review) do
    author {Faker::TvShows::DrWho.character}
    rating {rand(1..5)}
    body {Faker::Lorem.paragraph(sentence_count: 4)}
  end


  factory :location_with_reviews do
    transient do
      reviews_count { 3 }
    end

    after(:create) do |location, evaluator|
      create_list(:review, evaluator.reviews_count, location: location)
    end
end

end
