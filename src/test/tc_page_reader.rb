require 'test/unit'
require 'silence_warnings'
require 'page_reader'

module FoodParser

  class TestPageReader < Test::Unit::TestCase

    def setup
      @page_reader = PageReader.new()
      @page_uri = "http://www.restauranghusman.se/veckans.html"
      @wrong_page_uri = "tp://www.restauranghusman.se/veckans.html"
    end

    def test_returnsWebPage()
      page = @page_reader.read_page(@page_uri, "UTF-8")
      assert(page != "")
    end
    
    def test_throwsExceptionWhenMalformedUri()
      assert_raise(PageNotFound) do
        @page_reader.read_page(@wrong_page_uri, "UTF-8")
      end
    end

  end

end
