class Api::V1::SessionsController < ApplicationController
	def create
    login = JSON.parse(request.body.read, symbolize_names: true)
		email = login[:email]
		password = login[:password]
		user = User.find_by(email: email)
		if user.authenticate(password)
			data = {api_key: user.api_key}
			render json: data, status: 200
		else
			render json: {message: 'Login information incorrect'}, status: 401
		end
	end
end
