require "minitest/autorun"
require "./app/walls"
require "./app/world"
require "./app/position"

class TestWalls < Minitest::Test
  def test_basic
    pos   = Position.new(2,2)
    world = World.new(100, 100)
    assert_equal(pos, Walls.new.warp(pos, world))
  end
end