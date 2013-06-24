# -*- coding: utf-8 -*-
require 'tc_food_page'
require 'brodernas_page'
require 'page'

module Kernel
  def system(cmd)
    true
  end
end

module FoodParser

  class TestBrodernasPage < TestFoodPage

    def setup()
      super()
    end

    def create_food_page()
      BrodernasPage.new(@page_reader)
    end

    def create_page()
      Page.new(read_file("resources/MenyBrodernas.txt"))
    end

    def get_page_location()
      "http://www.brödernaskök.se/MenyBrodernas.pdf"
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/MenyBrodernas_monday.txt")
      returns_text_for_day(@monday, target_text_monday)
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/MenyBrodernas_friday.txt")
      returns_text_for_day(@friday, target_text_monday)
    end

  end

end
