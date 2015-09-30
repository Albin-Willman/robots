class Robot
  DIRECTIONS = ['N', 'E', 'S', 'W'].freeze
  attr_accessor :position, :direction
  def initialize(position, direction)
    @position  = position
    @direction = direction
  end

  def turn_left!
    @direction = DIRECTIONS[DIRECTIONS.index(direction) - 1]
  end
end