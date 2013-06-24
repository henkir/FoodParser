require 'tc_food_page'
require 'brodernas_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module Kernel
  def system(cmd)
  end
end

module FoodParser

  class TestBrodernasPage < TestFoodPage

    def setup()
      super()
      @brodernas_page = BrodernasPage.new(@page_reader)
      @text = read_file("resources/MenyBrodernas.txt")
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      reads_tmp_page(@brodernas_page, @page)
    end

    def test_throws_exception_when_malformed_uri()
      throws_exception_when_malformed_uri(@brodernas_page)
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/MenyBrodernas_monday.txt")
      returns_text_for_day(@brodernas_page, @page, @monday, target_text_monday)
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/MenyBrodernas_friday.txt")
      returns_text_for_day(@brodernas_page, @page, @friday, target_text_monday)
    end

  end

end
