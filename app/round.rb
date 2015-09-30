class Round
  def warp(position, world)
    position = check_x(position, world)
    position = check_y(position, world)
    position
  end

  private

  def check_x(position, world)
    return position if world.x_range.cover?(position.x)
    width = world.width + 1
    position.x = (width + position.x) % width
    position
  end

  def check_y(position, world)
    return position if world.y_range.cover?(position.y)
    height = world.height + 1
    position.y = (height + position.y) % height
    position
  end
end