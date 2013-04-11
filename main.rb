# main.rb

require 'curses'
require_relative 'lib/map'
require_relative 'lib/game'
require_relative 'lib/mob'
require_relative 'lib/screen'

include Curses

MAP_WINDOW_HEIGHT = 11
MAP_WINDOW_WIDTH = 11
map = Map.new(MAP_WINDOW_HEIGHT, MAP_WINDOW_WIDTH)
game = Game.new(map)
game.map.load(Array.new(MAP_WINDOW_HEIGHT ) {Array.new(MAP_WINDOW_WIDTH) {0}})
game.add_player Mob.new(4, 4, "@", game)
game.start

screen = Screen.new(MAP_WINDOW_HEIGHT + 2, MAP_WINDOW_WIDTH + 2, 0, 0, "|", "=")
xywin = Screen.new(3, 20, 17, 0, "|", "=")

game_windows = [screen, xywin]


#main loop
while game.running do
  screen.draw_game(game)


  player_x, player_y = game.player.get_coords
  xywin.add_string(1,1,"x:#{player_x} y:#{player_y}        ")

  screen.refresh
  xywin.refresh

  input = screen.get_char
  game.process_input(input)
  game.update_world
end

game.stop
screen.close
