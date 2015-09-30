class Round
  def warp(position, world)
    position.x = check_axis(position.x, world.width)
    position.y = check_axis(position.y, world.height)
    position
  end

  private

  def check_axis(value, limit)
    return value if (0..limit).cover?(value)
    limit = limit + 1
    (limit + value) % limit
  end
end
