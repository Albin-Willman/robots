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

  def forward!
    move!(1)
  end

  def backup!
    move!(-1)
  end

  private

  def move!(directionality)
    case direction
    when 'N'
      @position = Position.new(position.x, position.y - directionality)
    when 'S'
      @position = Position.new(position.x, position.y + directionality)
    when 'W'
      @position = Position.new(position.x - directionality, position.y)
    when 'E'
      @position = Position.new(position.x + directionality, position.y)
    end
  end

  def turn!(change)
    @direction = DIRECTIONS[(DIRECTIONS.index(direction) + change) % DIRECTIONS.length]
  end
end