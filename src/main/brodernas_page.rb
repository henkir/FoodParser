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

    def fetch_tmp_page()
      if !wget_page()
        raise IOError, "Failed to execute wget, got #{$?.exitstatus}"
      end
      if !pdf_to_text()
        raise StandardError, "Failed to execute pdftotext, got #{$?.exitstatus}"
      end
    end      

    private

    def wget_page()
      system("wget --quiet --output-document=/tmp/MenyBrodernas.pdf #{@page_location}")
    end

    def pdf_to_text()
      system("pdftotext /tmp/MenyBrodernas.pdf /tmp/MenyBrodernas.txt")
    end

    def get_page_location()
      @page_location
    end
    
    def get_page_tmp_location()
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

    def extract_text(text)
      text = text.strip_tags().consolidate_whitespace()
      replace_characters(text)
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
