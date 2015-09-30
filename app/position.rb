Position = Struct.new(:x, :y) do
  def equal?(other)
    x == other.x && y == other.y
  end
end