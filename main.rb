# main.rb

require 'curses'
require_relative 'lib/map'
require_relative 'lib/game'
require_relative 'lib/mob'
require_relative 'lib/screen'

include Curses

MAP_WINDOW_HEIGHT = 10
MAP_WINDOW_WIDTH = 10
map = Map.new(MAP_WINDOW_HEIGHT, MAP_WINDOW_WIDTH)
game = Game.new(map)
game.map.load(Array.new(MAP_WINDOW_HEIGHT ) {Array.new(MAP_WINDOW_WIDTH) {0}})
game.add_player Mob.new(4, 4, "@", game)
game.start

screen = Screen.new(MAP_WINDOW_HEIGHT + 2, MAP_WINDOW_WIDTH + 2, 0, 0, "|", "=")

#main loop
while game.running do
  screen.draw_game(game)
  input = screen.get_char
  game.process_input(input)
  game.update_world
end

game.stop
screen.close
