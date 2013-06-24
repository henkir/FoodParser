require 'tc_food_page'
require 'cominn_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestComInnPage < TestFoodPage

    def setup()
      super()
      @cominn_page = ComInnPage.new(@page_reader)
      @text = read_file("resources/cominn.html")
      @page = Page.new(@text)
    end

    def test_reads_tmp_page()
      reads_tmp_page(@cominn_page, @page)
    end

    def test_throws_exception_when_malformed_uri()
      throws_exception_when_malformed_uri(@cominn_page)
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/cominn_monday.html")
      returns_text_for_day(@cominn_page, @page, @monday, target_text_monday)
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/cominn_friday.html")
      returns_text_for_day(@cominn_page, @page, @friday, target_text_monday)
    end

  end

end
