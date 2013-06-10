require 'htmlentities'

module FoodParser

  class Page

    def initialize(page_contents)
      @page = HTMLEntities.new.decode(page_contents)
    end

    def find(start, stop, match_nr)
      negated_stop = negate_pattern(stop)
      matches = @page.match(/#{start}#{negated_stop}#{stop}/)
      @current_element = matches[match_nr].sub(/#{stop}/, "")
      self
    end

    def strip_tags()
      @current_element.gsub!(/<[^>]*>/, "")
      self
    end

    def consolidate_whitespace()
      @current_element.gsub!(/[\t\ ]{2,}/, " ")
      @current_element.gsub!(/\t/, " ")
      @current_element.gsub!(/#{160.chr(Encoding::UTF_8)}/, " ")
      @current_element.gsub!(/\s{2,}/, "\n")
      self
    end

    def text()
      @current_element
    end

    private

    def negate_pattern(pattern)
      escaped_characters = [ '.', '|', '(', ')', '[', ']', '{', '}',
                             '+', '\\', '^', '$', '*', '?', '.', '/' ]
      negated_array = pattern.each_char.map do |char|
        char = "\#{char}" if escaped_characters.include?(char)
        char = "[^#{char}]*"
      end
      negated_array.join
    end

  end

end
