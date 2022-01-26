module Rrogue
  class Tile
    attr_accessor :visibility, :seen, :entity

    def self.space
      new(".")
    end

    def self.wall
      new("#")
    end

    def initialize(sprite)
      @entity = Entity.new(sprite)
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
        @entity.render
      else
        " "
      end
    end

    def passable?
      @entity.passable?
    end
  end
end
