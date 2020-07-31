class Api::V1::SessionsController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {token: Auth.createToken(@user)}
        else
            render json: {errors: {message: "Unable to find a user with that username and password"}}, status: 500
        end
    end
end