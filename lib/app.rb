require 'sinatra/base'
require_relative './player'
require_relative './game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.game_instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    Game.create_game(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect to('/play')
  end

  get '/play' do
    @player1 = @game.player1.name
    @player2 = @game.player2.name
    erb :play
  end

  get '/attack' do
    @player1 = @game.player1.name
    @player2 = @game.player2.name
    @game.attack(@game.opposite(@game.current_turn))
    redirect to('/gameover') if @game.game_over?
    erb :attack
  end

  post '/switch-turns' do
    @game.next_turn
    redirect to('/play')
  end

  get '/gameover' do
    erb :gameover
  end

  run! if app_file == $0
end
