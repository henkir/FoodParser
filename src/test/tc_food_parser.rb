require_relative '../main/food_parser'
require 'test/unit'

module FoodPages

  class TestFoodParser < Test::Unit::TestCase

    def setup()
      @food_parser = FoodParser.new()
      @page_uri = "http://www.google.com"
      @text_with_blank_lines = "a\n\nb\n  \nc"
      @text_without_blank_lines = "a\nb\nc"
    end

    def test_returnsWebPage()
      assert(@food_parser.read_web_page(@page_uri) != "")
    end

    def test_removes_blank_lines()
      assert_equal(@text_without_blank_lines,
                   @food_parser.remove_blank_lines(@text_without_blank_lines))
    end

  end

end
