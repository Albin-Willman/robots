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

  def test_basic_obstacles
    obstacles = [Position.new(40, 40)]
    assert_equal(obstacles, create_world(obstacles: obstacles).obstacles)
  end

  def test_allow_valid_position
    position = Position.new(30, 30)
    assert_equal(true, create_world.allowed_position?(position))
  end

  def create_world(width: 100, height: 100, obstacles: [])
    World.new(width, height, obstacles)
  end
end
