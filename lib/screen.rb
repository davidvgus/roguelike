# lib/screen.rb

require 'curses'

class Screen
  def initialize(height, width, top, left, 
                 box_sides = "|", box_top_bottom = "-")
    Curses.init_screen()
    @win = Curses::Window.new( height, width, top, left )
    Curses.noecho
    Curses.curs_set(0)
    @win.box(box_sides, box_top_bottom)
  end

  def add_string(x,y,string)
    @win.setpos(x,y)
    @win.addstr(string)
  end

  def get_char
    @win.getch
  end

  def close
    @win.close
  end

  def draw_map map
    map.grid.each_with_index do |line, index|
      row = line.join.gsub("0", " ")
      add_string(index + 1, 1, row)
    end
  end

  def draw_player mob
    x = mob.x + 1
    y = mob.y + 1
    add_string(y, x, mob.character)
  end

  def draw_game(game)
    draw_map game.map
    draw_player game.player
  end

  def refresh
    @win.refresh
  end

end
