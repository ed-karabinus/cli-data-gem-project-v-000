class WikiOnThisDay::Scraper::Homepage < WikiOnThisDay::Scraper
  attr_accessor :snippets

  def initialize
    super('https://en.wikipedia.org/wiki/Main_Page')
    @snippets = Array.new
    self.html_doc.search('div#mp-otd div#mp-otd-img + ul li').each do |event|
      @snippets << WikiOnThisDay::Snippet.new(year: event.css('a').first.text, text: event.children.text.split(/ – /)[1], link_url: 'https://en.wikipedia.org' + event.css('b a')[0]["href"])
    end
  end

  def summarize
    self.snippets.each { |snippet| snippet.print }
  end

end