require 'food_page'

module FoodPages

  class HusmanPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader)
      @page_location = "http://www.restauranghusman.se/veckans.html"
    end
    
    def get_page_location()
      @page_location
    end
    
    def get_target_match()
      @days[Date.today.wday]
    end

    def get_target_index()
      0
    end

  end

end
