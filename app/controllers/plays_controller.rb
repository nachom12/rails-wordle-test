class PlaysController < ApplicationController
  before_action :check_word_length

  def create
    @user_id = params[:userId]
    @attemptedWord = word_params
    @user_game = Game.where(user_id: @user_id, date: Date.current()).take
    if @user_game == nil # Create game
      data = {message: 'you have to start a game first'}
      render json: data
    else # Check word
      if @user_game.attempt_number == 6 or @user_game.status != 'playing' # TODO: insert this in a beforeaction
        data = {message: 'game over', result: @user_game.status}
      else
        Play.create(game_id: @user_game.id, attempted_word: @attemptedWord)
        @user_game.update(attempt_number: @user_game.attempt_number + 1)
        word_array = @attemptedWord.to_s.split(%r{\s*})
        @word_of_the_day = Word.where(id: @user_game.word_id).take.word
        word_of_the_day_array = @word_of_the_day.to_s.split(%r{\s*})
        result, hasWon = compare_words(word_array, word_of_the_day_array)
        if hasWon
          @user_game.update(status: 'won')
        elsif @user_game.attempt_number == 6
          @user_game.update(status: 'lost')
        end
        data = {result: result}
      end
      render json: data
    end
  end

  private
  def word_params
    params.require(:word)
  end

  def check_word_length
    if word_params.size != 5
      raise Exception.new 'Not a valid word'
    end
  end
  
  def compare_words(array1 , array2)
    p array1
    p array2
    
    result = []
    hasWon = true
    for i in 0..4 do
      if array1[i] == array2[i]
        res_i = {i => 'green'}
      else
        if array2.include?(array1[i]) # TODO: check if this letter was a green one in the attempted word
          res_i = {i => 'yellow'}
          hasWon = false
        else
          res_i = {i => 'red'}
          hasWon = false
        end
      end
    result.push(res_i)
    end
    return result, hasWon
  end

end