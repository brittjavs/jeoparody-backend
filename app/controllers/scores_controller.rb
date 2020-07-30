class ScoresController < ApplicationController

    def index
    end

    def show
    end

    def create
    end

    def destroy
    end

    private

    def score_params
        params.require(:user).permit(:game_total)
        # Is it password or password_digest here?
    end


end
