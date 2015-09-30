require "minitest/autorun"
require "./app/position"

class TestPosition < Minitest::Test
  def test_x
    assert_equal(1, Position.new(1,0).x)
  end

  def test_y
    assert_equal(1, Position.new(0,1).y)
  end

  def test_equal_true
    pos1 =  Position.new(0,1)
    pos2 =  Position.new(0,1)
    assert_equal(true, pos1.equal?(pos2))
  end

  def test_equal_false
    pos1 =  Position.new(0,1)
    pos2 =  Position.new(1,1)
    assert_equal(false, pos1.equal?(pos2))
  end
end