require 'tc_food_page'
require 'cominn_page'
require 'page'

module FoodParser

  class TestComInnPage < TestFoodPage

    def setup()
      super()
    end

    def create_food_page()
      ComInnPage.new(@page_reader)
    end

    def create_page()
      Page.new(read_file("resources/cominn.html"))
    end

    def get_page_location()
      "http://www.cominn.nu/veckans-meny/"
    end

    def test_fetches_tmp_page()
      @page_reader.expects(:read_raw_page).with(@page_location, @encoding)
      @food_page.fetch_tmp_page()
    end

    def test_returns_text_for_monday()
      target_text_monday = read_file("resources/cominn_monday.html")
      returns_text_for_day(@monday, target_text_monday)
    end

    def test_returns_text_for_friday()
      target_text_monday = read_file("resources/cominn_friday.html")
      returns_text_for_day(@friday, target_text_monday)
    end

  end

end
