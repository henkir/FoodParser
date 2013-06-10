require 'open-uri'
require 'page'

module FoodParser

  class PageReader
    
    def read_page(page_uri, encoding = "UTF-8")
      begin
        wrap_page_from_uri(page_uri, encoding)
      rescue StandardError => e
        raise PageNotFound, e
      end
    end
    
    private
    
    def wrap_page_from_uri(page_uri, encoding)
      Page.new(read_page_from_uri(page_uri, encoding).encode("UTF-8", encoding))
    end

    def read_page_from_uri(page_uri, encoding)
      open(page_uri, "r:#{encoding}") do |file|
        file.read()
      end
    end

  end

  class PageNotFound < StandardError
  end
  
end
