require 'spec_helper'

RSpec.describe WikiOnThisDay do
  # If the fixtures are deleted or VCR generates new cassettes these tests
  # will have to be updated based on current values from:
  # https://en.wikipedia.org (as well as one of the articles linked
  # from the "On This Day" section).

  context 'WikiOnThisDay::Snippet' do

    describe '#article_abstract' do
      it 'correctly scrapes the introductory text from an article' do
        VCR.use_cassette("oliver_cromwell") do
          expect(WikiOnThisDay::Snippet.new(link_url: "https://en.wikipedia.org/wiki/Oliver_Cromwell").article_abstract).to eq("Oliver Cromwell (25 April 1599 – 3 September 1658)[a] was an English military and political leader and later Lord Protector of the Commonwealth of England, Scotland and Ireland.")
        end
      end
    end

  end

  context 'WikiOnThisDay::Scraper::Homepage' do

    describe 'summarize' do
      it 'prints the correct data from the homepage VCR' do
        VCR.use_cassette("main_page_2015_12_15") do
          expect { WikiOnThisDay::Scraper::Homepage.new.summarize }.to output("1410
The Yongle Emperor launched the first of his military campaigns against the Mongols, resulting in the fall of the Mongol khan Bunyashiri.
1807
The Slave Trade Act became law, abolishing the slave trade in the British Empire.
1917
Following the overthrow of the Russian tsar Nicholas II, Georgia's bishops unilaterally restored the autocephaly of the Georgian Orthodox Church.
1949
The Soviet Union began mass deportations of more than 90,000 people from the Baltic states to Siberia.
2006
A gunman in Seattle, Washington, US, entered a rave afterparty and opened fire, killing six and wounding two, before committing suicide.
").to_stdout
        end
      end
    end

  end

end