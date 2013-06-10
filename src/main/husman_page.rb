require 'food_page'

module FoodParser

  class HusmanPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader)
      @page_location = "http://www.restauranghusman.se/veckans.html"
    end
    
    def get_name()
      "Husman"
    end

    private

    def get_page_location()
      @page_location
    end
    
    def get_target_match(day)
      @days[day]
    end

    def get_target_stop(day)
      if day < 5
        @days[day + 1]
      else
        "DAGENS"
      end
    end

    def get_target_index(day)
      0
    end

    def extract_text(page)
      page.strip_tags()
      page.consolidate_whitespace()
      replace_characters(page.text())
    end

    private

    def replace_characters(text)
      text.gsub("&amp;", "&").gsub("\u001E", "&").gsub("&nbsp;", " ").gsub(/\s{2,}/, "\n")
    end

  end

end
