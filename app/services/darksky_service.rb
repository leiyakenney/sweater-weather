class DarkskyService
  def initialize(lat, long)
    @lat = lat
    @long = long
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
