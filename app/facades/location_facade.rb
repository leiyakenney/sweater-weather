class LocationFacade
  def initialize(location)
    @location = location
  end

  def google_service
    GoogleGeocodeService.new(@location)
  end

  def coordinates
    data = google_service.get_location_data
    data[:results][0][:geometry][:location]
  end

  def search_city
    google_service.city_name
  end
end
