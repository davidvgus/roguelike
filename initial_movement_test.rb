
require 'curses'
require_relative 'lib/map'


include Curses

MAP_WIDTH = 60
MAP_HEIGHT = 60

class Player

  attr_reader :x, :y

  def initialize(x = 1, y = 1, win)
    @x = x
    @prev_x = x
    @y = y
    @prev_y = y
    @move_vector = {:up => [0, -1],
                    :down => [0, 1],
                    :left => [-1, 0],
                    :right => [1, 0]}
    @win = win
  end

  def set_prev
    @prev_x, @prev_y = @x, @y
  end

  def passable?(x,y)
    x > 0 && x < MAP_WIDTH
    y > 1 && y < MAP_HEIGHT

  end

  def move(direction)
    x_direction, y_direction = @move_vector[direction]
    if passable?(x,y)
     set_prev
     @x += x_direction
     @y += y_direction
    end
  end

  def getpos
    [@x, @y]
  end

  def getprev
    [@prev_x, @prev_y]
  end

  def to_s
    "@"
  end
end

def draw_player(player, win)
  x, y = player.getpos
  px, py = player.getprev
  win.setpos(py, px)
  win.addstr(".")
  win.setpos(y, x)
  win.addstr(player.to_s)
end

Curses.init_screen()

#Curses.start_color
## Determines the colors in the 'attron' below
#Curses.init_pair(COLOR_BLUE,COLOR_BLUE,COLOR_BLACK) 
#Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_BLACK)

win = Curses::Window.new(0,0,0,0) 
win.box("|", "-")

(lines - 2).times do |ln|
  win.setpos(ln + 1, 1)
  win.addstr("." * (cols - 2))
end



player = Player.new(10, 10, win)

noecho
curs_set(0)

class MainWindow

  def initialize(win)
    @win = win
  end

  def draw_legend(player)
   @win.setpos(5,3)
   @win.addstr "Player Pos x: " << player.x.to_s
   @win.setpos(6,3)
   @win.addstr "Player Pos y: " << player.y.to_s
  end

end



main_win = MainWindow.new(win)

loop do

  main_win.draw_legend(player)

  case win.getch
  when "k"
    player.move(:up)
    draw_player(player, win)
  when "j"
    player.move(:down)
    draw_player(player, win)
  when "h"
    player.move(:left)
    draw_player(player, win)
  when "l"
    player.move(:right)
    draw_player(player, win)
  when "q"
    exit
  end

end

win.refresh
win.getch
win.close
