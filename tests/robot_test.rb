require "minitest/autorun"
require "./app/robot"
require "./app/position"

class TestRobot < Minitest::Test
  def test_basic_position
    pos = Position.new(1, 0)
    assert_equal(pos, new_robot(pos: pos).position)
  end

  def test_basic_direction
    assert_equal('N', new_robot.direction)
  end

  def test_turn_left_from_north
    r = new_robot
    r.turn_left!
    assert_equal('W', r.direction)
  end

  def new_robot(pos: Position.new(1, 0), direction: 'N')
    Robot.new(pos, direction)
  end

end