class Api::V1::AntipodeController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    antipode_coordinates = AntipodeFacade.new(coordinates).antipode_coordinates
    binding.pry
    weather = ForecastFacade.new(antipode_coordinates).create_forecast
    forecast = Forecast.new(weather)
    render json: ForecastSerializer.new(forecast)
  end
end
