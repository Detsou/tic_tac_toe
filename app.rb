require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

our_game = Game.new

our_game.start

while our_game.is_ongoing?
  our_game.menu
  our_game.menu_choice
  our_game.status
end

our_game.end
