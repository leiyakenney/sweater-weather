require 'rails_helper'

describe "Forecast Endpoint" do
  it "shows an endpoint with current weather, hourly weather, and daily weather" do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(forecast.class).to eq(Hash)
    expect(forecast[:data][:attributes].count).to eq(12)
    expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
    expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
    expect(forecast[:data][:type]).to eq('forecast')
  end
end
