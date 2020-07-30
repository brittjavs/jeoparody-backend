class ScoresController < ApplicationController

    before_action :set_score, only: [:show, :destroy]

    def index
        if logged_in?
            @scores = current_user.scores
            render json: @scores, status: 200
        else
            render json: {
                error: "You must be logged in to see your scores"
            }
        end
    end

    def show
        render json: @score
    end

    def create
        @score = current_user.scores.build(score_params)
        if @score.save
            render json: @score, status: 200
        else
            error_response = {
                error: @score.errors.full_messages.to_sentence
            }
            render json: error_response
        end
    end

    def destroy
        # Do we want to the user to be able to delete the score?
        @score.destroy
    end

    private

    def set_score
        @score = Score.find_by(id:params[:id])
    end

    def score_params
        params.require(:user).permit(:game_total)
        # Is it password or password_digest here?
    end


end
