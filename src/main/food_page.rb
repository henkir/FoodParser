# -*- coding: utf-8 -*-

module FoodParser

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
      @page = @page.find(get_target_match(day), get_target_index())
      extract_text(@page)
    end

  end

end
