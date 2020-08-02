require 'json_web_token'

class Api::V1::UsersController < ApplicationController

    # before_action :set_user, only: [:show, :destroy]

    def signup
        params.inspect
        user = User.new(user_params)
        if user.save
            render json: { token: JsonWebToken.create_token(username: user.username, id: user.id)}, status: 200
        else
            render json: {errors: user.errors.full_messages}, status: 500
        end
    end

    def index
        users = User.all 
        render json: users
    end

    def show
        user = User.find_by(id:params[:id])
        render json: user , status: 200
    end

    def destroy
        user.destroy
    end

    private

    # def set_user
    #     @user = User.find_by(id:params[:id])
    # end

    def user_params
        params.require(:user).permit(:username, :password)
        # Is it password or password_digest here? It should be password 
    end

end
