require 'string'
require 'test/unit'

class TestString < Test::Unit::TestCase
  
  def test_strips_tags()
    string = "A<b>B"
    assert_equal("AB", string.strip_tags())
  end

  def test_consolidates_tab_and_space()
    string = "A\t "
    assert_equal("A ", string.consolidate_whitespace())
  end

  def test_consolidates_new_line_and_space()
    string = "A\n "
    assert_equal("A\n", string.consolidate_whitespace())
  end

end
