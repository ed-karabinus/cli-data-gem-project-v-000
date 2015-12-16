class OnThisDay::CLI

  attr_reader :todays_page

  def initialize
    @todays_page = WikiOnThisDay::Scraper::Homepage.new
    print_controller = WikiOnThisDay::Printer.new(self.todays_page.html_doc, self.todays_page.on_this_day)
    print_controller.print
    print "To learn more about one of these events, enter the year as displayed above. To exit, enter anything else: "
    input = gets.strip
    more_information(input)
  end

  def more_information(year)
    self.todays_page.on_this_day.each do |key, value|
      if value[:year] == year
        puts ''
        puts WikiOnThisDay::Scraper::Article.new(value[:link_url]).article_abstract
        puts ''
      end
    end
  end

end