require 'food_page'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestFoodPage < Test::Unit::TestCase

    def read_file(filename, encoding = "UTF-8")
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/", filename))
      File.open(file_path, "r:#{encoding}") do |file|
        file.read().encode("UTF-8", encoding)
      end
    end

  end

end
