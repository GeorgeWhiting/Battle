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
    erb :play
  end

  post '/switch-turns' do
    @game.attack(@game.opposite)
    redirect to('/gameover') if @game.game_over?
    @game.next_turn
    redirect to('/play')
  end

  get '/gameover' do
    erb :gameover
  end

  run! if app_file == $0
end
