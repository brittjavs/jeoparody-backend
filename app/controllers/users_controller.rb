class UsersController < ApplicationController

    def index
    end

    def show
    end

    def create
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
        # Is it password or password_digest here?
    end

end
