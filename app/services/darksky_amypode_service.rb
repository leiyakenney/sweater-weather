class DarkskyAmypodeService
  def initialize(antipode_coords)
    @lat = antipode_coords[:lat]
    @long = antipode_coords[:long]
  end

  def get_forecast_data
    binding.pry
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
