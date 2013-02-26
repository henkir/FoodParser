# -*- coding: utf-8 -*-

module FoodPages

  class FoodPage
    
    def initialize(page_reader)
      @days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      @page_reader = page_reader
    end

    def read_page()
      @page = @page_reader.read_page(get_page_location())
    end

    def get_text_for(day)
      @page.find(get_target_match(), get_target_index())
    end

  end

end
