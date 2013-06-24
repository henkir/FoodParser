require 'tc_food_page'
require 'chili_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestChiliPage < TestFoodPage

    def setup()
      super()
      @chili_page = ChiliPage.new(@page_reader)
      @text = read_file("resources/chili-lime.html", "ISO-8859-1")
      @page = Page.new(@text)
    end

    def test_reads_tmp_page()
      reads_tmp_page(@chili_page, @page)
    end

    def test_throws_exception_when_malformed_uri()
      throws_exception_when_malformed_uri(@chili_page)
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/chili-lime_monday.html", "ISO-8859-1")
      returns_text_for_day(@chili_page, @page, @monday, target_text_monday)
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_monday, @chili_page.get_text_for(@monday))
    end

    def test_returns_text_for_thursday()
      target_text_thursday = read_file("resources/chili-lime_thursday.html", "ISO-8859-1")
      returns_text_for_day(@chili_page, @page, @thursday, target_text_thursday)
    end

    def test_returns_text_for_friday()
      target_text_friday = read_file("resources/chili-lime_friday.html", "ISO-8859-1")
      returns_text_for_day(@chili_page, @page, @friday, target_text_friday)
    end

  end
end
