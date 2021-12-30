module Rrogue
  class Tile
    attr_accessor :visibility, :seen

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

    def seen?
      @seen
    end

    def mark_visible
      @seen = true
      @visibility = :visible
    end

    def mark_shrouded
      @visibility = :shrouded
    end

    def render
      if visible? || seen?
        to_s
      else
        ' '
      end
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