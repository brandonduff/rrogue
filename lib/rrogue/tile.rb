module Rrogue
  class TileRenderer
    def render(tile)
      if tile.visible?
        tile.to_s
      else
        ' '
      end
    end
  end

  class Tile
    attr_accessor :visibility

    def self.space
      new('.')
    end

    def self.wall
      new('#')
    end

    def initialize(sprite)
      @sprite = sprite
    end

    def visible?
      visibility == :visible
    end

    def mark_visible
      @visibility = :visible
    end

    def mark_shrouded
      @visibility = :shrouded
    end

    def render
      TileRenderer.new.render(self)
    end

    def to_s
      @sprite
    end
    
    def space?
      @sprite == '.'
    end

    def wall?
      @sprite == '#'
    end
  end
end