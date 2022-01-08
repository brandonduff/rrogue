module Rrogue
  class Player
    attr_accessor :row, :col

    def to_s
      '@'
    end

    def visible?
      true
    end

    def render
      to_s
    end
  end
end