# -*- coding: utf-8 -*-

module FoodParser
  class HtmlGenerator

    def initialize(pages, day)
      @html = generate_html(pages, day)
    end

    def html()
      @html
    end

    private

    def generate_html(pages, day)
      html = add_header()
      html += add_day(day)
      pages.each do |page|
        html += add_page(page, day)
      end
      html += add_footer()
    end

    def add_header()
      @@header
    end

    def add_day(day)
      days = ["Söndag", "Måndag", "Tisdag", "Onsdag",
             "Torsdag", "Fredag", "Lördag"]
      "      <h1>Lunch #{days[day]}</h1>
"
    end

    def add_page(page, day)
      html = add_restaurant(page.get_name())
      html += add_menu(page.get_array_for(day))
      html += add_restaurant_end()
    end

    def add_restaurant(name)
      "      <div>
        <h2>#{name}</h2>
"
    end

    def add_menu(items)
      html = '        <ul>
'
      items.each do |item|
        html += "          <li>#{item}</li>
"
      end
      html += '        </ul>
'
      html
    end

    def add_restaurant_end()
      '      </div>
'
    end

    def add_footer()
      @@footer
    end

    @@header =
'<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <meta name="HandheldFriendly" content="True" />
    <title>Lunchmeny</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div>
'

    @@footer = 
'    </div>
  </body>
</html>
'

  end
end
