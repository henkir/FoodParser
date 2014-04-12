require 'main_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestMainPage < Test::Unit::TestCase

    def setup()
      @page_reader = PageReader.new()
      @page = read_file("resources/lunchmenyer")
      @main_page = MainPage.new(@page_reader)
    end

    def test_returns_text()
      @page_reader.expects(:read_page).returns(@page)
      @main_page.read_page()
    end

    def read_file(filename, encoding = "UTF-8")
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/", filename))
      File.open(file_path, "r:#{encoding}") do |file|
        file.read().encode("UTF-8", encoding)
      end
    end

  end

end
