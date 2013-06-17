# -*- coding: utf-8 -*-

module FoodParser
  class HtmlGenerator

    def initialize(pages, day)
      @pages = pages
      @html = generate_html(day)
    end

    def html()
      @html
    end

    private

    def generate_html(day)
      html = add_header()
      html += add_day(day)
      @pages.each do |page|
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
      html = add_randomizer()
      html += @@footer
      html
    end

    def add_randomizer()
      checkboxes = add_checkboxes()
      js_array = add_js_array()
      "      <div id=\"choose\">
        <h2>Slumpa restaurang</h2>
#{checkboxes}
        <script type=\"text/javascript\" onload=\"checkCookie()\">
          function uncheckRestaurants() {
            var allRestaurants = document.forms[0].elements;
            for (var i = 0; i < allRestaurants.length; i++) {
              allRestaurants[i].checked = false;
            }
          }
          function checkRestaurants() {
            var allRestaurants = document.forms[0].elements;
            var cookie = \"\";
            for (var i = 0; i < allRestaurants.length; i++) {
              if (allRestaurants[i].checked) {
                cookie += i;
              }
            }
            if (cookie != \"\") {
              document.cookie = cookie;
            }
          }
          function checkCookie() {
            if (document.cookie != null && document.cookie != \"\") {
              uncheckRestaurants();
              parts = document.cookie.split(\" \")
              var allRestaurants = document.forms[0].elements;
              for (var i = 0; i < parts.length; i++) {
                var index = parseInt(parts[i]);
                if (index >= 0 && index < allRestaurants.length) {
                  var restaurant = allRestaurants[index];
                  restaurant.checked = true;
                }
              }
            }
          }
          function chooseRestaurant() {
            var checkedRestaurants = [];
            var allRestaurants = document.forms[0].elements;
            for (var i = 0; i < allRestaurants.length; i++ ) {
               if(allRestaurants[i].checked == true) {
                 checkedRestaurants[checkedRestaurants.length] = allRestaurants[i];
               }
            }
            index=Math.floor(Math.random()*checkedRestaurants.length);
            document.getElementById(\"chosen\").innerHTML = checkedRestaurants[index].value;
          }
        </script>
        <button onclick=\"chooseRestaurant()\">Slumpa</button>
        <div id=\"chosen\"></div>
      </div>
"
    end

    def add_checkboxes()
      page_names = []
      @pages.each { |page| page_names.push(page.get_name()) }
      indent = "        "
      checkboxes = "#{indent}<form>\n"
      page_names.each_index do |i|
        checkboxes += "#{indent}  <input type=\"checkbox\" id=\"restaurant#{i}\" checked=\"checked\" value=\"#{page_names[i]}\" onclick=\"checkRestaurant()\" /> #{page_names[i]}<br />\n"
      end
      checkboxes += "#{indent}</form>"
      checkboxes
    end

    def add_js_array()
      page_names = []
      @pages.each { |page| page_names.push(page.get_name()) }
      js_array = "var restaurants = new Array();\n"
      indent = "          "
      page_names.each_index do |i|
        js_array += "#{indent}restaurants[#{i}] = \"#{page_names[i]}\";\n"
      end
      js_array
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
