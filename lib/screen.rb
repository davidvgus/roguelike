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

  def refresh
    @win.refresh if @win
  end

  def get_char
    @win.getch
  end

  def close
    @win.close
  end

end
