require 'htmlentities'

module FoodParser

  class Page

    def initialize(page_contents)
      @page = HTMLEntities.new.decode(page_contents)
    end

    def find(start, stop)
      matches = @page.match(/#{start}.*?#{stop}/m)
      @text = matches[0].sub(/#{stop}/, "")
      self
    end

    def strip_tags()
      @text.gsub!(/<[^>]*>/, "")
      self
    end

    def consolidate_whitespace()
      @text.gsub!(/#{160.chr(Encoding::UTF_8)}/, " ")
      @text.gsub!(/[\t\ ]{2,}/, " ")
      @text.gsub!(/\t/, " ")
      @text.gsub!(/\s{2,}/, "\n")
      self
    end

    def text()
      @text
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
