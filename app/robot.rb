class Robot
  DIRECTIONS = ['N', 'E', 'S', 'W'].freeze
  attr_accessor :position, :direction
  attr_reader :world
  def initialize(position, direction, world)
    @position  = position
    @direction = direction
    @world     = world
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
    new_position = next_position(directionality)
    return false unless world.allowed_position?(new_position)
    @position = new_position
  end

  def turn!(change)
    @direction = DIRECTIONS[(DIRECTIONS.index(direction) + change) % DIRECTIONS.length]
  end

  def next_position(directionality)
    case direction
    when 'N'
      Position.new(position.x, position.y - directionality)
    when 'S'
      Position.new(position.x, position.y + directionality)
    when 'W'
      Position.new(position.x - directionality, position.y)
    when 'E'
      Position.new(position.x + directionality, position.y)
    end
  end
end


