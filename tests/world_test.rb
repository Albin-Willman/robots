require "minitest/autorun"
require "./app/robot"
require "./app/position"
require "./app/world"

class TestWorld < Minitest::Test

  def test_basic_width
    assert_equal(100, create_world.width)
  end

  def test_basic_heigth
    assert_equal(100, create_world.height)
  end

  def create_world(width: 100, height: 100, obstacles: [])
    World.new(width, height, obstacles)
  end
end
