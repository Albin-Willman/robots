class World
  attr_reader :x_range, :y_range, :width, :height, :obstacles 
  def initialize(width, height, obstacles = [])
    @x_range   = 0..width
    @y_range   = 0..height
    @width     = width
    @height    = height
    @obstacles = obstacles
  end

  def allowed_position?(position)
    return false unless is_in_world?(position)
    return false if is_blocked?(position)
    true
  end

  private

  def is_in_world?(position)
    x_range.cover?(position.x) && y_range.cover?(position.y)
  end

  def is_blocked?(position)
    obstacles.each do |obstacle|
      return true if position.equal?(obstacle)
    end
    false
  end
end