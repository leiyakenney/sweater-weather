class GoogleGeocodeService
  def initialize(location)
    @city = location.split(",")[0]
    @state = location.split(",")[1]
  end

  def get_location_data
    response = conn.get("json") do |req|
      req.params[:address] = "#{@city}+#{@state}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def city_name
    get_location_data[:results][0][:formatted_address]
  end

  private
  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
