class LocationSerializer < ActiveModel::Serializer
  attributes :id, :country, :city

  has_many :reviews
end
