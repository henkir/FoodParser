class String

  def replace_br_tags()
    gsub(/<br[^>]*>/, "\n")
  end

  def strip_tags()
    gsub(/<[^>]*>/, "")
  end

  def consolidate_whitespace()
    gsub!(/#{160.chr(Encoding::UTF_8)}/, " ")
    gsub!(/[\t\ ]{2,}/, " ")
    gsub!(/\t/, " ")
    gsub(/\s{2,}/, "\n")
  end

  def replace_characters()
    gsub("&amp;", "&").gsub("\u001E", "&").gsub("&nbsp;", " ")
  end

end
