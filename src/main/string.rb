class String

  def strip_tags()
    gsub(/<[^>]*>/, "")
  end

  def consolidate_whitespace()
    gsub!(/#{160.chr(Encoding::UTF_8)}/, " ")
    gsub!(/[\t\ ]{2,}/, " ")
    gsub!(/\t/, " ")
    gsub(/\s{2,}/, "\n")
  end

end
