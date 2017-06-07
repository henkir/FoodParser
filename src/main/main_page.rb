require 'nokogiri'
require 'page_reader'

module FoodParser

  class MainPage

    def initialize(page_reader)
      @page_reader = page_reader
      @url = "http://www.mjardevi.se/lunch-menu"
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
      @page.css('div[class="gaia-lunch-menu-wrapper"]')
    end

    def get_titles(content)
      content.css('h4[class="title"]').map { |v| v.text }
    end

    def get_menues(content)
      menues = content.css('ul').map { |ul| ul.css('li')}
      menues = menues.map { |i| i.to_s.gsub('</h5>', '</h5>: ').replace_br_tags.strip_tags.consolidate_whitespace.replace_characters.strip }
    end

    def remove_every_other_element(array)
      n = 2
      0.step(array.size - 1, n).map { |i| array[i] }
    end

  end

end
