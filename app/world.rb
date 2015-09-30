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
    return false unless x_range.cover?(position.x)
    return false unless y_range.cover?(position.y)
    true
  end
end