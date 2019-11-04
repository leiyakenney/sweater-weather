class Api::V1::AntipodeController < ApplicationController

  def show
    coordinates = LocationFacade.new(params[:location]).coordinates
    antipode_coordinates = AntipodeFacade.new(coordinates).antipode_coordinates
    weather = AntipodeForecastFacade.new(antipode_coordinates).create_forecast
    forecast = Antipode.new(weather)
    render json: AntipodeSerializer.new(forecast)
  end
end
