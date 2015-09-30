require "minitest/autorun"
require "./app/robot"
require "./app/position"
require "./app/world"

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

  def test_turn_left_from_west
    r = new_robot(direction: 'W')
    r.turn_left!
    assert_equal('S', r.direction)
  end

  def test_turn_left_from_south
    r = new_robot(direction: 'S')
    r.turn_left!
    assert_equal('E', r.direction)
  end

  def test_turn_right_from_north
    r = new_robot
    r.turn_right!
    assert_equal('E', r.direction)
  end

  def test_turn_right_from_west
    r = new_robot(direction: 'W')
    r.turn_right!
    assert_equal('N', r.direction)
  end

  def test_turn_right_from_south
    r = new_robot(direction: 'S')
    r.turn_right!
    assert_equal('W', r.direction)
  end

  def test_move_forward_north
    r = new_robot
    r.forward!
    assert_equal(4, r.position.x)
    assert_equal(3, r.position.y)
  end

  def test_move_forward_south
    r = new_robot(direction: 'S')
    r.forward!
    assert_equal(4, r.position.x)
    assert_equal(5, r.position.y)
  end

  def test_move_forward_west
    r = new_robot(direction: 'W')
    r.forward!
    assert_equal(3, r.position.x)
    assert_equal(4, r.position.y)
  end

  def test_move_forward_east
    r = new_robot(direction: 'E')
    r.forward!
    assert_equal(5, r.position.x)
    assert_equal(4, r.position.y)
  end


  def test_move_backup_north
    r = new_robot
    r.backup!
    assert_equal(4, r.position.x)
    assert_equal(5, r.position.y)
  end

  def test_move_backup_south
    r = new_robot(direction: 'S')
    r.backup!
    assert_equal(4, r.position.x)
    assert_equal(3, r.position.y)
  end

  def test_move_backup_west
    r = new_robot(direction: 'W')
    r.backup!
    assert_equal(5, r.position.x)
    assert_equal(4, r.position.y)
  end

  def test_move_backup_east
    r = new_robot(direction: 'E')
    r.backup!
    assert_equal(3, r.position.x)
    assert_equal(4, r.position.y)
  end


  def test_move_outside_world_north
    r = new_robot(pos: Position.new(4, 0))
    r.forward!
    assert_equal(4, r.position.x)
    assert_equal(0, r.position.y)
  end

  def test_move_outside_world_south
    r = new_robot(pos: Position.new(4, 100), direction: 'S')
    r.forward!
    assert_equal(4, r.position.x)
    assert_equal(100, r.position.y)
  end

  def test_move_outside_world_west
    r = new_robot(pos: Position.new(0, 40), direction: 'W')
    r.forward!
    assert_equal(0, r.position.x)
    assert_equal(40, r.position.y)
  end

  def test_move_outside_world_east
    r = new_robot(pos: Position.new(100, 40), direction: 'E')
    r.forward!
    assert_equal(100, r.position.x)
    assert_equal(40, r.position.y)
  end

  def test_move_blocked_by_obstacle_north
    r = new_robot(pos: Position.new(30, 31))
    r.forward!
    assert_equal(30, r.position.x)
    assert_equal(31, r.position.y)
  end

  def test_move_blocked_by_obstacle_south
    r = new_robot(pos: Position.new(30, 29), direction: 'S')
    r.forward!
    assert_equal(30, r.position.x)
    assert_equal(29, r.position.y)
  end

  def test_move_blocked_by_obstacle_west
    r = new_robot(pos: Position.new(31, 30), direction: 'W')
    r.forward!
    assert_equal(31, r.position.x)
    assert_equal(30, r.position.y)
  end

  def test_move_blocked_by_obstacle_south
    r = new_robot(pos: Position.new(29, 30), direction: 'E')
    r.forward!
    assert_equal(29, r.position.x)
    assert_equal(30, r.position.y)
  end

  def test_first_sharp_test_case
    r = new_robot(pos: Position.new(0, 0), direction: 'S')
    r.execute_sequence!('fflff')
    assert_equal(2, r.position.x)
    assert_equal(2, r.position.y)
  end

  def test_second_sharp_test_case
    world = World.new(50, 50)
    r = new_robot(pos: Position.new(1, 1), direction: 'N', world: world)
    r.execute_sequence!('fflff')
    assert_equal(1, r.position.x)
    assert_equal(0, r.position.y)
  end

  def new_robot(pos: Position.new(4, 4), direction: 'N', world: create_world)
    Robot.new(pos, direction, world)
  end

  def create_world(width: 100, height: 100, obstacles: [Position.new(30, 30)])
    World.new(width, height, obstacles)
  end
end
