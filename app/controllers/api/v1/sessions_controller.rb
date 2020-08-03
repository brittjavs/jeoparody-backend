<<<<<<< HEAD
# require 'JsonWebToken'
# require 'JWT'
=======
require 'json_web_token'

>>>>>>> 16d0c925a4c5b0bc1f3c036bd0b0a491e2ecb90b
class Api::V1::SessionsController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
<<<<<<< HEAD
            render json: {token: JsonWebToken.create_token({username: user.username, id:user.id})}
=======
            render json: { token: JsonWebToken.create_token(username: user.username, id: user.id)}, status: 200
>>>>>>> 16d0c925a4c5b0bc1f3c036bd0b0a491e2ecb90b
        else
            render json: {errors: {message: "Unable to find a user with that username and password"}}, status: 500
        end
    end
end