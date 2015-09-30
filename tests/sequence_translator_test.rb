require "minitest/autorun"
require "./app/sequence_translator"

class TestSequenceTranslator < Minitest::Test
  def test_forward
    assert_equal([:forward!], SequenceTranslator.call('f'))
  end

  def test_backward
    assert_equal([:backup!], SequenceTranslator.call('b'))
  end

  def test_left
    assert_equal([:turn_left!], SequenceTranslator.call('l'))
  end

  def test_right
    assert_equal([:turn_right!], SequenceTranslator.call('r'))
  end

  def test_advanced
    assert_equal([:forward!, :forward!, :turn_right!, :turn_right!, :backup!, :backup!, :turn_left! ,:forward!], SequenceTranslator.call('ffrrbblf'))
  end
end

