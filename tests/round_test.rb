require "minitest/autorun"
require "./app/round"
require "./app/world"
require "./app/position"

class TestRound < Minitest::Test
  def test_basic
    pos   = Position.new(2,2)
    world = World.new(100, 100)
    assert_equal(pos, Round.new.warp(pos, world))
  end

  def test_edge
    pos   = Position.new(100,2)
    world = World.new(100, 100)
    assert_equal(pos, Round.new.warp(pos, world))
  end

  def test_wrap_left
    pos      = Position.new(-1, 2)
    expected = Position.new(100, 2)
    world = World.new(100, 100)
    assert_equal(expected, Round.new.warp(pos, world))
  end

  def test_wrap_right
    pos      = Position.new(101, 2)
    expected = Position.new(0, 2)
    world = World.new(100, 100)
    assert_equal(expected, Round.new.warp(pos, world))
  end

  def test_wrap_up
    pos      = Position.new(2, -1)
    expected = Position.new(2, 100)
    world = World.new(100, 100)
    assert_equal(expected, Round.new.warp(pos, world))
  end

  def test_wrap_down
    pos      = Position.new(2, 101)
    expected = Position.new(2, 0)
    world = World.new(100, 100)
    assert_equal(expected, Round.new.warp(pos, world))
  end
end