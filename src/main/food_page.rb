# -*- coding: utf-8 -*-

module FoodParser

  class FoodPage
    
    def initialize(page_reader, encoding = "UTF-8")
      @days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      @page_reader = page_reader
      @encoding = encoding
    end

    def fetch_tmp_page()
      page = @page_reader.read_raw_page(get_page_location(), @encoding)
      File.open(get_page_tmp_location(), "w:#{@encoding}") do |file|
        file.write(page)
      end
    end

    def read_tmp_page()
      @page = @page_reader.read_page(get_page_tmp_location(), @encoding)
    end

    def read_page()
      @page = @page_reader.read_page(get_page_location(), @encoding)
    end

    def get_text_for(day)
      start_match = get_target_match(day)
      stop_match = get_target_stop(day)
      text = @page.find(start_match, stop_match)
      extract_text(text)
    end

    def get_array_for(day)
      text = get_text_for(day)
      items = text.split("\n")
      items.shift
      items = remove_unwanted_items(items)
      items
    end

    def get_name()
    end

    private

    def remove_unwanted_items(items)
      items
    end

  end

end
