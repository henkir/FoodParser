#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'food_parser_factory'
require 'husman_page'
require 'chili_page'
require 'cominn_page'
require 'brodernas_page'
require 'main_page'
require 'page_reader'

include FoodParser
factory = FoodParserFactory.new()
factory.add_food_page(HusmanPage.new(PageReader.new()))
factory.add_food_page(ChiliPage.new(PageReader.new()))
factory.add_food_page(ComInnPage.new(PageReader.new()))
factory.add_food_page(BrodernasPage.new(PageReader.new()))
food_parser = factory.create_food_parser()
1.upto(5) do |i|
  puts food_parser.get_text_for(i)
  sleep 1
end
