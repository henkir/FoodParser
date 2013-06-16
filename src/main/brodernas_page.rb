# -*- coding: utf-8 -*-
require 'food_page'

module FoodParser

  class BrodernasPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader)
      @page_location = "http://www.brödernaskök.se/MenyBrodernas.pdf"
      @page_tmp_location = "/tmp/MenyBrodernas.txt"
    end
    
    def get_name()
      "Brödernas kök"
    end

    private

    def get_page_location()
      system("wget --output-document=/tmp/MenyBrodernas.pdf #{@page_location}")
      system("pdftotext /tmp/MenyBrodernas.pdf /tmp/MenyBrodernas.txt")
      @page_tmp_location
    end
    
    def get_target_match(day)
      @days[day]
    end

    def get_target_stop(day)
      if day < 5
        @days[day + 1]
      else
        "Dagens SALLAD"
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
      text.gsub("&#8211;", "-").gsub("&amp;", "&").gsub("\u001E", "&")
        .gsub("&nbsp;", " ").gsub(/\s{2,}/, "\n")
    end

    def remove_unwanted_items(items)
      items.delete_if { |item| item =~ /^Sallad:/ }
    end

  end

end
