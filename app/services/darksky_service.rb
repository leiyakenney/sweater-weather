class DarkskyService
  def initialize(coordinates)
    @lat = coordinates[:lat]
    @long = coordinates[:lng]
  end

  def get_forecast_data
    response = conn.get("#{@lat},#{@long}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
      url: "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}"
    )
  end
end
