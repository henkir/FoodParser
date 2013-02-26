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
      @target_text = "Måndag\nMat1\nMat2"
      @search_word = "Måndag"
      @parent = "\nMåndag\n"
      @next_element = "\nMat1\nMat2\n"
      @page = Page.new(@page_contents)
    end

    def test_finds_text()
      assert_equal(@search_word, @page.find(@search_word, 0).text())
    end

    def test_gets_parent()
      @page.find(@search_word, 0)
      assert_equal(@parent, @page.parent().text())
    end

    def test_gets_next_element()
      @page.find(@search_word, 0)
      assert_equal(@next_element, @page.parent().next_element().text())
    end

  end

end
