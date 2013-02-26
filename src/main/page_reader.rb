require 'open-uri'
require_relative 'page'

class PageReader
  
  def read_page(page_uri)
    begin
      page = get_page(page_uri)
    rescue StandardError => e
      raise PageNotFound, e
    end
    if page == ""
      raise PageNotFound
    else
      Page.new(page)
    end
  end
  
  private
  
  def get_page(page_uri)
    open(page_uri) do |file|
      file.read()
    end
  end

end

class PageNotFound < StandardError
end
  
