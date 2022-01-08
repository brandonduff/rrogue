module Rrogue
  class Entity
    attr_reader :sprite
    attr_accessor :row, :col

    def initialize(sprite)
      @sprite = sprite
    end

    def render
      @sprite
    end

    def passable?
      @sprite != '#'
    end
  end
end