class World
  attr_reader :width, :height, :obstacles 
  def initialize(width, height, obstacles = [])
    @width = width 
    @height = height
    @obstacles = obstacles
  end

  def allowed_position?(position)
    return false if position.x < 0
    return false if position.x > width
    return false if position.y < 0
    return false if position.y > height
    true
  end
end