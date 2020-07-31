require 'JsonWebToken'
# require 'JWT'
class Api::V1::SessionsController < ApplicationController
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {token: JsonWebToken.create_token({username: user.username, id:})}
        else
            render json: {errors: {message: "Unable to find a user with that username and password"}}, status: 500
        end
    end
end