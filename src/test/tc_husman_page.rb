require 'tc_food_page'
require 'husman_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestHusmanPage < TestFoodPage

    def setup()
      super()
      @husman_page = HusmanPage.new(@page_reader)
      @text = read_file("resources/husman.html")
      @page = Page.new(@text)
    end

    def test_reads_tmp_page()
      reads_tmp_page(@husman_page, @page)
    end

    def test_throws_exception_when_malformed_uri()
      throws_exception_when_malformed_uri(@husman_page)
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/husman_monday.html")
      returns_text_for_day(@husman_page, @page, @monday, target_text_monday)
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/husman_friday.html")
      returns_text_for_day(@husman_page, @page, @friday, target_text_monday)
    end

  end

end
