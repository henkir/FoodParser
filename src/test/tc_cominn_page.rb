require 'tc_food_page'
require 'cominn_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestComInnPage < TestFoodPage

    def setup()
      @page_reader = PageReader.new()
      @cominn_page = ComInnPage.new(@page_reader)
      @page_uri = "http://www.cominn.nu/veckans-meny/"
      @wrong_page_uri = "tp://www.cominn.nu/veckans-meny/"
      @monday = 1
      @friday = 5
      @text = read_file("resources/cominn.html")
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      @page_reader.expects(:read_page).returns(@page)
      page = @cominn_page.read_page()
      assert(page != "")
    end

    def test_throws_exception_when_malformed_uri()
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        @cominn_page.read_page()
      end
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/cominn_monday.html")
      @page_reader.expects(:read_page).returns(@page)
      @cominn_page.read_page()
      assert_equal(target_text_monday, @cominn_page.get_text_for(@monday))
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/cominn_friday.html")
      @page_reader.expects(:read_page).returns(@page)
      @cominn_page.read_page()
      assert_equal(target_text_monday, @cominn_page.get_text_for(@friday))
    end

  end

end
