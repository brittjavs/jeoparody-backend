<<<<<<< HEAD
# require 'JsonWebToken'
# require 'JWT'
=======
require 'json_web_token'

>>>>>>> 16d0c925a4c5b0bc1f3c036bd0b0a491e2ecb90b
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

<<<<<<< HEAD
    def create
        @user = User.new(user_params)
        if @user.save
            # Do we want to use sessions?
            # session[:user_id] = @user.id
            # --we might not need sessions if we use jwt...still learning
            # binding.pry
            render json: {token: JsonWebToken.create_token({username: user.username, id:user.id})}
        else
            render json: {errors: @user.errors.full_messages}, status: 500
        end
=======
    def show
        user = User.find_by(id:params[:id])
        render json: user , status: 200
>>>>>>> 16d0c925a4c5b0bc1f3c036bd0b0a491e2ecb90b
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
    end

end
