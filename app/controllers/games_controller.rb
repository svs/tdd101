class GamesController < ApplicationController
  def index
  end

  def create
    Game.create(params[:game])
    render nothing: true
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(params[:game])
    render nothing: true
  end
end
