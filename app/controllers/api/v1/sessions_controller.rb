class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            render json: user    
        else
            render json: {
                error: "Invalid username or passsword"
            }
        end
    end

    def get_current_user
        if logged_in
            render json: current_user
        else
            render json: {
                error: "No one is logged in"
            }
        end
    end

    def logout
        session.clear
        render json: {
            notice: "You have successfully logged out."
        }, status: 200
    end
end