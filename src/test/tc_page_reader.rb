require 'test/unit'
require 'silence_warnings'
silence_warnings { require 'publicize_methods' }
require 'page_reader'

module FoodParser

  class TestPageReader < Test::Unit::TestCase

    def setup
      @page_reader = PageReader.new()
      @page_uri = "http://www.restauranghusman.se/veckans.html"
      @wrong_page_uri = "tp://www.restauranghusman.se/veckans.html"
    end

    def test_returnsWebPage()
      page = @page_reader.read_page(@page_uri)
      assert(page != "")
    end
    
    def test_throwsExceptionWhenMalformedUri()
      assert_raise(PageNotFound) do
        @page_reader.read_page(@wrong_page_uri)
      end
    end

    def test_throwsExceptionWhenReturnedNothing()
      assert_raise(PageNotFound) do
        PageReader.publicize_methods() do
          @page_reader.expects(:read_page_from_uri).with(@page_uri).returns("")
        end
        @page_reader.read_page(@page_uri)      
      end
    end

  end

end
