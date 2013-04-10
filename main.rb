# main.rb

require 'curses'
require_relative 'lib/map'

include Curses


#main loop
while game.running? do
  game.draw_world
  game.get_input(win)
  game.update_world
end

win.close
