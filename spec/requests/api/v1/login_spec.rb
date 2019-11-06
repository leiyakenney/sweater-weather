require 'rails_helper'

describe 'user login' do
  describe 'user can login with correct credentials' do
    before :each do
      @user = User.create!(email: "whatever@example.com", password: "password", api_key: "h1ap1k3y")
    end

    it 'a user can log in the user and will receive api key' do
      login = '{
                "email": "whatever@example.com",
                "password": "password"
                }'

      post '/api/v1/sessions', params: login
      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(data.count).to eq(1)
      expect(data[:api_key]).to eq(@user.api_key)
      expect(response.status).to eq(200)
    end

    it 'a user cannot log in with bad credentials' do
      login = '{
              "email": "whatever@example.com",
              "password": "oops"
              }'

      post '/api/v1/sessions', params: login
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:message]).to eq("Login information incorrect")
      expect(response.content_type).to eq('application/json')
      expect(response.status).to eq(401)
    end
  end
end
