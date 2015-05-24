class GamesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @games = Game.all.reverse
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create
    @game.home_name = params[:game][:home_name]
    @game.away_name = params[:game][:away_name]
    @game.user_id = current_user.id
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @source = !!current_user ? "show" : "watch"
  end

  def update
    # updates the score every new inning
    @game = Game.find(params[:id])
    if @game.user_id != current_user.id
      # temporary fix to prevent people from modifying games
      # they are did not start
      redirect_to root_path
    end
    @game.away_score = params[:away_score]
    @game.home_score = params[:home_score]
    @game.read_inning(params[:inning])
    @game.save
    render nothing: true
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy if current_user.id == @game.user_id
    render nothing: true
  end

end