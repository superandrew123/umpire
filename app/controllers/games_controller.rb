class GamesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.home_name = params[:game][:home_name]
    @game.away_name = params[:game][:away_name]
    @game.user_id = current_user.id
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    # updates the score every new inning
    @game = Game.find(params[:id])
    @game.away_score = params[:away_score]
    @game.home_score = params[:home_score]
    @game.read_inning(params[:inning])
    @game.save
    render nothing: true
  end

end