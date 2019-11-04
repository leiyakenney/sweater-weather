class Api::V1::AntipodeController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    search_location = LocationFacade.new(params[:location]).search_city
    antipode_coordinates = AntipodeFacade.new(coordinates).antipode_coordinates
    antipode_location = AntipodeFacade.new(coordinates).antipode_city
    binding.pry
    weather = AntipodeForecastFacade.new(antipode_coordinates).create_forecast
    forecast = Antipode.new(weather, search_location, antipode_coordinates)
    render json: AntipodeSerializer.new(forecast)
  end
end
