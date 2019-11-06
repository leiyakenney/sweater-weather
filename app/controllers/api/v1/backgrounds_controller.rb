class Api::V1::BackgroundsController < ApplicationController

  def show
    facade = BackgroundsFacade.new(params[:location])
    render json: BackgroundsSerializer.new(facade)
  end
end
