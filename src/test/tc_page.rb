# -*- coding: utf-8 -*-
require 'page'
require 'test/unit'
require 'mocha/setup'

module FoodParser

  class TestPage < Test::Unit::TestCase

    def setup()
      @page_contents = "
<html>
<head>
<title>Mat</title>
</head>
<body>
<font>
<b>Måndag</b>
</font>
<p>
   Mat1
		Mat2
</p>
</body>
</html>"
      @target_text = "Måndag</b>\n</font>\n<p>\n   Mat1\n\t\tMat2\n"
      @stripped_target_text = "Måndag\n\n\n   Mat1\n\t\tMat2\n"
      @trimmed_target_text = "Måndag\nMat1\nMat2\n"
      @start_text = "Måndag"
      @stop_text = "</p>"
      @parent = "\nMåndag\n"
      @next_element = "\nMat1\nMat2\n"
      @page = Page.new(@page_contents)
    end

    def test_finds_text()
      page = Page.new("ABC")
      page.find("A", "C")
      assert_equal("AB", page.text())
    end

    def test_strips_text()
      @page.find(@start_text, @stop_text)
      assert_equal(@stripped_target_text, @page.strip_tags().text())
    end

    def test_consolidates_whitespace()
      @page.find(@start_text, @stop_text).strip_tags()
      assert_equal(@trimmed_target_text, @page.consolidate_whitespace().text())
    end

  end

end
