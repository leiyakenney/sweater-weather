class AmypodeService
  def initialize(coordinates)
    binding.pry
    @lat = coordinates[:lat]
    @long = coordinates[:lng]
  end

  def get_antipode_data
    response = conn.get("json") do |req|
      req.params[:lat] = @lat
      req.params[:long] = @long
      req.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.adapter Faraday.default_adapter
      f.params[:lat] = @lat
      f.params[:long] = @long
      f.headers[:api_key] = ENV['AMYPODE_API_KEY']
    end
  end
end
