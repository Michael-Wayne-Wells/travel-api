class Location < ApplicationRecord
  has_many :reviews,  dependent: :destroy
  scope :most_reviewed, -> {(
    select("locations.id, locations.city, locations.country, count(reviews.id) as reviews_count").joins(:reviews)
    .group("locations.id")
    .order("reviews_count DESC")
    .limit(10)
  )}
end
