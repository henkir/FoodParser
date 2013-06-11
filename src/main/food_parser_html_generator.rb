#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

if ARGV.length != 1
  puts "Requires day number as argument"
  exit 1
end
day = ARGV[0].to_i
if day < 1 || day > 5
  puts "Day must be between 1 and 5"
  exit 2
end

require 'food_parser_factory'
require 'husman_page'
require 'chili_page'
require 'page_reader'
require 'html_generator'

include FoodParser
husman = HusmanPage.new(PageReader.new())
chili = ChiliPage.new(PageReader.new())
husman.read_page()
chili.read_page()
pages = [ husman, chili ]
puts HtmlGenerator.new(pages, day).html()
