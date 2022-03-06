class GamesController < ApplicationController

  before_action :check_user

  def create
    @user_id = params[:userId]
    @user_game = Game.where(user_id: @user_id, date: Date.current()).take
    if @user_game == nil # Create Game
      @todays_word = Word.where(date: Date.current()).take
      Game.create(status: 'playing', user_id: @user_id, date: Date.current(), word_id: @todays_word.id, attempt_number: 0)
      data = {message: 'game created'}
      render json: data
    else  #Retrieve plays
      @user_game_plays = Play.where(game_id: @user_game.id)
      result = {data: @user_game_plays}
      render json: result
    end
  end

  private 
  def check_user
    @user = User.find(params[:userId])
    if @user == nil
      raise Exception.new 'Not a valid userid'
    end
  end

end
