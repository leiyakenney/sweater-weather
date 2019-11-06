class UnsplashService
  def background_image(location)
    response = conn(location).get("photos/random")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn(location)
    Faraday.new(
      url: "https://api.unsplash.com/",
      params: { client_id: ENV['UNSPLASH_API_KEY'],
              query: "#{location} skyline"
            }
    )
  end
end
