class OnThisDay::Scraper::Article < OnThisDay::Scraper

  def initialize(link_url)
    super(link_url)
  end

  def article_abstract
    self.html_doc.css('div#mw-content-text p').first.text
  end

end