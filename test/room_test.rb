require 'minitest/autorun'
require 'rrogue'

module Rrogue
  class RoomTest < Minitest::Test
  	def test_construction
      room = Room.new(3, 2)
      assert_equal(3, room.height)
      assert_equal(2, room.width)
    end	

    def test_enumerating
      room = Room.new(3, 5)

      assert_equal(15, room.entries.length)
    end

    def test_moving
      player = Player.new
      room = Room.new(3, 3)
      room.put(2, 2, player)

      room.move(player, 1, 1)

      assert_equal(player, room.at(1, 1))
      assert(room.at(2, 2).space?)
      assert_equal(1, player.row)
      assert_equal(1, player.col)
    end

    def test_disallow_moving_into_walls
      player = Player.new
      room = Room.new(3, 3)
      room.put(1, 1, player)

      # moving out of bounds
      room.move(player, -1, 1)
      room.move(player, 1, 3)
      room.move(player, 3, 1)
      room.move(player, 1, -1)

      # moving into surrounding wall sprite
      room.move(player, 0, 0)

      assert_equal(player, room.at(1, 1))
      assert_equal(1, player.row)
      assert_equal(1, player.col)
    end

    def test_marking_tiles_around_the_player_visible
      player = Player.new
      room = Room.new(4, 4)
      room.put(0, 0, player)

      room.move(player, 2, 2)

      refute(room.at(0, 0).visible?)
      assert(room.at(2, 1).visible?)

      assert(room.at(2,3).visible?)
      assert(room.at(1, 2).visible?)
      assert(room.at(3, 2).visible?)
    end
  end
end