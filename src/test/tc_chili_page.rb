require 'tc_food_page'
require 'chili_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestChiliPage < TestFoodPage

    def setup()
      @page_reader = PageReader.new()
      @chili_page = ChiliPage.new(@page_reader)
      @page_uri = "http://www.chili-lime.se/helaveckan.asp"
      @wrong_page_uri = "tp://www.chili-lime.se/helaveckan.asp"
      @monday = 1
      @thursday = 4
      @friday = 5
      @text = read_file("resources/chili-lime.html", "ISO-8859-1")
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      @page_reader.expects(:read_page).returns(@page)
      page = @chili_page.read_page()
      assert(page != "")
    end

    def test_throws_exception_when_malformed_uri()
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        @chili_page.read_page()
      end
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/chili-lime_monday.html", "ISO-8859-1")
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_monday, @chili_page.get_text_for(@monday))
    end

    def test_returns_text_for_thursday()
      target_text_thursday = read_file("resources/chili-lime_thursday.html", "ISO-8859-1")
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_thursday, @chili_page.get_text_for(@thursday))
    end

    def test_returns_text_for_friday()
      target_text_friday = read_file("resources/chili-lime_friday.html", "ISO-8859-1")
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_friday, @chili_page.get_text_for(@friday))
    end

  end
end
