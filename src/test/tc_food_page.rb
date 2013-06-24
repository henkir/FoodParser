require 'food_page'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestFoodPage < Test::Unit::TestCase

    def setup()
      @monday = 1
      @thursday = 4
      @friday = 5
      @page_reader = PageReader.new()
    end

    def reads_tmp_page(food_page, expected_page)
      @page_reader.expects(:read_page).returns(@page)
      page = food_page.read_page()
      assert_equal(expected_page, page)
    end

    def throws_exception_when_malformed_uri(food_page)
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        food_page.read_page()
      end
    end

    def returns_text_for_day(food_page, page, day, target_text)
      @page_reader.expects(:read_page).returns(page)
      food_page.read_page()
      assert_equal(target_text, food_page.get_text_for(day))
    end

    def read_file(filename, encoding = "UTF-8")
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/", filename))
      File.open(file_path, "r:#{encoding}") do |file|
        file.read().encode("UTF-8", encoding)
      end
    end

  end

end
