# -*- coding: utf-8 -*-

module FoodParser

  class FoodPage
    
    def initialize(page_reader, encoding = "UTF-8")
      @days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      @page_reader = page_reader
      @encoding = encoding
    end

    def read_page()
      @page = @page_reader.read_page(get_page_location(), @encoding)
    end

    def get_text_for(day)
      start_match = get_target_match(day)
      stop_match = get_target_stop(day)
      match_index = get_target_index(day)
      @page.find(start_match, stop_match, match_index)
      extract_text(@page)
    end

  end

end
