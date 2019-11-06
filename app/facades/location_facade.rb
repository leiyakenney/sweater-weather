class LocationFacade
  def initialize(location)
    @location = location
  end

  def google_service
    GoogleService.new
  end

  def coordinates
    data = google_service.location_data(@location)
    data[:results][0][:geometry][:location]
  end

  def search_city
    google_service.city_name
  end
end
