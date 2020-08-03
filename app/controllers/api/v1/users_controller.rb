# require 'JsonWebToken'
# require 'JWT'
class Api::V1::UsersController < ApplicationController

    # before_action :set_user, only: [:show, :destroy]

    # from article:
    before_action :authorized, only: [:auto_login]
   
    def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def auto_login
        render json: @user
      end

                # from the article:
    def login
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end



    # def signup
    #     params.inspect
    #     user = User.new(user_params)
    #     if user.save
    #         render json: { token: JsonWebToken.create_token(username: user.username, id: user.id)}, status: 200
    #     else
    #         render json: {errors: user.errors.full_messages}, status: 500
    #     end
    # end

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
    end

end
