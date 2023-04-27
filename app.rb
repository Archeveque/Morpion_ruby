#app.rb
require 'colorize'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
player1 = Player.new("José")
player2 = Player.new("Josianne")

newgame = Game.new
user_choice = "oui"
while user_choice != "non" && user_choice == "oui" do
  newgame.morpion
  print "rejouer ? " 
  print "oui".green
  print "/"
  puts "non".red
  print ">"
  user_choice = gets.chomp
end
