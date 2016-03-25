class WikiOnThisDay::Printer
  
  attr_reader :snippet

  def initialize(snippet)
    @snippet = snippet
  end

  def print
    puts snippet.year
    puts snippet.text
  end

end