# -*- coding: utf-8 -*-
require 'food_page'

module FoodParser

  class ChiliPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader)
      @page_location = "http://www.chili-lime.se/helaveckan.asp"
    end
    
    private

    def get_page_location()
      @page_location
    end
    
    def get_target_match(day)
      @days[day]
    end

    def get_target_index()
      0
    end

    def extract_text(page)
      page.parent
      page.parent
      page.parent
      page.next_element.text
    end

  end

end
