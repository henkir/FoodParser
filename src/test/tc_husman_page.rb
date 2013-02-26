# -*- coding: utf-8 -*-
require 'husman_page'
require 'page_reader'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestHusmanPage < Test::Unit::TestCase

    def setup()
      @page_reader = PageReader.new()
      @husman_page = HusmanPage.new(@page_reader)
      @page_uri = "http://www.restauranghusman.se/veckans.html"
      @wrong_page_uri = "tp://www.restauranghusman.se/veckans.html"
      @monday = 1
      file_path = File.expand_path(File.join(File.dirname(__FILE__), "/resources/husman.html"))
      @text = File.open(file_path) do |file|
        file.read()
      end
      @page = Page.new(@text)
    end

    def test_returns_web_page()
      @page_reader.expects(:read_page).returns(@page)
      page = @husman_page.read_page()
      assert(page != "")
    end

    def test_throws_exception_when_malformed_uri()
      @page_reader.expects(:read_page).raises(PageNotFound)
      assert_raise(PageNotFound) do
        @husman_page.read_page()
      end
    end

    def test_returns_text_for_monday()
      @page_reader.expects(:read_page).returns(@page)
      @husman_page.read_page()
      @husman_page.get_text_for(@monday)
    end

  end

end
