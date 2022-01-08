module Rendering
  include Curses

  def init
    init_screen
    noecho
    curs_set(0)
  end

  def draw_room(room, view)
    room.each_with_object(view.subwin(room.height, room.width, 1, 1)) do |tile, win|
      tile.visible? ? win.attron(Curses::A_BOLD) { win.addch(tile.render) } : win.addch(tile.render)
    end
  end
end