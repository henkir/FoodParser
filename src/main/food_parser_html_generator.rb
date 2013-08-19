#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

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
require 'husman_page'
require 'chili_page'
require 'cominn_page'
require 'brodernas_page'
require 'page_reader'
require 'html_generator'

include FoodParser

begin
  husman = HusmanPage.new(PageReader.new())
  chili = ChiliPage.new(PageReader.new())
  cominn = ComInnPage.new(PageReader.new())
  brodernas = BrodernasPage.new(PageReader.new())
  pages = [ husman, chili, cominn, brodernas ]
  pages.each { |page| page.read_tmp_page() }
  puts HtmlGenerator.new(pages, day).html()
rescue => error
  File.open("/tmp/food_parser.log", 'a') do |file|
    backtrace = error.backtrace.join("\n")
    file.write("#{Time.new} #{error.message} Stacktrace:\n#{backtrace}")
  end
end
