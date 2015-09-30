class Robot
  DIRECTIONS = ['N', 'E', 'S', 'W'].freeze
  attr_accessor :position, :direction
  def initialize(position, direction)
    @position  = position
    @direction = direction
  end

  def turn_left!
    turn!(-1)
  end

  def turn_right!
    turn!(1)
  end

  private

  def turn!(change)
    @direction = DIRECTIONS[(DIRECTIONS.index(direction) + change) % DIRECTIONS.length]
  end
end