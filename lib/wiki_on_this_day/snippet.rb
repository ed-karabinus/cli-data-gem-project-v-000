class WikiOnThisDay::Snippet
  attr_accessor :year, :link_url, :text, :article_abstract

  def initialize(args)
    self.year = args[:year] if args[:year]
    self.link_url = args[:link_url] if args[:link_url]
    self.text = args[:text].gsub(/\W\(pictured\)/,'') if args[:text]
    self.article_abstract = WikiOnThisDay::Scraper.new(self.link_url).html_doc.css('div#mw-content-text > p').first.text if self.link_url
  end

  def print
    WikiOnThisDay::Printer.new(self).print
  end
end