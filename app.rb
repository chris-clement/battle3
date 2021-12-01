require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'

class Battle < Sinatra::Base
  DEFAULT_HP = 10
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do 
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_HP = DEFAULT_HP
    @player_2_HP = DEFAULT_HP
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $player_1 .name
    @player_2_name = $player_2.name 
    erb(:attack)
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end