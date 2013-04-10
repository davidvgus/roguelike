# screentest.rb

require_relative "lib/screen"

win = Screen.new(10,10, 0, 0)
win2 = Screen.new(10,10,10,10)
win3 = Screen.new(10,10,20,10)
win2.refresh
win3.refresh
win.add_string(1,1, "HI")
win2.add_string(1,1, "there")
win2.refresh
win3.add_string(1,1, "buddy")
win3.refresh
win.get_char
win.close
