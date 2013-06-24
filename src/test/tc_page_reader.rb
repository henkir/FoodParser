require 'page_reader'
require 'test/unit'

def open(uri, encoding)
  "ABC"
end

module FoodParser

  class TestPageReader < Test::Unit::TestCase

    def setup
      @page_reader = PageReader.new()
      @page_uri = "A"
    end

    def test_returns_page()
      page = @page_reader.read_page(@page_uri, "UTF-8")
      assert_equal("ABC", page.to_s)
    end

    def test_returns_raw_page()
      page = @page_reader.read_raw_page(@page_uri, "UTF-8")
      assert_equal("ABC", page)
    end


  end

end
