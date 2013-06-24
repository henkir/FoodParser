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
      @page_reader = PageReader.new()
      @brodernas_page = BrodernasPage.new(@page_reader)
      @page_uri = "/tmp/MenyBrodernas.txt"
      @wrong_page_uri = "le:///tmp/MenyBrodernas.txt"
      @monday = 1
      @friday = 5
      @text = read_file("resources/MenyBrodernas.txt")
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      @page_reader.expects(:read_page).returns(@page)
      page = @brodernas_page.read_page()
      assert(page != "")
    end

    def test_throws_exception_when_malformed_uri()
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        @brodernas_page.read_page()
      end
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/MenyBrodernas_monday.txt")
      @page_reader.expects(:read_page).returns(@page)
      @brodernas_page.read_page()
      assert_equal(target_text_monday, @brodernas_page.get_text_for(@monday))
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/MenyBrodernas_friday.txt")
      @page_reader.expects(:read_page).returns(@page)
      @brodernas_page.read_page()
      assert_equal(target_text_monday, @brodernas_page.get_text_for(@friday))
    end

  end

end
