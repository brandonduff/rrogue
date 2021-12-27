module Rendering
  include Curses

  def init
    init_screen
    noecho
    curs_set(0)
  end

  def draw_room(room)
    bwin = Window.new(room.height + 2, room.width + 2, 0, 0)
    bwin.box('*', '*')
    bwin.refresh
    win = bwin.subwin(room.height, room.width, 1, 1)

    room.each do |char|
      win.addch(char.to_s)
    end
    win
  end
end