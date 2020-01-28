class LocationSerializer < ActiveModel::Serializer
  attributes :id, :country

  has_many :reviews
end
