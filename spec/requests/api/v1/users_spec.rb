require 'rails_helper'

RSpec.describe "users spec", type: :request do
  describe "user creation" do
    it "can create account and return an API key" do

       register = {
                 "email": "whatever@example.com",
                 "password": "password",
                 "password_confirmation": "password"
                 }

       post '/api/v1/users', params: register.to_json
       data = JSON.parse(response.body, symbolize_names: true)

       expect(response).to be_successful
       expect(data).to have_key(:api_key)
       expect(data.count).to eq(1)
    end

    it "errors out if invalid credentials are entered" do
      register = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "oops"
                  }

        post '/api/v1/users', params: register.to_json
        data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.content_type).to eq('application/json')
    end
  end
end
