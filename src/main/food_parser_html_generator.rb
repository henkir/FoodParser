#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

class String
  def to_b
    self =~ /^(true|t|yes|y|1)$/i
  end
end

day = -1
if ARGV.length == 0
  day = Time.new.wday
else
  day = ARGV[0].to_i
end

if day < 1 || day > 5
  puts "Day must be between 1 and 5"
  exit 1
end

require 'food_parser_factory'
require 'generic_food_page'
require 'main_page'
require 'page_reader'
require 'html_generator'

include FoodParser

begin
  pages = []
  main_page = MainPage.new(PageReader.new())
  menues = main_page.read_page()
  menues.each do |title, menu|
    if !menu.empty?
      pages.push(GenericFoodPage.new(title, menu))
    end
  end
  pages = pages.sort
  puts HtmlGenerator.new(pages, day).html()
rescue => error
  File.open("/tmp/food_parser.log", 'a') do |file|
    backtrace = error.backtrace.join("\n")
    file.write("#{Time.new} #{error.message} Stacktrace:\n#{backtrace}")
  end
end
