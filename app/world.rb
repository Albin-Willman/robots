class World
  attr_reader :width, :height, :obstacles 
  def initialize(width, height, obstacles = [])
    @width = width 
    @height = height
    @obstacles = obstacles
  end
end