# -*- coding: utf-8 -*-
require 'food_page'

module FoodParser

  class ComInnPage < FoodPage
    
    def initialize(page_reader)
      super(page_reader)
      @page_location = "http://www.cominn.nu/veckans-meny/"
      @page_tmp_location = "/tmp/cominn_page.html"
    end
    
    def get_name()
      "ComInn"
    end

    private

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
        "Skriv ut veckans meny"
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
        .gsub("GI & LCHF – ", "").gsub("Eller – ", "")
    end

  end

end
