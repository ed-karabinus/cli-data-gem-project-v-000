require 'spec_helper'

RSpec.describe WikiOnThisDay do
  # If the fixtures are deleted or VCR generates new cassettes these tests
  # will have to be updated based on current values from:
  # https://en.wikipedia.org (as well as one of the articles linked
  # from the "On This Day" section).

  context 'WikiOnThisDay::Scraper::Article' do

    describe '#article_abstract' do
      it 'correctly scrapes the introductory text from an article' do
        VCR.use_cassette("oliver_cromwell") do
          expect(WikiOnThisDay::Scraper::Article.new("https://en.wikipedia.org/wiki/Oliver_Cromwell").article_abstract).to eq("Oliver Cromwell (25 April 1599 – 3 September 1658)[a] was an English military and political leader and later Lord Protector of the Commonwealth of England, Scotland and Ireland.")
        end
      end
    end

  end

  context 'WikiOnThisDay::Scraper::Homepage' do

    describe '#on_this_day' do
      it 'returns the correct nested hash data from the homepage VCR' do
        VCR.use_cassette("main_page_2015_12_15") do
          expect(WikiOnThisDay::Scraper::Homepage.new.on_this_day).to eq({"Battle of Noryang"=>
          {:year=>"1598",
           :text=>
            "Admiral Yi Sun-sin's Korean navy defeated the Japanese fleet at the Battle of Noryang, the final naval battle of the Imjin War.",
           :link_url=>"https://en.wikipedia.org/wiki/Battle_of_Noryang"},
         "Oliver Cromwell"=>
          {:year=>"1653",
           :text=>
            "Oliver Cromwell (pictured) became Lord Protector of the Commonwealth of England.",
           :link_url=>"https://en.wikipedia.org/wiki/Oliver_Cromwell"},
         "Lithuanian Soviet Socialist Republic"=>
          {:year=>"1918",
           :text=>
            "Vincas Mickevičius-Kapsukas declared the formation of the Lithuanian Soviet Socialist Republic, a puppet state created by Soviet Russia to justify the Lithuanian–Soviet War.",
           :link_url=>
            "https://en.wikipedia.org/wiki/Lithuanian_Soviet_Socialist_Republic_(1918%E2%80%9319)"},
         "Herman Lamm"=>
          {:year=>"1930",
            :text=>
            "Herman Lamm, \"the father of modern bank robbery\", killed himself during a botched robbery attempt in Clinton, Indiana, US, rather than be captured by police.",
           :link_url=>"https://en.wikipedia.org/wiki/Herman_Lamm"},
         "gang-raped on a bus"=>
          {:year=>"2012",
           :text=>
            "A woman in New Delhi was gang-raped on a bus, generating public protests across the country against the Government of India and the Government of Delhi for not providing adequate security for women.",
           :link_url=>"https://en.wikipedia.org/wiki/2012_Delhi_gang_rape"}})
        end
      end
    end

  end

end