class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :forecast, &:antipode_darksky
  attribute :search_city, &:location
  attribute :location_name, &:antipode_city_name
end
