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
    case direction
    when 'N'
      @position = Position.new(position.x, position.y - 1)
    when 'S'
      @position = Position.new(position.x, position.y + 1)
    when 'W'
      @position = Position.new(position.x - 1, position.y)
    when 'E'
      @position = Position.new(position.x + 1, position.y)
    end
  end

  def backup!
    case direction
    when 'N'
      @position = Position.new(position.x, position.y + 1)
    when 'S'
      @position = Position.new(position.x, position.y - 1)
    when 'W'
      @position = Position.new(position.x + 1, position.y)
    when 'E'
      @position = Position.new(position.x - 1, position.y)
    end
  end

  private

  def turn!(change)
    @direction = DIRECTIONS[(DIRECTIONS.index(direction) + change) % DIRECTIONS.length]
  end
end