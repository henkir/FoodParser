require 'nokogiri'

class Page

  def initialize(page_contents)
    @page = Nokogiri::HTML(page_contents)
  end

  def find(search_text, match_nr)
    @current_element = @page.search("[text()*='#{search_text}']")[match_nr]
    self
  end

  def parent()
    @current_element = @current_element.parent()
    self
  end

  def next_element()
    @current_element = @current_element.next_element()
    self
  end

  def text()
    @current_element.text()
  end

end
