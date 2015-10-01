require "minitest/autorun"
require "./app/robot"
require "./app/printer"
require "./app/position"
require "./app/world"
require "./app/round"
require "./app/walls"

class TestRobot < Minitest::Test
  def test_small_world_north
    out, err = capture_io do
      Printer.new.call(setup_robot)
    end
    assert_equal('', err)
    assert_equal("....\n.^..\n....\n....\n", out)
  end

  def test_small_world_east
    out, err = capture_io do
      Printer.new.call(setup_robot(direction: 'E'))
    end
    assert_equal('', err)
    assert_equal("....\n.>..\n....\n....\n", out)
  end

  def test_small_world_west
    out, err = capture_io do
      Printer.new.call(setup_robot(direction: 'W'))
    end
    assert_equal('', err)
    assert_equal("....\n.<..\n....\n....\n", out)
  end

  def test_small_world_south
    out, err = capture_io do
      Printer.new.call(setup_robot(direction: 'S'))
    end
    assert_equal('', err)
    assert_equal("....\n.v..\n....\n....\n", out)
  end

  def test_small_world_obstacles
    out, err = capture_io do
      Printer.new.call(setup_robot(obstacles: [Position.new(2,2)]))
    end
    assert_equal('', err)
    assert_equal("....\n.^..\n..O.\n....\n", out)
  end

  def setup_robot(direction: 'N', obstacles: [])
    world = World.new(3, 3, obstacles)
    pos = Position.new(1, 1)
    Robot.new(pos, direction, world)
  end
end