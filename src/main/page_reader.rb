require 'open-uri'
require 'page'

module FoodParser

  class PageReader
    
    def read_page(page_uri)
      begin
        wrap_page_from_uri(page_uri)
      rescue StandardError => e
        raise PageNotFound, e
      end
    end
    
    private
    
    def wrap_page_from_uri(page_uri)
      page = read_page_from_uri(page_uri)
      if page == ""
        raise PageNotFound
      else
        Page.new(page)
      end
    end

    def read_page_from_uri(page_uri)
      open(page_uri) do |file|
        file.read()
      end
    end

  end

  class PageNotFound < StandardError
  end
  
end
