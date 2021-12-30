require 'minitest/autorun'
require 'rrogue'

module Rrogue
  class TileTest < Minitest::Test
    def test_shrouded_renders_as_empty_space
      tile = Tile.wall
      tile.mark_shrouded
      assert_equal(' ', tile.render)          
    end

    def test_visible_renders_the_sprite
      tile = Tile.wall
      tile.mark_visible
      assert_equal(tile.to_s, tile.render) 

      tile.mark_shrouded
      assert_equal(tile.to_s, tile.render)    
    end      
  end
end