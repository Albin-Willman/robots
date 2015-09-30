require "minitest/autorun"
require "./app/position"

class TestPosition < Minitest::Test
  def test_x
    assert_equal(1, Position.new(1,0).x)
  end

  def test_y
    assert_equal(1, Position.new(0,1).x)
  end
end