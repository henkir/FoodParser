require 'food_page'

module FoodParser

  class FoodParser

    def initialize(food_pages)
      @food_pages = food_pages
    end

    def get_text_for(day)
      text = ""
      @food_pages.each do |food_page|
        food_page.read_page()
        text += food_page.get_name() + "\n"
        text += food_page.get_text_for(day) + "\n"
      end
      text
    end

  end

end
