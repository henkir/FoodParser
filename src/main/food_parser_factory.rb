require 'food_parser'

module FoodParser

  class FoodParserFactory

    def initialize()
      @food_pages = []
    end

    def add_food_page(food_page)
      @food_pages.push(food_page)
    end

    def create_food_parser()
      FoodParser.new(@food_pages)
    end

  end

end
