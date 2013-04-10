# main.rb

require 'curses'
require_relative 'lib/map'


include Curses




noecho
curs_set(0)

get_input win do

  win.getch

  case win.getch
  when "k"
    player.move(:up)
    draw_player(player, win)
  when "j"
    player.move_down
    draw_player(player, win)
  when "h"
    player.move_left
    draw_player(player, win)
  when "l"
    player.move_right
    draw_player(player, win)
  when "q"
    exit
  end

  win.setpos(5,3)
  win.addstr "Player Pos x: " << player.x.to_s
  win.setpos(6,3)
  win.addstr "Player Pos y: " << player.y.to_s

end

Curses.init_screen()

win = Curses::Window.new(0,0,0,0) 
win.box("|", "-")

(lines - 2).times do |ln|
  win.setpos(ln + 1, 1)
  win.addstr("." * (cols - 2))
end


#main loop
while game.running? do
  game.draw_world
  game.get_input(win)
  game.update_world
end

win.close
