
require_relative '../config/environment.rb'

## Read data on players
JSON_Handler.read_existing_players

Hangman.welcome

game = Hangman.new

game.full_game


##Store data once game is over
JSON_Handler.make_json
