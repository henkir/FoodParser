# -*- coding: utf-8 -*-
require 'chili_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestChiliPage < Test::Unit::TestCase

    def setup()
      @page_reader = PageReader.new()
      @chili_page = ChiliPage.new(@page_reader)
      @page_uri = "http://www.chili-lime.se/helaveckan.asp"
      @wrong_page_uri = "tp://www.chili-lime.se/helaveckan.asp"
      @monday = 1
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/resources/chili-lime.html"))
      @text = File.open(file_path) do |file|
        file.read()
      end
      @page = Page.new(@text)
    end

    # def test_returns_web_page()
    #   @page_reader.expects(:read_page).returns(@page)
    #   page = @chili_page.read_page()
    #   assert(page != "")
    # end

    # def test_throws_exception_when_malformed_uri()
    #   @page_reader.expects(:read_page).raises(PageNotFound)
    #   assert_raise(PageNotFound) do
    #     @chili_page.read_page()
    #   end
    # end

    def test_returns_text_for_monday()
      @page_reader.expects(:read_page).returns(@page)
      @chili_page.read_page()
      @chili_page.get_text_for(@monday)
    end

  end

end
