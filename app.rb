require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/case'

puts "Bienvenue ! Êtes-vous prêts pour un jeu de morpion ?"
puts "Insérez ci-dessous le pseudo du Joueur 1 :"
print "> "
player1_name = gets.chomp
puts "Insérez ci-dessous le pseudo du Joueur 2 :"
print "> "
player2_name = gets.chomp

our_game = Game.new(player1_name, player2_name)

our_game.start

while our_game.is_ongoing?
  our_game.next_player
  our_game.menu
  our_game.menu_choice
  our_game.status
end

our_game.end

puts "Veux-tu refaire une partie ? Oui/Non"
print "> "
input = gets.chomp
  while input == "Oui"
    our_game = Game.new(player1_name, player2_name)
    our_game.start

      while our_game.is_ongoing?
        our_game.next_player
        our_game.menu
        our_game.menu_choice
        our_game.status
      end

    our_game.end
    puts "Veux-tu refaire une partie ? Oui/Non"
    print "> "
    input = gets.chomp
  end
