require 'rails_helper'

describe "Antipode Endpoint" do
  it "shows the search city, antipode city, and the antipode city's weather" do
    get '/api/v1/antipode?location=hongkong'

    antipode = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(antipode.class).to eq(Hash)
    expect(antipode[:data].count).to eq(3)
    expect(antipode[:data][:attributes][:search_city]).to eq("hongkong")
    expect(antipode[:data][:attributes][:location_name]).to eq("Jujuy")
    expect(antipode[:data][:type]).to eq('antipode')
  end
end
