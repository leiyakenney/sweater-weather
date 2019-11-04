class AmypodeService
  def initialize(coordinates)
    binding.pry
    @lat = coordinates[:lat]
    @long = coordinates[:long]
  end

  def get_antipode_data
    response = conn.get("json") do |req|
      req.params[:lat] = @lat
      req.params[:long] = @long
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(
      url: 'http://amypode.herokuapp.com/api/v1/antipodes',
      header: {'key' => ENV['AMYPODE_API_KEY']}
    )
  end
end
