require 'curses'
include Curses

Curses.init_screen()

Curses.start_color
# Determines the colors in the 'attron' below
Curses.init_pair(COLOR_BLUE,COLOR_BLUE,COLOR_BLACK) 
Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_BLACK)

my_str = "LOOK! PONIES!"
win = Curses::Window.new(0,0,0,0) 
win.box("|", "-")
win.setpos(2,3)

loop do
  case Curses.getch

  when "j"
    Curses.clear
    Curses.setpos(0,0)
    # Use colors defined color_init
    Curses.attron(color_pair(COLOR_RED)|A_NORMAL){
      Curses.addstr("Page Up")
    }
  when "k"
    Curses.clear
    Curses.setpos(0,0)
    Curses.attron(color_pair(COLOR_BLUE)|A_NORMAL){
      Curses.addstr("Page Down")
    }
    
    Curses.attron(color_pair(COLOR_RED)|A_NORMAL){
      Curses.addstr("aaaaah!")
    }
  when "q"
    exit
  end

end


win.refresh
win.getch
win.close
