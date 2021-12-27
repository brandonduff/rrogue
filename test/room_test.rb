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
  end
end