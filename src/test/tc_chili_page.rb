require 'tc_food_page'
require 'chili_page'
require 'page'

module FoodParser

  class TestChiliPage < TestFoodPage

    def setup()
      super()
    end

    def create_food_page()
      ChiliPage.new(@page_reader)
    end

    def create_page()
      Page.new(read_file("resources/chili-lime.html", "ISO-8859-1"))
    end

    def get_page_location()
      "http://www.chili-lime.se/helaveckan.asp"
    end

    def get_encoding()
      "ISO-8859-1"
    end

    def test_fetches_tmp_page()
      @page_reader.expects(:read_raw_page).with(@page_location, @encoding)
      @food_page.fetch_tmp_page()
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/chili-lime_monday.html", "ISO-8859-1")
      returns_text_for_day(@monday, target_text_monday)
    end

    def test_returns_text_for_thursday()
      target_text_thursday = read_file("resources/chili-lime_thursday.html", "ISO-8859-1")
      returns_text_for_day(@thursday, target_text_thursday)
    end

    def test_returns_text_for_friday()
      target_text_friday = read_file("resources/chili-lime_friday.html", "ISO-8859-1")
      returns_text_for_day(@friday, target_text_friday)
    end

  end
end
