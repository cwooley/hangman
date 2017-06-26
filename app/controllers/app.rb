require_relative '../../config/environment'

class App < Sinatra::Base
  get '/' do
    erb :hangman
  end

  get '/hangman' do
    erb :hangman
  end
end
