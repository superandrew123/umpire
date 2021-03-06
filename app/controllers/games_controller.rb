class GamesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :watch]
  
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
    user = User.find(@game.user_id)
    if current_user == user
      @source = "show"
    else
      @source = "watch" 
    end
  end

  def update
    # updates the score every out
    @game = Game.find(game_params[:id])
    if !@game.my_game?(current_user)
      # prevent someone from modifying games
      # they did not start
    else
      @game.outs = game_params[:outs]
      @game.away_score = game_params[:away_score]
      @game.home_score = game_params[:home_score]
      @game.read_inning(game_params[:inning])
      @game.save
    end
    render nothing: true
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy if current_user && @game.my_game?(current_user)
    render nothing: true
  end

  def watch
    # Allow users to watch games as they're being
    # umped but does not allow games to be modified
    @game = Game.find(game_params[:id])
    respond_to do |format|
      format.js { }
    end
  end

  private
    def game_params
      params.require(:game).permit(:id, :outs, :home_score, :away_score, :inning)
    end
end