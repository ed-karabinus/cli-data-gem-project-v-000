class WikiOnThisDay::CLI

  attr_reader :todays_page

  def initialize
    @todays_page = WikiOnThisDay::Scraper::Homepage.new
    @todays_page.summarize
    print "To learn more about one of these events, enter the year as displayed above. To exit, enter anything else: "
    input = gets.strip
    more_information(input)
  end

  def more_information(year)
    self.todays_page.snippets.each do |snippet|
      if snippet.year == year
        puts ''
        puts snippet.article_abstract
        puts ''
      end
    end
  end

end