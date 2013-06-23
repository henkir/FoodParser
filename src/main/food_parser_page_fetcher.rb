#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'food_parser_factory'
require 'husman_page'
require 'chili_page'
require 'cominn_page'
require 'brodernas_page'
require 'page_reader'
require 'html_generator'

include FoodParser
husman = HusmanPage.new(PageReader.new())
chili = ChiliPage.new(PageReader.new())
cominn = ComInnPage.new(PageReader.new())
brodernas = BrodernasPage.new(PageReader.new())
pages = [ husman, chili, cominn, brodernas ]
threads = []
pages.each do |page|
  thread = Thread.new do
    page.fetch_tmp_page()
  end
  threads.push(thread)
end
threads.each do |thread|
  thread.join()
end
