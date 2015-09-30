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
    return false if is_blocked?(position)
    true
  end

  private

  def is_blocked?(position)
    obstacles.each do |obstacle|
      return true if position.equal?(obstacle)
    end
    false
  end
end