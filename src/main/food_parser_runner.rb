#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'food_parser_factory'
require 'husman_page'
require 'chili_page'
require 'page_reader'

include FoodParser
factory = FoodParserFactory.new()
factory.add_food_page(HusmanPage.new(PageReader.new()))
factory.add_food_page(ChiliPage.new(PageReader.new()))
food_parser = factory.create_food_parser()
puts food_parser.get_text_for(1)



