Gem::Specification.new do |s|
  s.name        = 'wiki_on_this_day'
  s.version     = '0.1.0'
  s.date        = "2015-12-14"
  s.summary     = "Find out what happened on this day in the past, using Wikipedia!"
  s.description = "This gem scrapes the English Wikipedia Homepage (https://en.wikipedia.org/wiki/Main_Page) and obtains the list of significant historical events (and their abstracts) available there. Optionally, users may select one of the historical events and request the text of the linked article."
  s.authors     = ["Ed Karabinus"]
  s.email       = 'karabinus@uchicago.edu'
  s.files       = ["lib/wiki_on_this_day.rb", "lib/wiki_on_this_day/article.rb", "lib/wiki_on_this_day/homepage.rb", "lib/wiki_on_this_day/printer.rb", "lib/wiki_on_this_day/scraper.rb"]
  s.homepage    = 'http://rubygems.org/gems/wiki_on_this_day'
  s.license     = 'MIT'
end