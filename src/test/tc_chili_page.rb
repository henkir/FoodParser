require 'chili_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestChiliPage < Test::Unit::TestCase

    def setup()
      @page_reader = PageReader.new()
      @chili_page = ChiliPage.new(@page_reader)
      @page_uri = "http://www.chili-lime.se/helaveckan.asp"
      @wrong_page_uri = "tp://www.chili-lime.se/helaveckan.asp"
      @monday = 1
      @friday = 5
      @text = read_file("resources/chili-lime.html")
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
      target_text_monday = read_file("resources/chili-lime_monday.html")
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_monday, @chili_page.get_text_for(@monday))
    end

    def test_returns_text_for_friday()
      target_text_friday = read_file("resources/chili-lime_friday.html")
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      assert_equal(target_text_friday, @chili_page.get_text_for(@friday))
    end

    private

    def read_file(filename)
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/", filename))
      File.open(file_path, "r:ISO-8859-1") do |file|
        file.read().encode("UTF-8", "ISO-8859-1")
      end
    end

  end
end
