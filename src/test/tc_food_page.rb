require 'food_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestFoodPage < Test::Unit::TestCase

    def setup()
      @monday = 1
      @thursday = 4
      @friday = 5
      @page_reader = PageReader.new()
      @food_page = create_food_page()
      @page = create_page()
      @page_location = get_page_location()
      @encoding = get_encoding()
      @encoding = "UTF-8" if @encoding.nil?
    end

    def create_food_page()
    end

    def create_page()
    end

    def get_page_location()
    end

    def get_encoding()
    end

    def test_reads_tmp_page()
      return if @food_page.nil?
      @page_reader.expects(:read_page).returns(@page)
      page = @food_page.read_page()
      assert_equal(@page, page)
    end

    def returns_text_for_day(day, target_text)
      @page_reader.expects(:read_page).returns(@page)
      @food_page.read_page()
      assert_equal(target_text, @food_page.get_text_for(day))
    end

    def read_file(filename, encoding = "UTF-8")
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/", filename))
      File.open(file_path, "r:#{encoding}") do |file|
        file.read().encode("UTF-8", encoding)
      end
    end

  end

end
