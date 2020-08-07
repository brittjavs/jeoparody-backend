
require 'json_web_token'

class Api::V1::ScoresController < ApplicationController

    def index
        if logged_in
            scores = Score.all
            render json: scores
        else
            render json: {
                error: "You must be logged in to view scores."
            }
        end
    end

    def create
        @score = current_user.scores.build(score_params)
        if @score.save
            render json: @score, status: 200
        else
            render json: {
                error: @score.errors.full_messages.to_sentence
            }
        end
    end


    private

    def score_params
        params.require(:user).permit(:game_total)
    end


end
