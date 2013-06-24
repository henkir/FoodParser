require 'open-uri'
require 'page'

module FoodParser

  class PageReader
    
    def read_raw_page(page_uri, encoding = "UTF-8")
      read_page_from_uri(page_uri, encoding)
    end

    def read_page(page_uri, encoding = "UTF-8")
      Page.new(read_page_from_uri(page_uri, encoding).encode("UTF-8", encoding))
    end
    
    private
    
    def read_page_from_uri(page_uri, encoding)
      open(page_uri, "r:#{encoding}") do |file|
        file.read()
      end
    end

  end

end
