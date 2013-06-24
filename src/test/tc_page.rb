require 'page'
require 'test/unit'

module FoodParser

  class TestPage < Test::Unit::TestCase

    def test_finds_text_at_beginning()
      page = Page.new("ABC")
      assert_equal("AB", page.find("A", "C"))
    end

    def test_finds_text_at_end()
      page = Page.new("ABCD")
      assert_equal("BC", page.find("B", "D"))
    end

    def test_finds_text_with_new_lines()
      page = Page.new("A\nBC")
      assert_equal("A\nB", page.find("A", "C"))
    end

  end

end
