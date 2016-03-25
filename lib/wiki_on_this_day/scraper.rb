class WikiOnThisDay::Scraper
  attr_reader :html_doc

  def initialize(page_url)
    @html_doc = Nokogiri::HTML(open(page_url))
  end

end