class GoogleReverseGeocodeService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_location_data
    response = conn.get("json") do |req|
      req.params[:latlng] = "#{@lat},#{@long}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def city_name
    get_location_data[:results][0][:address_components][2][:long_name]
  end

  private
  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
