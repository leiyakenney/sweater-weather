class GoogleService
  def location_data(location)
    response = conn.get("json") do |req|
      req.params[:address] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
