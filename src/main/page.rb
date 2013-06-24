require 'htmlentities'
require 'string'

module FoodParser

  class Page

    def initialize(page_contents)
      @page = HTMLEntities.new.decode(page_contents)
    end

    def find(start, stop)
      @page.match(/#{start}.*?#{stop}/m)[0].sub(/#{stop}/, "")
    end

  end

end
