class ReverseLocationFacade
  def initialize(antipode_coordinates)
    @lat = antipode_coordinates[:lat]
    @long = antipode_coordinates[:long]
  end

  def google_reverse_service
    GoogleReverseGeocodeService.new(@lat, @long)
  end

  def antipode_city
    google_reverse_service.city_name
  end
end
