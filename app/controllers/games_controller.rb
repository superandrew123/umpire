class GamesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end
end