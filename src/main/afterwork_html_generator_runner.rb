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

require 'generic_food_page'
require 'afterwork_html_generator'

include FoodParser

begin
  pages = []
  afterworks = ["Harrys", "Pitchers", "Horse & Hound", "Bishops", "Nationernas Hus"]
  afterworks.each { |aw| pages.push(GenericFoodPage.new(aw, "")) }
  puts AfterworkHtmlGenerator.new(pages, day).html()
rescue => error
  File.open("/tmp/afterwork.log", 'a') do |file|
    backtrace = error.backtrace.join("\n")
    file.write("#{Time.new} #{error.message} Stacktrace:\n#{backtrace}")
  end
end
