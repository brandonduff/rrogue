module Rendering
  include Curses

  def init
    init_screen
    noecho
    curs_set(0)
  end

  def draw_room(room, view)
    renderer = Rrogue::TileRenderer.new
    room.each_with_object(view.subwin(room.height, room.width, 1, 1)) do |tile, win|
      win.addch(tile.render)
    end
  end
end