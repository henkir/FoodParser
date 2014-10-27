require 'nokogiri'
require 'page_reader'

module FoodParser

  class MainPage

    def initialize(page_reader)
      @page_reader = page_reader
      @url = "http://www.mjardevi.se/sv/guiden"
    end

    def read_page()
      @page = Nokogiri::HTML(@page_reader.read_page(@url).to_s)
      restaurants = create_hash()
    end

    private

    def create_hash()
      content = get_content()      
      titles = get_titles(content)
      menues = get_menues(content)
      Hash[titles.zip([""] + menues)]
    end

    def get_content()
      @page.css('div[class="lunchMeny"]')
    end

    def get_titles(content)
      content.css('h4').map { |v| v.text }
    end

    def get_menues(content)
      menues = remove_every_other_element(content.css('p'))
      menues = menues.map { |i| i.to_s.replace_br_tags.strip_tags.consolidate_whitespace.replace_characters.strip }
    end

    def remove_every_other_element(array)
      n = 2
      (n - 1).step(array.size - 1, n).map { |i| array[i] }
    end

  end

end
