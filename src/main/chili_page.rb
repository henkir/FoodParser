require 'food_page'

module FoodParser

  class ChiliPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader, "ISO-8859-1")
      @page_location = "http://www.chili-lime.se/helaveckan.asp"
    end

    def get_name()
      "Chili"
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
        "Dagenstips"
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

    def replace_characters(text)
      text.gsub(/\d+\./, "").gsub("&amp;", "&").gsub(/\s{2,}/, "\n")
    end

  end

end
