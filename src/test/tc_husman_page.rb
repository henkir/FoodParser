require 'tc_food_page'
require 'husman_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestHusmanPage < TestFoodPage

    def setup()
      @page_reader = PageReader.new()
      @husman_page = HusmanPage.new(@page_reader)
      @page_uri = "http://www.restauranghusman.se/veckans.html"
      @wrong_page_uri = "tp://www.restauranghusman.se/veckans.html"
      @monday = 1
      @friday = 5
      @text = read_file("resources/husman.html")
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      @page_reader.expects(:read_page).returns(@page)
      page = @husman_page.read_page()
      assert(page != "")
    end

    def test_throws_exception_when_malformed_uri()
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        @husman_page.read_page()
      end
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/husman_monday.html")
      @page_reader.expects(:read_page).returns(@page)
      @husman_page.read_page()
      assert_equal(target_text_monday, @husman_page.get_text_for(@monday))
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/husman_friday.html")
      @page_reader.expects(:read_page).returns(@page)
      @husman_page.read_page()
      assert_equal(target_text_monday, @husman_page.get_text_for(@friday))
    end

  end

end
