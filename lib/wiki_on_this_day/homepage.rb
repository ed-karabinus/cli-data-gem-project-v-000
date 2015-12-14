require 'pry'
require_relative './scraper.rb'

class Scraper::Homepage < Scraper

  def initialize
    super('https://en.wikipedia.org/wiki/Main_Page')
  end

  def on_this_day
    events_hash = {}
    self.html_doc.css('div#mp-otd div#mp-otd-img + ul li').each do |event|
      events_hash[event.css('b a').text] = {}
      events_hash[event.css('b a').text][:year] = event.css('a').first.text
      events_hash[event.css('b a').text][:text] = event.children.text.split(/ – /)[1]
      events_hash[event.css('b a').text][:link_url] = 'https://en.wikipedia.org' + event.css('b a')[0]["href"]
    end
    events_hash
    binding.pry
  end
end

a = Scraper::Homepage.new.on_this_day