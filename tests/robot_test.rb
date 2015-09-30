require "minitest/autorun"
require "./app/robot"
require "./app/position"

class TestRobot < Minitest::Test
  def test_basic_position
    pos = Position.new(1, 0)
    assert_equal(pos, Robot.new(pos, 'N').position)
  end

  def test_basic_direction
    pos = Position.new(1, 0)
    assert_equal('N', Robot.new(pos, 'N').direction)
  end

end