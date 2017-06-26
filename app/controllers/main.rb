require_relative '../../config/environment'

class Main < Sinatra::Base
  set :views, 'app/views'
  get '/' do
    player = Player.new("Charles")
    @hangman = SinHangman.new(player)
    # binding.pry
    erb :'/hangman'
  end

  # get '/hangman' do
  #   erb :hangman
  # end
end
