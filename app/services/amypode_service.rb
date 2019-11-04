class AmypodeService
  def initialize(coordinates)
    @lat = coordinates[:lat]
    @long = coordinates[:lng]
  end

  def get_antipode_data
    conn = Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.headers["api_key"] = ENV['AMYPODE_API_KEY']
      f.params["lat"] = @lat
      f.params["long"] = @long
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/antipodes")
# binding.pry
    JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  end
end
