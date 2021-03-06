# -*- coding: utf-8 -*-

require 'haml'

module FoodParser
  class AfterworkHtmlGenerator

    def initialize(pages, day)
      @pages = pages
      @day = day
      @html = generate_html()
    end

    def html()
      @html
    end

    private

    def generate_html()
      filepath = File.expand_path(File.join(File.dirname(__FILE__), "/", "afterwork.html.haml"))
      html = Haml::Engine.new(File.read(filepath))
      html.render(self)
    end

    def get_title()
      days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      "Afterwork #{days[@day]}"
    end

    def get_randomize_title()
      "Slumpa restaurang"
    end

    def get_page_items(page)
      begin
        page.get_array_for(@day)
      rescue => err
        log_to_file(err)
        ["Ett fel uppstod vid parsning av sidan"]
      end
    end

    def log_to_file(error)
      File.open("/tmp/food_parser.log", 'a') do |file|
        backtrace = error.backtrace.join("\n")
        file.write("#{Time.new} #{error.message} Stacktrace:\n#{backtrace}")
      end
    end

  end
end
