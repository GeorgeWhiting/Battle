require 'sinatra/base'
require_relative './player'
require_relative './game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect to('/play')
  end

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    erb :play
  end

  get '/attack' do
    @player1 = $player1.name
    @player2 = $player2.name
    $game = Game.new
    $game.attack($player2)
    erb :attack
  end

  run! if app_file == $0
end
