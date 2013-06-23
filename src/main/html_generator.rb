# -*- coding: utf-8 -*-

require 'haml'

module FoodParser
  class HtmlGenerator

    def initialize(pages, day)
      @pages = pages
      @day = day
      @html = generate_html()
    end

    def html()
      @html
    end

    private

    def generate_html()
      html = Haml::Engine.new(File.read('/home/henrik/repository/food_parser/src/main/lunch.html.haml'))
      html.render(self)
    end

    def get_title()
      days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      "Lunch #{days[@day]}"
    end

    def get_randomize_title()
      "Slumpa restaurang"
    end

    def get_page_items(page)
      page.get_array_for(@day)
    end

  end
end
