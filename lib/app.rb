require 'sinatra/base'
require_relative './player'
require_relative './game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect to('/play')
  end

  get '/play' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    @game = $game
    erb :play
  end

  get '/attack' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    @game = $game
    @game.attack(@game.opposite(@game.current_turn))
    erb :attack
  end

  post '/switch-turns' do
    @game = $game
    @game.next_turn
    redirect to('/play')
  end

  run! if app_file == $0
end
