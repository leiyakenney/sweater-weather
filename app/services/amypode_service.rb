class AmypodeService
  def initialize(latlong)
    @lat = latlong[:lat]
    @lng = latlong[:lng]
  end

  def get_antipode_data
    response = conn.get("/api/v1/antipodes")

    JSON.parse(response.body, symbolize_names: true)
  end

  def coordinates
    get_antipode_data[:data][:attributes]
  end

  private
  def conn
    conn = Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.headers["api_key"] = ENV['AMYPODE_API_KEY']
      f.params["lat"] = @lat
      f.params["long"] = @lng
      f.adapter Faraday.default_adapter
    end
  end
end
