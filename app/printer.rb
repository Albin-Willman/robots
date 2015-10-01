require "./app/position"
class Printer
  DIRECTIONS = {
    'N' => '^',
    'W' => '<',
    'S' => 'v',
    'E' => '>'
  }

  def call(robot)
    world = robot.world
    build_world(world, robot).each do |line|
      puts line.join('')
    end
  end

  private

  def build_world(world, robot)
    world.y_range.map do |y|
      world_line(y, world, robot)
    end
  end

  def world_line(y, world, robot)
    world.x_range.map do |x|
      pos = Position.new(x, y)
      position_char(pos, world, robot)
    end
  end

  def position_char(pos, world, robot)
    return DIRECTIONS[robot.direction] if robot.position.equal?(pos)
    return 'O' if world.is_blocked?(pos)
    '.'
  end
end
