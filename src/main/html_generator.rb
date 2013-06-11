# -*- coding: utf-8 -*-
require 'date'

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
      day = Date.today
      time = Time.new
      if time.hour > 3
        day += 1
      end
      expire_time = day.to_time
      expire_time += 3 * 60 * 60
      @@header.gsub(/EXPIRE_TIME/, 
                    expire_time.gmtime.strftime('%a, %-d %b %Y %T GMT'))
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
    <meta http-equiv="Cache-Control" content="Public" />
    <meta http-equiv="Expires" content="EXPIRE_TIME" />
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
